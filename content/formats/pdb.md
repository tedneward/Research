title=Programming Debug Binary (PDB)
summary=Debugging file format for Windows executables.
tags=format, native, windows, pe, pdb
~~~~~~

[Github](https://github.com/Microsoft/microsoft-pdb)

## Readings

* Binary Rewriting With Syzygy, Pt. I - https://doar-e.github.io/blog/2017/08/05/binary-rewriting-with-syzygy/
* CodeView Debug Info Format - http://llvm.org/docs/SourceLevelDebugging.html#codeview-debug-info-format
* Improving Link Time on Windows with clang-cl and lld - http://blog.llvm.org/2018/01/improving-link-time-on-windows-with.html
* Jan Gray on inventing/implementing PDB files 1990-94 - https://twitter.com/jangray/status/659916997711544320
* LLVM on Windows now supports PDB Debug Info - http://blog.llvm.org/2017/08/llvm-on-windows-now-supports-pdb-debug.html
* PDB File Format - https://github.com/google/syzygy/wiki/PdbFileFormat
* PDB Files: What Every Developer Must Know - https://www.wintellect.com/pdb-files-what-every-developer-must-know
* PDB File Internals - http://www.informit.com/articles/article.aspx?p=22685
* PDB v2.0 File Format documentation - https://reverseengineering.stackexchange.com/questions/2548/pdb-v2-0-file-format-documentation
* radare2 PDB usage - https://github.com/radare/radare2/blob/master/doc/pdb/pdb_usage
* The PDB File Format - https://llvm.org/docs/PDB/
* The PDB Info Stream (aka the PDB Stream) - http://llvm.org/docs/PDB/PdbStream.html
* PDB File Internals - http://www.informit.com/articles/article.aspx?p=22685
* PDB Info Stream - https://www.reddit.com/r/programming/comments/6ukeuk/llvm_on_windows_now_supports_pdb_debug_info/dlvtucx/
* PDB Stream Decomposition - https://moyix.blogspot.com/2007/08/pdb-stream-decomposition.html
* pdbparse - Stream Descriptions wiki - https://code.google.com/archive/p/pdbparse/wikis/StreamDescriptions.wiki
* Symbols the Microsoft Way - https://randomascii.wordpress.com/2013/03/09/symbols-the-microsoft-way/
* The Types Stream - https://moyix.blogspot.com/2007/10/types-stream.html
* What’s inside a PDB File? - https://blogs.msdn.microsoft.com/vcblog/2016/02/08/whats-inside-a-pdb-file/

## Tools/Software

- crunchersharp
	- analyses debugger information file (PDB, so Microsoft Visual C++ only) and presents info about user defined structures (size, padding, etc.)
	- https://github.com/msinilo/crunchersharp
	- http://msinilo.pl/blog2/post/p425/
- cv2pdb: converter of DMD CodeView/DWARF debug information to PDB files
	- https://github.com/rainers/cv2pdb
- Debug Interface Access SDK (DIA SDK) - provides access to debug information stored in PDB files - https://docs.microsoft.com/en-us/visualstudio/debugger/debug-interface-access/debug-interface-access-sdk
- drpdb: Convert from Microsoft PDB format into a MySQL database - https://github.com/briterator/drpdb
- LLVM Jit Pdb: Debugging LLVM JIT code inside Visual Studio with PDB
	- https://github.com/vlmillet/llvmjitpdb
- llvm-pdbutil - PDB File forensics and diagnostics - https://llvm.org/docs/CommandGuide/llvm-pdbutil.html - https://github.com/llvm-mirror/llvm/tree/master/tools/llvm-pdbutil
- llvm-symbolizer - convert addresses into source code locations - https://llvm.org/docs/CommandGuide/llvm-symbolizer.html - https://github.com/Microsoft/llvm/tree/master/test/tools/llvm-symbolizer/pdb
- MetadataTools:
Various tools and helpers to read assembly metadata - https://github.com/KirillOsenkov/MetadataTools
	- Pdb - extract .pdb information from a .dll/.exe debug directory (Pdb Guid, age, path to .pdb); download the .pdb from symbol server; determine if a .dll matches a .pdb; find a matching .pdb in a folder for a given .dll - https://github.com/KirillOsenkov/MetadataTools/tree/master/Pdb
- microsoft-pdb: Information from Microsoft about the PDB format - https://github.com/Microsoft/microsoft-pdb
- MSFViewer - viewing and understanding PDB Multi-Stream File (MSF) data - https://github.com/apoch/epoch-language/tree/master/Tools/MSFViewer
- pdbex: an utility for reconstructing structures and unions from the PDB into compilable C headers
	- https://github.com/wbenny/pdbex
- pdbinfo:  displays information about PDB symbol files (timestamp, GUID, and age) - https://github.com/randomascii/tools/tree/master/pdbinfo
- PDBparse - Python code to parse Microsoft PDB files - https://github.com/moyix/pdbparse
- PdbReader & PdbWriter - Common Compiler Infrastructure (CCI) - https://github.com/Microsoft/cci/tree/master/PDBReaderAndWriter
- PDBRipper: an utility to extract an information from PDB files
	- https://github.com/horsicq/PDBRipper
- SymDiff: Diff tool for comparing symbols in PDB files
	- https://github.com/WalkingCat/SymDiff
- Syzygy Transformation Toolchain - PDB Module - https://github.com/google/syzygy/tree/master/syzygy/pdb

## Talks

* 2016 LLVM Developers’ Meeting: R. Kleckner "CodeView, the MS Debug Info Format in LLVM"
	+ https://www.youtube.com/watch?v=5twzd06NqGU
	+ http://www.llvm.org/devmtg/2016-11/Slides/Kleckner-CodeViewInLLVM.pdf


