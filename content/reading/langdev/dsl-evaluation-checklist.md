title=DSL Evaluation Checklist
tags=langdev
summary=A collection of questions for evaluating DSLS.
~~~~~~

["An empirical evaluation of a novel domain-specific language: Modeling vehicle routing problems with Athos"](https://link.springer.com/article/10.1007/s10664-022-10210-w) [PDF](https://link.springer.com/content/pdf/10.1007/s10664-022-10210-w.pdf)

---

Heuristic Evaluation CheckList for Graphical and Textual DSL

This checklist is designed to be used together with the Process. The Nielsen Heuristics are used in the Heuristic Evaluation Checklist.

The following 0 to 4 rating scale can be used to rate the severity of usability problems:

Severity | Type | Description
-------- | ---- | -----------
0 | Not applicable | I don't agree that this is a usability problem at all
1 | Cosmetic problem only | need not be fixed unless extra time is available on project
2 | Minor usability problem | fixing this should be given low priority
3 | Major usability problem | important to fix, so should be given high priority
4 | Usability catastrophe | imperative to fix this before product can be released

### Visibility of system status  
The DSL should always keep users informed about what is going on, through appropriate feedback within reasonable time.

* Does the Graphical DSL provide immediate and adequate feedback on its status for each user action? For example, after an include or exclude task the language displays a commit message?								
* Does the Textual DSL provide immediate and adequate feedback on its status for each user action? For example, after an include or exclude task the language displays a commit message?								
* Do the elements available for the user specifically execute only one command? For example, the "undo" button only performs undo actions.								
* Do all alert and error messages that DSL (Textual or Grafica) provides stay on the screen long enough to be read more than once or (preferably) until the user chooses to close them?								
* Are the Textual and Graphical DSLs structured in a coupled way? For example, if the user changes something on the Textual DSL, this change must be observed on the Graphical DSL and if the user changes something on the Visual DSL, this change must be observed on the Textual DSL.


### Match between language and the real world domain  
The DSL must represent the user's language with words, phrases, and concepts familiar to the user instead of system-oriented. It should follow the conventions of the real world, making the information natural and logical.

* Are the elements that compose the Graphical DSL used on the user’s real world domain? For example, a DSL developed for a domain related to libraries needs to have digital representations of elements on this domain, such as books and notebooks.								
* Are the reserved keywords that compose the Textual DSL used on the user’s real world domain? For example, a DSL developed for a domain related to libraries needs to have keywords related to the library domain.								
* Are the elements that compose the Graphical DSL a good representation of the DSL’s domain?								
* Are the elements that compose the Textual DSL a good representation of the DSL’s domain?								
* Do the elements that compose the Textual DSL meet the domain goal? The user understands the DSL goal by interacting with its elements.								
* Do the elements that compose the Graphical DSL meet the domain goal? The user understands the DSL goal by interacting with its elements.								

### User control and freedom  
Users often choose DSL functions by mistake and will need a clearly marked "emergency exit" to leave the unwanted state without having to undergo extensive dialogue. Undo and redo support.

* Does Textual DSL have redundancy in the undo / redo commands (e.g. key combination)?								
* Does Graphical DSL have redundancy in the undo / redo commands (e.g. icon, menu)?								

### Consistency and standards   
Domain Users should not have to wonder whether different words, situations, or actions mean the same thing.

* Are all the Graphical elements connected to each other? For example, are all the visual representations shown in the same contrast level and size?								
* Can all the elements on the Graphical DSL be unambiguously recognized by the end users?								
* Are all the Textual elements apparently connected to each other? For example, are all the reserved keywords shown in the same color?								
* Are all the Textual elements connected to each other according to their names? For example, are all the reserved keywords written in the same style, only using camelCase or only using underscores (_) to separate words?								
* In case of using abbreviations, are all the abbreviations consistent throughout the DSL usage?								

### Error prevention   
Even better than good error messages is a careful design which prevents a problem from occurring in the first place. Either eliminate error-prone conditions or check for them and present users with a confirmation option before they commit to the action (confirmation box). 

* Does the Graphical DSL show confirmation boxes when the user performs actions considered dangerous (deleting things, etc)?								
* Does the Textual DSL show confirmation boxes when the user performs actions considered dangerous (deleting things, etc)?								
* Does the Textual DSL provide a mechanism in order to inform the restrictions of usage in case of, for example, mistyping or committing any kind of mistake?								

### Recognition rather than recall  
Minimize the user's memory load by making objects, actions, and options visible. The user should not have to remember information from one part of the system to another. Instructions for use of the system should be visible or easily retrievable whenever appropriate.

* Do reserved keywords have a meaningful and easy name so that the user can remember them in a fast way? In this case, keywords are words related to the domain of the textual DSL.								

* Is the Graphical DSL composed of elements easy to be seen on the screen (with good-contrast color, easily identified by the end user)? Is the Textual DSL composed of words easy to be seen on the screen (with good-contrast color, easily identified by the end user)? For example, commands like “if/else” are shown in a different color from the rest of the code.								

### Flexibility and efficiency of use   
Accelerators — unseen by the novice user — may often speed up the interaction for the expert user such that the language can cater to both inexperienced and experienced users. Allow users to tailor frequent actions.

* Does the Graphical DSL have shortcuts for expert users to make the usage of the DSL in a fast way? For example, providing short-cuts or functions to write basic code structures.								
* Does the Textual DSL have shortcuts for expert users to make the usage of the DSL in a fast way? For example, providing short-cuts or functions to write basic code structures.								
* Does the Graphical DSL provide all the elements in order to complete the desired task?								
* Does the Textual DSL provide all the elements in order to complete the desired task?								
* Are common tasks easy and fast to be executed? For example, opening a file or deleting an element.								

### Aesthetic and minimalist design   
Dialogues should not contain information that is irrelevant or rarely needed. Every extra unit of information in a dialogue competes with the relevant units of information and diminishes their relative visibility.

* The colors of the DSL help to understand the current state of the system, but aren't they the only sources of information for understanding a state?								
* In case of showing a dialog, does this dialog have the information shown in a short-text? The quantity of lines of a short text may vary according to the dialog and the information being exposed, but it is advised that a dialog does not have more than 3 lines of warning.								

### Help users recognize, diagnose, and recover from errors  
Error messages should be expressed in plain language (no codes), precisely indicate the problem, and constructively suggest a solution.

* In case of error, does the DSL show an appropriate error message where the user, after reading it, knows how to recover from the error or where to look for a solution?								
* In case of showing a dialog (when the user commits a mistake, for example), does this dialog show the possible reasons why the mistake was committed in a clear way?								
* Does the Textual DSL have a mechanism that highlights syntax errors in the text or reserved words?								
* Does Textual DSL have mechanisms to highlight errors of nesting or organization of reserved words that make the model inconsistent?								
* Does Graphical DSL have mechanisms that mark connection errors between elements that can make the model inconsistent?								
* Does Textual DSL have mechanisms that mark connection errors between elements that can make the model inconsistent?								

### Help and documentation  
Even though it is better if the system can be used without documentation, it may be necessary to provide help and documentation. Any such information should be easy to search, focused on the user's task, list concrete steps to be carried out, and not be too large.

* Does the Graphical DSL have a tutorial in order to provide what is the DSL’s goal, the representations used and its usage (providing examples to show the DSL in practice)?								
* Does the Textual DSL have a tutorial in order to provide the DSL’s goal, the syntax usage and its meaning, as well as provide examples of the DSL’s usage?								
* Are all the elements included on the Graphical DSL described in a clear way on the documentation support?								
* Are all the commands included on the Textual DSL described in a clear way on the documentation support?								
* Does the DSL (Textual or Graphical) have contextual help for each element?

