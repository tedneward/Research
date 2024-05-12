title=Bolt
tags=storage, key-value, go
summary=An embedded key/value database for Go.
~~~~~~

[Source](https://github.com/boltdb/bolt) (Archived/"done")

The goal of the project is to provide a simple, fast, and reliable database for projects that don't require a full database server such as Postgres or MySQL.

Since Bolt is meant to be used as such a low-level piece of functionality, simplicity is key. The API will be small and only focus on getting values and setting values. 

Project Status: "Bolt is stable, the API is fixed, and the file format is fixed. Full unit test coverage and randomized black box testing are used to ensure database consistency and thread safety. Bolt is currently used in high-load production environments serving databases as large as 1TB. Many companies such as Shopify and Heroku use Bolt-backed services every day."

