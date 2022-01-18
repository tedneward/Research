title=Phix
tags=language
summary=An open source, self-hosted, interpreted or compiled programming language with a strong emphasis on simplicity and plain human-readable error messages.
~~~~~~

[Website](http://phix.x10.mx/) | [Download](http://phix.x10.mx/download.php) (Source included in download)

### Examples
Character hello world
```
        puts(1,"Hello world!\n")
        {} = wait_key()
```

GUI hello world
```
        {} = message_box("world!","Hello",MB_OK)
```

A simple sorting routine
```
        function merge_sort(sequence x)
        -- put x into ascending order using a recursive merge sort
        integer midpoint
        sequence merged, first_half, second_half
             if length(x)<=1 then
                 return x  -- trivial case
             end if
             midpoint = floor(length(x)/2)
             first_half = merge_sort(x[1..midpoint])
             second_half = merge_sort(x[midpoint+1..$])
             -- merge the two sorted halves into one
             merged = {}
             while length(first_half)>0 
               and length(second_half)>0 do
                 if first_half[1]<=second_half[1] then
                     merged = append(merged, first_half[1])
                     first_half = first_half[2..$]
                 else
                     merged = append(merged, second_half[1])
                     second_half = second_half[2..$]
                 end if
             end while
             -- result is the merged data plus any leftovers
             return merged & first_half & second_half
        end function

        sequence list = {9, 10, 3, 1, 4, 5, 8, 7, 6, 2}
             ? merge_sort(list)
```

