title=FoundationDB
tags=storage, distributed, key-value
summary=An open source, distributed, transactional key-value store.
~~~~~~

[Website](https://www.foundationdb.org/) | [Source](https://github.com/apple/foundationdb/) | [Docs](https://apple.github.io/foundationdb/)

FoundationDB is a distributed database designed to handle large volumes of structured data across clusters of commodity servers. It organizes data as an ordered key-value store and employs ACID transactions for all operations. It is especially well-suited for read/write workloads but also has excellent performance for write-intensive workloads. Users interact with the database using a API language binding. You can begin local development today.

# Data Modeling
FoundationDB's core provides a simple data model coupled with powerful transactions. This combination allows building richer data models and libraries that inherit the scalability, performance, and integrity of the database. The goal of data modeling is to design a mapping of data to keys and values that enables effective storage and retrieval. Good decisions will yield an extensible, efficient abstraction. This document covers the fundamentals of data modeling with FoundationDB.

* For general guidance on application development using FoundationDB, see :doc:`developer-guide`. 
* For detailed API documentation specific to each supported language, see :doc:`api-reference`.

The core data model
===================

FoundationDB's core data model is an ordered key-value store. Also known as an ordered associative array, map, or dictionary, this is a common data structure composed of a collection of key-value pairs in which all keys are unique. Starting with this simple model, an application can create higher-level data models by mapping their elements to individual keys and values.

In FoundationDB, both keys and values are simple byte strings. Apart from storage and retrieval, the database does not interpret or depend on the content of values. In contrast, keys are treated as members of a total order, the lexicographic order over the underlying bytes, in which keys are sorted by each byte in order. For example:

* ``'0'`` is sorted before ``'1'``
* ``'apple'`` is sorted before ``'banana'``
* ``'apple'`` is sorted before ``'apple123'``
* keys starting with ``'mytable\'`` are sorted together (e.g. ``'mytable\row1'``, ``'mytable\row2'``, ...)

The ordering of keys is especially relevant for range operations. An application should structure keys to produce an ordering that allows efficient data retrieval with range reads.

.. _encoding-data-types:

Encoding data types
===================

Because keys and values in FoundationDB are always byte strings, an application developer must serialize other data types (e.g., integers, floats, arrays) before storing them in the database. For values, the main concerns for serialization are simply CPU and space efficiency. For keys, there's an additional consideration: it's often important for keys to preserve the order of the data types (whether primitive or composite) they encode. For example:

Integers
--------

* The standard tuple layer provides an order-preserving, signed, variable length encoding.
* For positive integers, a big-endian fixed length encoding is order-preserving.
* For signed integers, a big-endian fixed length two's-complement encoding with the most significant (sign) bit inverted is order-preserving.

Unicode strings
---------------

* For unicode strings ordered lexicographically by unicode code point, use UTF-8 encoding.  (This approach is used by the tuple layer.)
* For unicode strings ordered by a particular collation (for example, a case insensitive ordering for a particular language), use an appropriate string collation transformation and then apply UTF-8 encoding.  Internationalization or "locale" libraries in most environments and programming languages provide a string collation transformation, for example `C <http://pubs.opengroup.org/onlinepubs/7908799/xsh/wcsxfrm.html>`_, `C++ <http://www.cplusplus.com/reference/std/locale/collate/transform/>`_, `Python <http://docs.python.org/py3k/library/locale.html#locale.strxfrm>`_, `Ruby <https://github.com/ninjudd/icunicode#readme>`_, `Java <http://docs.oracle.com/javase/1.5.0/docs/api/java/text/Collator.html#getCollationKey(java.lang.String)>`_, the `ICU <http://icu-project.org/apiref/icu4c/classCollator.html#ae524fd43a06d4429e2c76bef35874d4c>`_ library, etc.  Usually the output of this function is a unicode string, which needs to be further encoded in a code-point ordered encoding such as UTF-8 to get a byte string.

Floating point numbers
----------------------

The tuple layer provides an order-preserving, signed, fixed length encoding for both single- and double-precision floating point
numbers based off of the IEEE big-endian encoding with some modifications to make it correctly ordered. Within this representation,
-0 and +0 are not equal and negative NaN values will sort before all non-NaN values and positive NaN values will sort after
all non-NaN values. Otherwise, the representation is consistent with the mathematical ordering.

Composite types
---------------

An application's data is often represented using composite types, such as structures or records with multiple fields. It's very useful for the application to use *composite* keys to store such data. In FoundationDB, composite keys can be conveniently represented as *tuples* that are mapped to individual keys for storage.

.. note:: For the purpose of illustration, we'll use the FoundationDB's Python language binding, including the :py:func:`@fdb.transactional <fdb.transactional>` decorator described in :doc:`api-python`. The design patterns illustrated are applicable to all of the :doc:`languages <api-reference>` supported by FoundationDB.

.. _data-modeling-tuples:

Tuples
======

FoundationDB's keys are ordered, making tuples a particularly useful tool for data modeling. FoundationDB provides a :ref:`tuple layer <api-python-tuple-layer>` (available in each language binding) that encodes tuples into keys. This layer lets you store data using a tuple like ``(state, county)`` as a key. Later, you can perform reads using a prefix like ``(state,)``. The layer works by preserving the natural ordering of the tuples.

You could implement a naive encoding of tuples of strings into keys by using a tab character as a simple delimiter. You could do this with the following Python code::

    def tuple_to_key_with_tab(tup):
        return '\t'.join(str(i) for i in tup)

    # Example: Order first by state, then by county
    @fdb.transactional
    def set_county_population(tr, state, county, pop):
        tr[tuple_to_key_with_tab((state, county))] = str(pop)

In this example, population figures for the United States are stored using keys formed from the tuple of state and county.

Of course, this encoding would only work if all the bytes in the individual keys in the tuple were greater than the delimiter byte. Therefore, FoundationDB's built-in tuple layer implements a more robust encoding supporting elements of various data types: byte strings, unicode strings, signed integers, floating-point numbers, booleans, UUIDs, null values, and nested tuples.

.. note:: The tuple layer's encoding is compatible between languages, although some languages are limited in what data types they support. For language-specific documentation of the tuple layer, see the corresponding :doc:`api-reference` documentation.

Because of its ordering of keys, FoundationDB supports efficient range reads on any set of keys that share a prefix. The tuple layer preserves the ordering of tuples sorted by element from left to right; as a result, the leftmost elements of a tuple will always represent a prefix in keyspace and can be used for range reads. A basic principle of data modeling with the tuple layer is to order tuple elements to facilitate such range reads. The examples below illustrate this principle.

Sometimes data attributes will have a natural order of containment imposed by your domain. A common example is geographic attributes, such as state and county in the Unites States. By constructing keys from tuples of the form ``(state, county)``, where state is the first tuple element, all data for states will be stored in an adjacent range of keys. This ordering allows you to retrieve the populations for all counties in a given state with a single range read. You could use the tuple layer with the following functions::

    @fdb.transactional
    def set_county_population(tr, state, county, pop):
        tr[fdb.tuple.pack((state, county))] = str(pop)

    @fdb.transactional
    def get_county_populations_in_state(tr, state):
        return [int(pop) for k, pop in tr[fdb.tuple.range((state,))]]

Date/timestamp attributes form another example with a natural containment order. If you have attributes of year, month, day, hour, minute, and/or second, you can order them from larger to smaller units in your keys. As a result, you'll be able to retrieve temporally contiguous data with range reads, as above.

A few simple models
===================

Let's begin with a few examples of simple data models built on tuples with :ref:`subspaces <developer-guide-sub-keyspaces>`.

Arrays
------

You can easily map arrays to the key-value store using tuples. To model a named, one-dimensional array, you can construct a key for each array element using the array name as the subspace and the array index as the second tuple element.

For example, suppose you have a ``'temps2012'`` array containing a year's worth of daily temperature averages. The temperatures are indexed by an integer ranging from 1 to 365 representing the day. Your keys would then be constructed from tuples of the form ``('temps2012', day)``. 

To set and get array elements with this technique, you can use Python functions such as::

    @fdb.transactional
    def array_set(tr, array_space, index, value):
        tr[array_space[index]] = str(value)

    @fdb.transactional
    def array_get(tr, array_space, index):
        return tr[array_space[index]]

    temp_array = Subspace(('temps2012',))

    @fdb.transactional
    def add_temp(tr, day, temp):
        array_set(tr, temp_array, day, temp)

    @fdb.transactional
    def get_temp(tr, day):
        val = array_get(tr, temp_array, day)
        if val.present():
            return int(val)
        else:
            return None

This approach has a few nice properties:

* It can be extended to multidimensional arrays simply by adding additional array indexes to the tuples.
* Unassigned elements consume no storage, so sparse arrays are stored efficiently.

The tuple layer makes these properties easy to achieve, and most well-designed data models using tuples will share them.

An array can only have a single value for each index. Likewise, the key-value store can only have a single value for each key. The simple mapping above takes advantage of this correspondence to store the array value as a physical value. In contrast, some data structures are designed to store multiple values. In these cases, data models can store the logical values within the key itself, as illustrated next.

Multimaps
---------
A multimap is a generalization of an associative array in which each key may be associated with multiple values. Multimaps are often implemented as associative arrays in which the values are sets rather than primitive data types.

Suppose you have a multimap that records student enrollment in classes, with students as keys and classes as values. Each student can be enrolled in more than one class, so you need to map the key-value pairs of the multimap (with their multiple values) to the database. 

A simple approach is to use the multimap name (say, ``'enroll'``) as the subspace and construct a key from a tuple of the form ``('enroll', student, class_name)`` for each class in which a student is enrolled. Each class will generate a unique key, allowing as many classes as needed. Moreover, all the data in the multimap will be captured in the key, so you can just use an empty string for its value. Using this approach, you can add a class for a student or get all the student's classes with the Python functions::

    @fdb.transactional
    def multi_set(tr, multi_space, index, value):
        tr[multi_space.pack((index, value))] = ''

    @fdb.transactional
    def multi_get(tr, multi_space, index):
        pairs = tr[multi_space.range((index,))]
        return [multi_space.unpack(k)[-1] for k, v in pairs]

    @fdb.transactional
    def multi_is_element(tr, multi_space, index, value):
        val = tr[multi_space.pack((index, value))]
        return val.present()

    enroll_space = Subspace(('enroll',))

    @fdb.transactional
    def add_class(tr, student, class_name):
        multi_set(tr, enroll_space, student, class_name)

    @fdb.transactional
    def get_classes(tr, student):
        return multi_get(tr, enroll_space, student)

The ``range()`` method in :py:func:`multi_get` returns all keys in the subspace that encode tuples with the specified tuple as a prefix. The ``[-1]`` extracts the last element of the tuple unpacked from the key, which in this case will encode a class.

As this model for multimaps illustrates, data that is treated as a value at one level may be mapped to a key in the database. (The reverse may also occur, as shown in the discussion of indirection below.) Data modeling in FoundationDB is not dictated by how your data is represented in your programming language.

.. _data-modeling-tables:

Tables
------

You can easily use tuples to store data in tabular form with rows and columns. The simplest data model for a table is to make each cell in the table a key-value pair. To do this, you construct a key from a tuple containing the row and column identifiers. As with the array model, unassigned cells in tables constructed using this technique will consume no storage, so sparse tables can be stored efficiently. As a result, a table can safely have a very large number of columns.

You can make your model row-oriented or column-oriented by placing either the row or column first in the tuple, respectively. Because the lexicographic order sorts tuple elements from left to right, access is optimized for the element placed first. Placing the row first makes it efficient to read all the cells in a particular row; reversing the order makes reading a column more efficient.

Using the table name as the subspace, we could implement the common row-oriented version in Python as follows::

    @fdb.transactional
    def table_set_cell(tr, table_space, row, column, value):
        tr[table_space.pack((row, column))] = str(value)

    @fdb.transactional
    def table_get_cell(tr, table_space, row, column):
        return tr[table_space.pack((row, column))]
    
    @fdb.transactional
    def table_set_row(tr, table_space, row, cols):
        del tr[table_space.range((row,))]
        for c, v in cols.iteritems():
            table_set_cell(tr, table_space, row, c, v)

    @fdb.transactional
    def table_get_row(tr, table_space, row):
        cols = {}
        for k, v in tr[table_space.range((row,))]:
            _, c = table_space.unpack(k)
            cols[c] = v
        return cols


Versionstamps
-------------

A common data model is to index your data with a sequencing prefix to allow log scans or tails of recent data. This index requires a unique, monotonically increasing value, like an AUTO_INCREMENT PRIMARY KEY in SQL. This could be implemented at the client level by reading the value for conflict checks before every increment. A better solution is the versionstamp, which can be generated at commit-time with no read conflict ranges, providing a unique sequence ID in a single conflict-free write.

Versioning commits provides FoundationDB with MVCC guarantees and transactional integrity. Versionstamps write the transaction's commit version as a value to an arbitrary key as part of the same transaction, allowing the client to leverage the version's unique and serial properties.  Because the versionstamp is generated at commit-time, the versionstamped key cannot be read in the same transaction that it is written, and the versionstamp's value will be unknown until the transaction is committed. After the transaction is committed, the versionstamp can be obtained.

The versionstamp guarantees uniqueness and monotonically increasing values for the entire lifetime of a single FDB cluster. This is even true if the cluster is restored from a backup, as a restored cluster will begin at a higher version than when the backup was taken. Special care must be taken when moving data between two FoundationDB clusters containing versionstamps, as the differing cluster versions might break the monotonicity.

There are two concepts of versionstamp depending on your context. At the fdb_c client level, or any binding outside of the Tuple layer, the 'versionstamp' is 10 bytes: the transaction's commit version (8 bytes) and transaction batch order (2 bytes). The user can manually add 2 additional bytes to provide application level ordering. The tuple layer provides a useful api for getting and setting both the 10 byte system version and the 2 byte user version. In the context of the Tuple layer, the 'versionstamp' is all 12 bytes. For examples on how to use the versionstamp in the python binding, see the :doc:`api-python` documentation.

.. _data-modeling-entity-relationship:

Entity-relationship models
==========================

Entity-relationship models are often used to describe a database at various levels of abstraction. In this methodology, a *logical* data model consisting of entities, attributes, and relationships is defined before mapping it to a *physical* data models specifying keys and other implementation features. Entity-relationship models can be easily modeled in FoundationDB using tuples. 

Attributes
----------

Suppose you're storing entity-relationship data for users in an ``'ER'`` subspace. You might identify each entity with a unique identifier and define a key for each attribute with the tuple ``('ER', entity_ID, attribute)``. You could then store the user's region using the Python functions::

    ER_space = Subspace(('ER',))

    @fdb.transactional
    def add_attribute_value(tr, entity_ID, attribute, value):
        tr[ER_space.pack((entity_ID, attribute))] = str(value)

    @fdb.transactional
    def get_attribute_value(tr, entity_ID, attribute):
        return tr[ER_space.pack((entity_ID, attribute))]

    @fdb.transactional
    def add_user_region(tr, user_ID, region):
        add_attribute_value(tr, user_ID, 'region', region)

Relationships
-------------

Using the pattern we saw above with multimaps, you can store relationships and related entities as an element of the key and use an empty string as the physical value. Suppose your users can belong to one or more groups. To add a user to a group or retrieve all groups to which a user belongs, you can use the Python functions::

    @fdb.transactional
    def add_relationship(tr, relationship, primary_key, foreign_key):
        tr[ER_space.pack((relationship, primary_key, foreign_key))] = ''

    @fdb.transactional
    def get_relationships(tr, relationship):
        return [ER_space.unpack(k)[1:] 
                for k, v in tr.get_range_startswith(ER_space.pack((relationship,)), 
                                            streaming_mode=fdb.StreamingMode.want_all)]

    @fdb.transactional
    def get_related_entities(tr, relationship, primary_key):
        items = tr[ER_space.range((relationship, primary_key))]
        return [ER_space.unpack(k)[-1] for k, v in items]

    @fdb.transactional
    def is_related_entity(tr, relationship, primary_key, foreign_key):
        return tr[ER_space.pack((relationship, primary_key, foreign_key))].present()

    @fdb.transactional
    def add_user_to_group(tr, user_ID, group_name):
        add_relationship(tr, 'belongs_to', user_ID, group_name)

    @fdb.transactional
    def get_users_groups(tr, user_ID):
       return get_related_entities(tr, 'belongs_to', user_ID)

You can extend this code by adding indexes for the related entities (see below) and enforcement of relationship cardinalities (one-to-many, etc.).

.. _data-modeling-indexes:

Indexes
=======

A common technique is to store the same data in different ways to allow efficient retrieval for multiple use cases, creating indexes. This technique is especially useful when there are many more reads than writes. For example, you may find it most convenient to store user data based on ``user_ID`` but sometimes need to retrieve users based on their region. An index allows this retrieval to be performed efficiently.

An index can have a very simple tuple structure consisting of an unique subspace, the relationship being indexed, and a value: ``(subspace_for_index, relationship, value)``. Placing the relationship before the value is what allows efficient retrieval of all the associated values with a single range read.

With FoundationDB's transactions, you can easily build an index and guarantee that it stays in sync with the data: just update the index in the same transaction that updates the data.


For example, suppose you'd like to add an index to efficiently look up users by region. You can augment the Python function :py:func:`add_user` with the index and add a new function for retrieval::

    user_space = Subspace(('user',))
    region_index = Subspace(('region_idx',))

    @fdb.transactional
    def add_user(tr, user_ID, name, region):
        tr[user_space.pack((user_ID, region))] = str(name)
        tr[region_index.pack((region, user_ID))] = ''

    @fdb.transactional
    def get_users_in_region(tr, region):
        items = tr[region_index.range((region,))]
        return [region_index.unpack(k)[-1] for k, v in items]

To apply this technique to a real use case, you would add code to your update transaction to delete outdated index entries. Note that this approach lets you add as many indexes as desired by updating all the indexes in the same transaction.

Composite models
================

Most of the techniques we've discussed can be freely combined. Let's look at adding indexes to our basic data model for tables.

We've already seen a way to store tabular data in a row-oriented order using table names as subspaces. You can extend this model by simultaneously storing the table in both row-oriented and column-oriented layouts, allowing efficient retrieval of either an entire row or an entire column. We'll create nested subspaces for the indexes using the subscripting syntax we saw above::

    table_space = Subspace(('table',))
    row_index = table_space['row_idx']
    col_index = table_space['col_idx']

    @fdb.transactional
    def table_set_cell(tr, row_index, col_index, row, column, value):
        tr[row_index.pack((row, column))] = str(value)
        tr[col_index.pack((column, row))] = str(value)

    @fdb.transactional
    def table_get_cell(tr, row_index, row, column):
        return tr[row_index.pack((row, column))]

    @fdb.transactional
    def table_get_row(tr, row_index, row):
        cols = {}
        for k, v in tr[row_index.range((row,))]:
            r, c = row_index.unpack(k)
            cols[c] = v
        return cols

    @fdb.transactional
    def table_get_col(tr, col_index, col):
        rows = {}
        for k, v in tr[col_index.range((col,))]:
            c, r = col_index.unpack(k)
            rows[r] = v
        return rows


.. _data-modeling-hierarchies:

Hierarchies
===========

Many applications work with hierarchical data represented by nested dictionaries or similar composite data types. Such data is often serialized to or deserialized from a format such as JSON or XML. Looking at a hierarchical object as a tree, you can use a tuple to represent the full path to each leaf (sometimes called  a "materialized path"). By storing each full path as a key, you get an index for each leaf. FoundationDB can then efficiently retrieve any individual piece of data or entire sub-tree.

For example, suppose you have hierarchical data such as the following nested dictionaries and lists::

    {'user': {  'jones': 
                {   'friendOf': 'smith',
                    'group': ['sales', 'service']},
                'smith': 
                {   'friendOf': 'jones',
                    'group': ['dev', 'research']}}}

To distinguish the list elements from dictionary elements and preserve the order of the lists, you can just include the index of each list element before it in the tuple. Using this technique, the data above would be converted to the following tuples::

    [('user', 'jones', 'friendOf', 'smith'), 
    ('user', 'jones', 'group', 0, 'sales'), 
    ('user', 'jones', 'group', 1, 'service'), 
    ('user', 'smith', 'friendOf', 'jones'), 
    ('user', 'smith', 'group', 0, 'dev'), 
    ('user', 'smith', 'group', 1, 'research')]

Suppose you'd like to use this representation to implement a nested keyspace, i.e., a key-value store in which values can themselves be nested dictionaries or lists. Your application receives a stream of serialized JSON objects in which different objects may contain data about the same entities, so you'd like to store the data in a common nested keyspace.

You can deserialize the data using Python's standard ``json`` module, generate the corresponding set of paths as tuples, and store each tuple in a ``'hier'`` subspace::

    import json, itertools

    hier_space = Subspace(('hier',))

    EMPTY_OBJECT = -2
    EMPTY_ARRAY = -1

    def to_tuples(item):
        if item == {}:
            return [(EMPTY_OBJECT, None)]
        elif item == []:
            return [(EMPTY_ARRAY, None)]
        elif type(item) == dict:
            return [(k,) + sub for k, v in item.iteritems() for sub in to_tuples(v)]
        elif type(item) == list:
            return [(k,) + sub for k, v in enumerate(item) for sub in to_tuples(v)]
        else:
            return [(item,)]

    @fdb.transactional
    def insert_hier(tr, hier):
        if type(hier) == str:
            hier = json.loads(hier)
        for tup in to_tuples(hier):
            tr[hier_space.pack(tup)] = ''

You can then retrieve any sub-tree from the nested keyspace by giving the partial path to its root. The partial path will just be a tuple that your query function uses as a key prefix for a range read. For example, to retrieve the data for ``'smith'`` from the hierarchy above, you would use ``('user', 'smith')``.

The retrieved data will be a list of tuples. The final step before returning the data is to convert it back to a nested data structure::

    def from_tuples(tuples):
        first = tuples[0]  # The first tuple will tell us what kind of object we have

        if len(first) == 1: return first[0]  # Primitive value
        if first == (EMPTY_OBJECT,None): return {}
        if first == (EMPTY_ARRAY, None): return []

        # For an object or array, we need to group the tuples by their first element
        groups = [list(g) for k, g in itertools.groupby(tuples, lambda t:t[0])]
    
        if first[0] == 0:   # array
            return [from_tuples([t[1:] for t in g]) for g in groups]
        else:    # object
            return dict((g[0][0], from_tuples([t[1:] for t in g])) for g in groups)

    @fdb.transactional
    def get_sub_hier(tr, prefix):
        return from_tuples([hier_space.unpack(k)
                            for k, v in tr[hier_space.range(prefix)]])

.. _data-modeling-documents:

Documents
=========

Suppose you'd like to use the above representation to implement a simple document-oriented data model. As before, your application receives serialized data in JSON, only now you'd like to store each JSON object as an independent document. To do so, you just need to ensure that each tuple created for that object is stored with a unique identifier for the document. If a ``doc_id`` has not already been supplied, you can randomly generate one. 

To store a path, you can construct a composite key in a ``'doc'`` subspace, with the ``doc_id`` as the next element, followed by the remainder of the path. You can store the leaf (the last element of the tuple) as the value, which enables storage of larger data sizes (see :ref:`data-modeling-performance-guidelines`)::

    import random

    doc_space = Subspace(('doc',))

    @fdb.transactional
    def insert_doc(tr, doc):
        if type(doc) == str:
            doc = json.loads(doc)
        if not 'doc_id' in doc:
            doc['doc_id'] = random.randint(0, 100000000)
        for tup in to_tuples( doc ):
            tr[doc_space.pack((doc['doc_id'],) + tup[:-1])] = fdb.tuple.pack((tup[-1],))
        return doc['doc_id']

    @fdb.transactional
    def get_doc(tr, doc_id):
        return from_tuples([doc_space.unpack(k)[1:] + fdb.tuple.unpack(v)
                            for k, v in tr[doc_space.range((doc_id,))]])

.. _data-modeling-indirection:

Indirection
===========
It is sometimes beneficial to add a level of indirection to a data model. Instead of using key-value pairs to directly store application data, you can instead store a reference to that data. This approach can be used to model any data structure that would normally use references. You just need to perform any modifications to the data structure in a transaction that leaves it in a consistent state.

Suppose you want to maintain data in a singly linked list. The application data can use a tuple structure like those of single-valued relationships. Links will be similar but will use node identifiers as their values. Here is an example of removing the next node from the list::

    node_space = Subspace(('node',))

    @fdb.transactional
    def remove_next_node(tr, node_ID):
        next_ID = tr[node_space.pack((node_ID, 'next'))]
        if next_ID != '':
            next_next_ID = tr[node_space.pack((next_ID, 'next'))]
            tr[node_space.pack((node_ID, 'next'))] = next_next_ID
            del tr[node_space.range((next_ID,))]

FoundationDB's transactional guarantees ensure that, even when multiple clients are concurrently modifying the same linked list, the structure will be maintained in a consistent way.

.. _data-modeling-performance-guidelines:

Key and value sizes
===================

How you map your application data to keys and values can have a dramatic impact on performance. Below are some guidelines to consider as you design a data model. (For more general discussion of performance considerations, see :ref:`developer-guide-peformance-considerations`.)

* Structure keys so that range reads can efficiently retrieve the most frequently accessed data.

  * If you perform a range read that is, in total, much more than 1 kB, try to restrict your range as much as you can while still retrieving the needed data.

* Structure keys so that no single key needs to be updated too frequently, which can cause transaction conflicts.

  * If a key is updated more than 10-100 times per second, try to split it into multiple keys.
  * For example, if a key is storing a counter, split the counter into N separate counters that are randomly incremented by clients. The total value of the counter can then read by adding up the N individual ones.

* Keep key sizes small.

  * Try to keep key sizes below 1 kB. (Performance will be best with key sizes below 32 bytes and *cannot* be more than 10 kB.)
  * When using the tuple layer to encode keys (as is recommended), select short strings or small integers for tuple elements. Small integers will encode to just two bytes.
  * If your key sizes are above 1 kB, try either to move data from the key to the value, split the key into multiple keys, or encode the parts of the key more efficiently (remembering to preserve any important ordering).

* Keep value sizes moderate.

  * Try to keep value sizes below 10 kB. (Value sizes *cannot* be more than 100 kB.)
  * If your value sizes are above 10 kB, consider splitting the value across multiple keys.
  * If you read values with sizes above 1 kB but use only a part of each value, consider splitting the values using multiple keys.
  * If you frequently perform individual reads on a set of values that total to fewer than 200 bytes, try either to combine the values into a single value or to store the values in adjacent keys and use a range read.

Large Values and Blobs
----------------------

If your keys or values are much larger than the above guidelines, it may be difficult to find a data model that resizes them appropriately. Unstructured data, such as binary large objects, can be especially challenging to segment manually. In this case, a good option is to use our blob layer. See our tutorial on :doc:`Managing Large Values and Blobs <largeval>` for further discussion.



# Example: Class Scheduling
This tutorial provides a walkthrough of designing and building a simple application in Python using FoundationDB. In this tutorial, we use a few simple data modeling techniques. For a more in-depth discussion of data modeling in FoundationDB, see [here](https://apple.github.io/foundationdb/data-modeling.html).

First steps
===========

Let's begin with "Hello world."

Open a Python interactive interpreter and import the FoundationDB API module::

    $ python
    >>> import fdb

Before using the API, we need to specify the API version. This allows programs to maintain compatibility even if the API is modified in future versions::

    >>> fdb.api_version(740)

Next, we open a FoundationDB database.  The API will connect to the FoundationDB cluster indicated by the :ref:`default cluster file <default-cluster-file>`. ::

    >>> db = fdb.open()

We are ready to use the database. In Python, using the ``[]`` operator on the db object is a convenient syntax for performing a read or write on the database. First, let's simply write a key-value pair:

    >>> db[b'hello'] = b'world'

When this command returns without exception, the modification is durably stored in FoundationDB! Under the covers, this function creates a transaction with a single modification. We'll see later how to do multiple operations in a single transaction. For now, let's read back the data::

    >>> print 'hello', db[b'hello']
    hello world

If this is all working, it looks like we are ready to start building a real application. For reference, here's the full code for "hello world"::

    import fdb
    fdb.api_version(740)
    db = fdb.open()
    db[b'hello'] = b'world'
    print 'hello', db[b'hello']

Class scheduling application
============================

Let's say we've been asked to build a class scheduling system for students and administrators. We'll walk through the design and implementation of this application. Instead of typing everything in as you follow along, look at the :ref:`tutorial-appendix` for a finished version of the program. You may want to refer to this code as we walk through the tutorial.

Requirements
------------

We'll need to let users list available classes and track which students have signed up for which classes. Here's a first cut at the functions we'll need to implement::

    available_classes()      # returns list of classes
    signup(studentID, class) # signs up a student for a class
    drop(studentID, class)   # drops a student from a class

.. _tutorial-data-model:

Data model
----------

First, we need to design a :doc:`data model <data-modeling>`. A data model is just a method for storing our application data using keys and values in FoundationDB. We seem to have two main types of data: (1) a list of classes and (2) a record of which students will attend which classes. Let's keep attending data like this::

    # ('attends', student, class) = ''

We'll just store the key with a blank value to indicate that a student is signed up for a particular class. For this application, we're going to think about a key-value pair's key as a :ref:`tuple <data-modeling-tuples>`. Encoding a tuple of data elements into a key is a very common pattern for an ordered key-value store.

We'll keep data about classes like this::

    # ('class', class_name) = seats_available

Similarly, each such key will represent an available class. We'll use ``seats_available`` to record the number of seats available.

Directories and Subspaces
-------------------------

FoundationDB includes a few tools that make it easy to model data using this approach. Let's begin by
opening a :ref:`directory <developer-guide-directories>` in the database::

    import fdb
    fdb.api_version(740)

    db = fdb.open()
    scheduling = fdb.directory.create_or_open(db, ('scheduling',))

The :meth:`create_or_open` method returns a :ref:`subspace <developer-guide-sub-keyspaces>` where we'll store our application data. Each subspace has a fixed prefix it uses when defining keys. The prefix corresponds to the first element of a tuple. We decided that we wanted ``'attends'`` and  ``'class'`` as our prefixes, so we'll create new subspaces for them within the ``scheduling`` subspace.::

    course = scheduling['class']
    attends = scheduling['attends']

Subspaces have a :meth:`pack` method for defining keys. To store the records for our data model, we can use ``attends.pack((s, c))`` and ``course.pack((c,))``.

Transactions
------------

We're going to rely on the powerful guarantees of transactions to help keep all of our modifications straight, so let's look at a nice way that the FoundationDB Python API lets you write a transactional function. By using a decorator, an entire function is wrapped in a transaction. Let's write the very simple ``add_class`` function we will use to populate the database's class list::

    @fdb.transactional
    def add_class(tr, c):
        tr[course.pack((c,))] = fdb.tuple.pack((100,))

:py:func:`@fdb.transactional <fdb.transactional>` is a Python decorator that makes a normal function a transactional function. All functions decorated this way *need to have a parameter named* ``tr``. This parameter is passed the transaction that the function should use to do reads and writes.

When *calling* a transactionally decorated function, however, you can pass a database instead of a transaction for the ``tr`` parameter. The decorator *automatically creates a transaction and implements a retry loop* to ensure that the transaction eventually commits.

For a FoundationDB database ``db``::

    add_class(db, 'class1')

is equivalent to something like::

    tr = db.create_transaction()
    while True:
        try:
            add_class(tr, 'class1')
            tr.commit().wait()
            break
        except fdb.FDBError as e:
            tr.on_error(e).wait()

If instead you pass a :class:`Transaction` for the ``tr`` parameter, the transaction will be used directly, and it is assumed that the caller implements appropriate retry logic for errors. This permits transactionally decorated functions to be composed into larger transactions.

Note that by default, the operation will be retried an infinite number of times and the transaction will never time out. It is therefore recommended that the client choose a default transaction retry limit or timeout value that is suitable for their application. This can be set either at the transaction level using the ``set_retry_limit`` or ``set_timeout`` transaction options or at the database level with the ``set_transaction_retry_limit`` or ``set_transaction_timeout`` database options. For example, one can set a one minute timeout on each transaction and a default retry limit of 100 by calling::

    db.options.set_transaction_timeout(60000)  # 60,000 ms = 1 minute
    db.options.set_transaction_retry_limit(100)

Making some sample classes
--------------------------

Let's make some sample classes and put them in the ``class_names`` variable. The Python ``itertools`` module is used to make individual classes from combinations of class types, levels, and times::

    import itertools

    # Generate 1,620 classes like '9:00 chem for dummies'
    levels = ['intro', 'for dummies', 'remedial', '101',
              '201', '301', 'mastery', 'lab', 'seminar']
    types = ['chem', 'bio', 'cs', 'geometry', 'calc',
             'alg', 'film', 'music', 'art', 'dance']
    times = [str(h) + ':00' for h in range(2, 20)]
    class_combos = itertools.product(times, types, levels)
    class_names = [' '.join(tup) for tup in class_combos]

Initializing the database
-------------------------
We initialize the database with our class list::

    @fdb.transactional
    def init(tr):
        del tr[scheduling.range(())]  # Clear the directory
        for class_name in class_names:
            add_class(tr, class_name)

After :func:`init` is run, the database will contain all of the sample classes we created above.

Listing available classes
-------------------------

Before students can do anything else, they need to be able to retrieve a list of available classes from the database. Because FoundationDB sorts its data by key and therefore has efficient range-read capability, we can retrieve all of the classes in a single database call. We find this range of keys with :meth:`course.range`.::

    @fdb.transactional
    def available_classes(tr):
        return [course.unpack(k)[0] for k, v in tr[course.range(())]]

In general, the :meth:`Subspace.range` method returns a Python ``slice`` representing all the key-value pairs starting with the specified tuple. In this case, we want all classes, so we call :meth:`course.range` with the empty tuple ``()``. FoundationDB's ``tr[slice]`` function returns an iterable list of key-values in the range specified by the slice. We unpack the key ``k`` and value ``v`` in a comprehension. To extract the class name itself, we unpack the key into a tuple using the :meth:`Subspace.unpack` method and take the first field. (The first and second parts of the tuple, the ``scheduling`` and ``course`` subspace prefixes, are removed by the ``unpack`` hence the reason we take the first field of the tuple.)

Signing up for a class
----------------------

We finally get to the crucial function. A student has decided on a class (by name) and wants to sign up. The ``signup`` function will take a student (``s``) and a class (``c``)::

    @fdb.transactional
    def signup(tr, s, c):
        rec = attends.pack((s, c))
        tr[rec] = b''

We simply insert the appropriate record (with a blank value).

Dropping a class
----------------

Dropping a class is similar to signing up::

    @fdb.transactional
    def drop(tr, s, c):
        rec = attends.pack((s, c))
        del tr[rec]

Of course, to actually drop the student from the class, we need to be able to delete a record from the database.  We do this with the ``del tr[key]`` syntax.

Done?
-----

We report back to the project leader that our application is done---students can sign up for, drop, and list classes. Unfortunately, we learn that a new problem has been discovered: popular classes are being over-subscribed. Our application now needs to enforce the class size constraint as students add and drop classes.

Seats are limited!
------------------

Let's go back to the data model. Remember that we stored the number of seats in the class in the value of the key-value entry in the class list. Let's refine that a bit to track the *remaining* number of seats in the class. The initialization can work the same way. (In our example, all classes initially have 100 seats), but the ``available_classes``, ``signup``, and ``drop`` functions are going to have to change. Let's start with ``available_classes``:

.. code-block:: python
    :emphasize-lines: 4

    @fdb.transactional
    def available_classes(tr):
        return [course.unpack(k)[0] for k, v in tr[course.range(())]
                if fdb.tuple.unpack(v)[0]]

This is easy -- we simply add a condition to check that the value is non-zero. Let's check out ``signup`` next:

.. code-block:: python
    :emphasize-lines: 4,5,6,7,8,9

    @fdb.transactional
    def signup(tr, s, c):
        rec = attends.pack((s, c))
        if tr[rec].present(): return  # already signed up

        seats_left = fdb.tuple.unpack(tr[course.pack((c,))])[0]
        if not seats_left: raise Exception('No remaining seats')

        tr[course.pack((c,))] = fdb.tuple.pack((seats_left - 1,))
        tr[rec] = b''

We now have to check that we aren't already signed up, since we don't want a double sign up to decrease the number of seats twice. Then we look up how many seats are left to make sure there is a seat remaining so we don't push the counter into the negative. If there is a seat remaining, we decrement the counter.

Similarly, the ``drop`` function is modified as follows:

.. code-block:: python
    :emphasize-lines: 4,5

    @fdb.transactional
    def drop(tr, s, c):
        rec = attends.pack((s, c))
        if not tr[rec].present(): return  # not taking this class
        tr[course.pack((c,))] = fdb.tuple.pack((fdb.tuple.unpack(tr[course.pack((c,))])[0] + 1,))
        del tr[rec]

Once again we check to see if the student is signed up and if not, we can just return as we don't want to incorrectly increase the number of seats. We then adjust the number of seats by one by taking the current value, incrementing it by one, and then storing back.

Concurrency and consistency
---------------------------

The ``signup`` function is starting to get a bit complex; it now reads and writes a few different key-value pairs in the database. One of the tricky issues in this situation is what happens as multiple clients/students read and modify the database at the same time. Couldn't two students both see one remaining seat and sign up at the same time?

These are tricky issues without simple answers---unless you have transactions! Because these functions are defined as FoundationDB transactions, we can have a simple answer: Each transactional function behaves as if it is the only one modifying the database. There is no way for a transaction to 'see' another transaction change the database, and each transaction ensures that either all of its modifications occur or none of them do.

Looking deeper, it is, of course, possible for two transactions to conflict. For example, if two people both see a class with one seat and sign up at the same time, FoundationDB must allow only one to succeed. This causes one of the transactions to fail to commit (which can also be caused by network outages, crashes, etc.). To ensure correct operation, applications need to handle this situation, usually via retrying the transaction. In this case, the conflicting transaction will be retried automatically by the ``@fdb.transactional`` decorator and will eventually lead to the correct result, a 'No remaining seats' exception.

Idempotence
-----------

Occasionally, a transaction might be retried even after it succeeds (for example, if the client loses contact with the cluster at just the wrong moment). This can cause problems if transactions are not written to be idempotent, i.e. to have the same effect if committed twice as if committed once. There are generic design patterns for :ref:`making any transaction idempotent <developer-guide-unknown-results>`, but many transactions are naturally idempotent. For example, all of the transactions in this tutorial are idempotent.

More features?!
---------------

Of course, as soon as our new version of the system goes live, we hear of a trick that certain students are using. They are signing up for all classes immediately, and only later dropping those that they don't want to take. This has led to an unusable system, and we have been asked to fix it. We decide to limit students to five classes:

.. code-block:: python
    :emphasize-lines: 9,10

    @fdb.transactional
    def signup(tr, s, c):
        rec = attends.pack((s, c))
        if tr[rec].present(): return  # already signed up

        seats_left = fdb.tuple.unpack(tr[course.pack((c,))])[0]
        if not seats_left: raise Exception('No remaining seats')

        classes = tr[attends.range((s,))]
        if len(list(classes)) == 5: raise Exception('Too many classes')

        tr[course.pack((c,))] = fdb.tuple.pack((seats_left - 1,))
        tr[rec] = b''

Fortunately, we decided on a data model that keeps all of the attending records for a single student together. With this approach, we can use a single range read in the ``attends`` subspace to retrieve all the classes that a student is signed up for. We simply throw an exception if the number of classes has reached the limit of five.

Composing transactions
----------------------

Oh, just one last feature, we're told. We have students that are trying to switch from one popular class to another. By the time they drop one class to free up a slot for themselves, the open slot in the other class is gone. By the time they see this and try to re-add their old class, that slot is gone too! So, can we make it so that a student can switch from one class to another without this worry?

Fortunately, we have FoundationDB, and this sounds an awful lot like the transactional property of atomicity---the all-or-nothing behavior that we already rely on. All we need to do is to *compose* the ``drop`` and ``signup`` functions into a new ``switch`` function. This makes the ``switch`` function exceptionally easy::

    @fdb.transactional
    def switch(tr, s, old_c, new_c):
        drop(tr, s, old_c)
        signup(tr, s, new_c)

The simplicity of this implementation belies the sophistication of what FoundationDB is taking care of for us.

By dropping the old class and signing up for the new one inside a single transaction, we ensure that either both steps happen, or that neither happens. The first notable thing about the ``switch`` function is that it is transactionally decorated, but it also calls the transactionally decorated functions ``signup`` and ``drop``. Because these decorated functions can accept either a database or an existing transaction as the ``tr`` argument, the switch function can be called with a database by a simple client, and a new transaction will be automatically created. However, once this transaction is created and passed in as ``tr``, the calls to ``drop`` and ``signup`` both share the same ``tr``. This ensures that they see each other's modifications to the database, and all of the changes that both of them make in sequence are made transactionally when the switch function returns. This compositional capability is very powerful.

Also note that, if an exception is raised, for example, in ``signup``, the exception is not caught by ``switch`` and so will be thrown to the calling function. In this case, the transaction object (owned by the decorator) is destroyed, automatically rolling back all database modifications, leaving the database completely unchanged by the half-executed function.

Are we done?
------------

Yep, we’re done and ready to deploy. If you want to see this entire application in one place plus some multithreaded testing code to simulate concurrency, look at the :ref:`tutorial-appendix`, below.

Deploying and scaling
---------------------

Since we store all state for this application in FoundationDB, deploying and scaling this solution up is impressively painless. Just run a web server, the UI, this back end, and point the whole thing at FoundationDB. We can run as many computers with this setup as we want, and they can all hit the database at the same time because of the transactional integrity of FoundationDB. Also, since all of the state in the system is stored in the database, any of these computers can fail without any lasting consequences.

Next steps
==========

* See :doc:`data-modeling` for guidance on using tuple and subspaces to enable effective storage and retrieval of data.
* See :doc:`developer-guide` for general guidance on development using FoundationDB.
* See the :doc:`API References <api-reference>` for detailed API documentation.

.. _tutorial-appendix:

Appendix: SchedulingTutorial.py
===============================

Here's the code for the scheduling tutorial::

    import itertools
    import traceback

    import fdb
    import fdb.tuple

    fdb.api_version(740)


    ####################################
    ##        Initialization          ##
    ####################################

    # Data model:
    # ('attends', student, class) = ''
    # ('class', class_name) = seats_left

    db = fdb.open()
    db.options.set_transaction_timeout(60000)  # 60,000 ms = 1 minute
    db.options.set_transaction_retry_limit(100)
    scheduling = fdb.directory.create_or_open(db, ('scheduling',))
    course = scheduling['class']
    attends = scheduling['attends']

    @fdb.transactional
    def add_class(tr, c):
        tr[course.pack((c,))] = fdb.tuple.pack((100,))

    # Generate 1,620 classes like '9:00 chem for dummies'
    levels = ['intro', 'for dummies', 'remedial', '101',
              '201', '301', 'mastery', 'lab', 'seminar']
    types = ['chem', 'bio', 'cs', 'geometry', 'calc',
             'alg', 'film', 'music', 'art', 'dance']
    times = [str(h) + ':00' for h in range(2, 20)]
    class_combos = itertools.product(times, types, levels)
    class_names = [' '.join(tup) for tup in class_combos]

    @fdb.transactional
    def init(tr):
        del tr[scheduling.range(())]  # Clear the directory
        for class_name in class_names:
            add_class(tr, class_name)


    ####################################
    ##  Class Scheduling Functions    ##
    ####################################


    @fdb.transactional
    def available_classes(tr):
        return [course.unpack(k)[0] for k, v in tr[course.range(())]
                if fdb.tuple.unpack(v)[0]]


    @fdb.transactional
    def signup(tr, s, c):
        rec = attends.pack((s, c))
        if tr[rec].present(): return  # already signed up

        seats_left = fdb.tuple.unpack(tr[course.pack((c,))])[0]
        if not seats_left: raise Exception('No remaining seats')

        classes = tr[attends.range((s,))]
        if len(list(classes)) == 5: raise Exception('Too many classes')

        tr[course.pack((c,))] = fdb.tuple.pack((seats_left - 1,))
        tr[rec] = b''


    @fdb.transactional
    def drop(tr, s, c):
        rec = attends.pack((s, c))
        if not tr[rec].present(): return  # not taking this class
        tr[course.pack((c,))] = fdb.tuple.pack((fdb.tuple.unpack(tr[course.pack((c,))])[0] + 1,))
        del tr[rec]


    @fdb.transactional
    def switch(tr, s, old_c, new_c):
        drop(tr, s, old_c)
        signup(tr, s, new_c)

    ####################################
    ##           Testing              ##
    ####################################

    import random
    import threading

    def indecisive_student(i, ops):
        student_ID = 's{:d}'.format(i)
        all_classes = class_names
        my_classes = []

        for i in range(ops):
            class_count = len(my_classes)
            moods = []
            if class_count: moods.extend(['drop', 'switch'])
            if class_count < 5: moods.append('add')
            mood = random.choice(moods)

            try:
                if not all_classes:
                    all_classes = available_classes(db)
                if mood == 'add':
                    c = random.choice(all_classes)
                    signup(db, student_ID, c)
                    my_classes.append(c)
                elif mood == 'drop':
                    c = random.choice(my_classes)
                    drop(db, student_ID, c)
                    my_classes.remove(c)
                elif mood == 'switch':
                    old_c = random.choice(my_classes)
                    new_c = random.choice(all_classes)
                    switch(db, student_ID, old_c, new_c)
                    my_classes.remove(old_c)
                    my_classes.append(new_c)
            except Exception as e:
                traceback.print_exc()
                print("Need to recheck available classes.")
                all_classes = []

    def run(students, ops_per_student):
        threads = [
            threading.Thread(target=indecisive_student, args=(i, ops_per_student))
            for i in range(students)]
        for thr in threads: thr.start()
        for thr in threads: thr.join()
        print("Ran {} transactions".format(students * ops_per_student))

    if __name__ == "__main__":
        init(db)
        print("initialized")
        run(10, 10)
