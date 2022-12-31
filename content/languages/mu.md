title=Mu (Scripting language)
tags=language, embedded, native
summary=A lightweight scripting language designed to be easily embedded into existing projects.
~~~~~~

[Website](http://mu-script.org/) | [Source](https://github.com/geky/mu)

## Examples
```
# A quicksort implementation
fn qsort(data)                                       
    let [x, ..data] = tbl(data)                      
    if (len(data) == 0)                              
        return [x]                                   
                                                     
    let small = filter(fn(y) -> y <  x, data)        
    let large = filter(fn(y) -> y >= x, data)        
    return qsort(small) ++ [x] ++ qsort(large)       
```

