title=Arden (syntax)
tags=language, format
summary=A markup language used for representing and sharing medical knowledge and used in an executable format by clinical decision support systems[2] to generate alerts, interpretations, and to screen and manage messages to clinicians.
~~~~~~

[Committee Home](http://www.hl7.org/special/Committees/arden/docs.cfm)

[Arden Syntax v2.10](http://www.hl7.org/implement/standards/product_brief.cfm?product_id=372) | [Arden Syntax 3.0 Proposal](http://www.hl7.org/special/Committees/arden/projects.cfm?action=edit&ProjectNumber=1479)

Rule sets, called Medical Logic Modules, comprise enough logic to make a single medical decision. Medical logic modules are written in Arden syntax, and are called by a program – an event monitor – when the condition they are written to help with occurs.

```
 title: To check the diastolic blood pressure of the patient;;
 mlmname: Hypotension;;
 arden: version 2.7;;
 version: 1.00;;
 institution: Latrobe University Bundoora;;
 author: Lakshmi Devineni;;
 specialist: ;;
 date: 2013-06-02;;
 validation: testing;;
library:
 purpose: check if the diastolic blood pressure of the patient is within limits;;
 explanation: This MLM is an example for reading data and writing a message;;
 keywords: hypotension; categorization;;
 citations: ;;
 links: http://en.wikipedia.org/wiki/Hypotension;;
knowledge:
 type: data_driven;;
 data:
 /* read the diastolic blood pressure */
 diastolic_blood_pressure := read last
 {diastolic blood pressure}; /* the value in braces is specific to your 
 runtime environment */
 /* If the height is lower than height_threshold, output a message */
 diastolic_pressure_threshold := 60;
 stdout_dest := destination
 {stdout};
 ;;
 evoke: null_event;;
 logic:
 if (diastolic_blood_pressure is not number) then
 conclude false;
 endif;
 if (diastolic_blood_pressure >= diastolic_pressure_threshold) then
 conclude true;
 else
 conclude false;
 endif;
 ;;
 action:
 write "Your Diastolic Blood Pressure is too low (hypotension)"
 at stdout_dest;
 ;;
resources:
 default: de
 ;;
 language: en
 'msg' : "The normal range from 60 to 90";
 ;;
 language: de
 'msg' : "Der Normalbereich von 60 bis 90";
 ;;
end:
```

See [The Arden Syntax standard for clinical decision support](https://www.sciencedirect.com/science/article/pii/S1532046412000226?via%3Dihub) ([direct PDF link](https://reader.elsevier.com/reader/sd/pii/S1532046412000226?token=019A1DCE31AF8E18A3837E3986E7F26E7218FF70DADD72D445C066345020A2122B4BB9ADBFE1F3852D89225A97B8F565))

[Fuzzy Arden Syntax Compiler (paper)](https://www.researchgate.net/publication/233843718_A_FUZZY_ARDEN_SYNTAX_COMPILER) [Fuzzy Arden Syntax: a fuzzy programming language for medicine](http://www.flll.jku.at/sites/default/files/u24/FuzzyArdenArtikel.pdf)

