title=Executable and object file formats
tags=native, reading, windows, linux, macos, linux, elf, macho, pe, dwarf, pdb
summary=Resources and reading around executable and object file formats.
~~~~~~
Executable files, debugging data, object code, shared libraries - file formats information, specifications, software - with relevance to compiler toolchains, debuggers, and general program analysis.

Organization: Preference given to the most specific category; e.g., if an article discusses DLL-specific information, then it belongs to the DLL section (in preference to the more general PE).

See also: [Compilers](language-impl.html) | [Linking and Loading](executables.linking_loading.html) | [DWARF](/formats/dwarf.html) | [ELF](/formats/elf.html) | [COFF](/formats/coff.html) | [PE and DLL](/formats/pe.html) | [PDB](/formats/pdb.html)

* Comparison of executable file formats - https://en.wikipedia.org/wiki/Comparison_of_executable_file_formats
* Executable and object file formats - https://en.wikipedia.org/wiki/Template:Executables
* From Hack to Elaborate Technique—A Survey on Binary Rewriting
	- ACM Computing Surveys 52(3) 2019
	- Matthias Wenzl, Georg Merzdovnik, Johanna Ullrich, and Edgar Weippl
	- https://dl.acm.org/citation.cfm?doid=3341324.3316415
	- https://publications.sba-research.org/publications/201906%20-%20GMerzdovnik%20-%20From%20hack%20to%20elaborate%20technique.pdf
* Linux Foundation Referenced Specifications: ABI, ELF, DWARF - https://refspecs.linuxfoundation.org/
* Type Inference on Executables
	+ ACM Computing Surveys, Vol. 48, No. 4, Article 65, 2016
	+ Juan Caballero and Zhiqiang Lin
	+ https://www.utdallas.edu/~zxl111930/file/CSUR16.pdf
	+ http://web.cse.ohio-state.edu/~lin.3021/file/CSUR16.pdf
* Visual Documentation - File formats - Executables: ELF, Mach-O, PE (SVG and PDF available)
	+ https://github.com/corkami/pics/blob/master/binary/README.md#executables
	+ elf101: https://github.com/corkami/pics/tree/master/binary/elf101
	+ macho101: https://github.com/corkami/pics/tree/master/binary/macho101
	+ pe101: https://github.com/corkami/pics/tree/master/binary/pe101
	+ pe102: https://github.com/corkami/pics/tree/master/binary/pe102

## Talks

* Reverse Engineering Binaries
	+ DevConf.CZ 2019; Divya Basant Kumar
	+ https://www.youtube.com/watch?v=TZVBK5hu0sk
* My Little Object File: How Linkers Implement C++
	+ CppCon 2017; Michael Spencer
	+ (ELF, MachO, COFF)
	+ https://www.youtube.com/watch?v=a5L66zguFe4
* The Life of Binaries
	+ http://www.opensecuritytraining.info/LifeOfBinaries.html
	+ https://www.youtube.com/playlist?list=PLUFkSN0XLZ-n_Na6jwqopTt1Ki57vMIc3
