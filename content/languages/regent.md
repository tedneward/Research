title=Regent (Regent-Lang)
tags=language, dataflow
summary=A language for implicit dataflow parallelism.
~~~~~~

[Website](http://regent-lang.org/)

```
import "regent"

struct point { x : float, y : float } -- A simple struct with two fields.

-- Define 4 tasks. Ignore the task bodies for the moment; the behavior of each
-- task is soundly described by its declaration. Note that each declaration
-- says what the task will read or write.
task a(points : region(point)) where writes(points) do --[[ ... ]] end
task b(points : region(point)) where reads writes(points.x) do --[[ ... ]] end
task c(points : region(point)) where reads writes(points.y) do --[[ ... ]] end
task d(points : region(point)) where reads(points) do --[[ ... ]] end

-- Execution begins at main. Read the code top-down (like a sequential program).
task main()
  -- Create a region (like an array) with room for 5 elements.
  var points = region(ispace(ptr, 5), point)
  new(ptr(point, points), 5) -- Allocate the elements.

  -- Partition the region into 3 subregions. Each subregion is a view onto a
  -- subset of the data of the parent.
  var part = partition(equal, points, ispace(int1d, 3))

  -- Launch subtasks a, b, c, and d.
  a(points)
  for i = 0, 3 do
    b(part[i])
  end
  c(points)
  for i = 0, 3 do
    d(part[i])
  end
end
regentlib.start(main)
```

