# Link Checker Test Page

This file contains various types of links to test the link checker.

## Internet Links

- [Valid HTTP](http://example.com)
- [Valid HTTPS](https://www.example.com)
- [Valid with path](https://www.example.com/test/page)
- [Broken domain](https://this-domain-does-not-exist-12345.com)
- [Broken path](https://www.example.com/nonexistent/page/that/does/not/exist)

## Absolute Links (within content dir)

- [Valid absolute link](/exists)
- [Valid absolute with anchor](/exists#section1)
- [Valid absolute .html mapping](/target.html)
- [Valid absolute subdir index](/subdir)
- [Broken absolute link](/nonexistent-file)
- [Broken absolute path](/subdir/nonexistent)

## Relative Links

- [Valid relative same dir](./exists)
- [Valid relative subdir](./subdir/exists)
- [Valid relative parent](../scripts/test_content/exists)
- [Valid relative with anchor](./exists#details)
- [Broken relative](./nonexistent)
- [Broken relative subdir](./subdir/no-such-file)

## Links That Should Be Skipped

Text with `[inline code link](https://example.com)` should not be checked.

```
This is a fenced code block.
[code block link](https://example.com/broken) should be skipped.
```

```python
# Another code block
print("[code link](/nonexistent)")
```

## Edge Cases

- [No extension link](/subdir/exists)
- [PDF file](../test_content/subdir/exists)
- [Link with query params](/exists?param=value)
- [Empty url]()
