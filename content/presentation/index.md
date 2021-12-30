title=Presentation
type=categorypage
category=presentation
summary=Different ways to present information to users of a program.
tags=presentation
~~~~~~

### Reading

[Graphical User Interface Programming](https://www.cs.cmu.edu/~bam/pub/uimsCRCrevised.pdf), by Brad Meyers, CMU (circa 2003 but still an interesting overview--not sure much has changed in two decades on this subject)

[ECMA Report on User Interface Taxonomy](https://www.ecma-international.org/wp-content/uploads/ECMA_TR-61_1st_edition_june_1992.pdf) (June 1992): Interesting high-level overview of different ideas around user interface and a taxonomy of that space:

* UI structure
    * Metaphor
        * Desktop: represents objects and actions traditionally associated with a desk and the surrounding office environment.
        * Workbench: represents an environment which contains the tools and other work items organised to do work in a particular task area.
        * Control panel: represents a physical panel containing an array of instruments for controlling a machine. Typical objects include dials and gauges (both analogue and digital), sliders, buttons and knobs.
    * Dialogue technique
        * Menus: A set of options presented by the dialogue system to the user.
        * Language:
            * Natural language
            * Command language: A specified set of user inputs which, when processed by the dialogue system, result in associate actions. Users enter (rather than select) complete or abbreviated command(s) and the dialogue system performs the activities specified by the command(s). Command languages include both natural-like languages and specialised languages.
            * Q&A: A dialogue technique by which the user responds to questions asked by the dialogue system (e.g. system-initiated dialogue). Questions are typically asked one at a time and may vary depending on the previous answer. In most applications of this dialogue technique, answers can be qualitative (yes/no) or quantitative (a number). *(Hello, chatbots!)*
        * Direct manipulation
            * Object based: A form of dialogue in which the user directly acts upon the objects to be manipulated by pointing at them, moving and/or changing their physical characteristics (or values) via the use of an input device. In its purest form, a direct manipulation dialogue allows users to perform all available interaction operation by acting on displayed objects in ways analogous to manipulating physical entities. Such objects are typically concrete, often graphical, representations of abstract software structures or capabilities, displayed within a simulated two or three-dimensional environment.
            * Control panel based: This dialogue technique is defined by the closed loop consisting of machines and human operators controlling the machines using control actuators, which are represented by objects that are used to perform an action. The specifics of this dialogue technique are:
                - variety of types of control actuators;
                - input in digital or analogue form in normally fixed sequences;
                - strong time constraints (real time);
                - complexity of system control.
        * Form filling
            A dialogue technique that requires the user to fill in, complete or modify fields (typically labelled) on a form displayed by the system. This dialogue technique allows multiple user inputs in a single transaction and provides contextual information concerning the nature of the required inputs.
    * Guidance function: Guidance functions can be divided into:
            - guidance in non-error situations and error prevention;
            - guidance in error situations and error management.
      The guidance function is intended to promote efficient use of the dialogue system (quick and accurate use of full capabilities), minimise the memory load on the user, decrease the time required to learn how to use the dialogue system, provide support for users of different skill levels and help the user to escape from error situations.
        * Guidance in non-error situations and error prevention
        * Guidance in error situations and error management
    * Dialogue control function
        * System environment: The environment within which the dialogue system operates often provides general control functions. These include:
            - Windowing: The division of a display area to provide one or more graphical contexts. The windowing system will normally support concepts such as input focus and provide mechanisms to allow the user to arrange the windows as desired.
            - I/O equivalence: To support the different requirements and preferences of users, the dialogue system may support different user interactions as equivalent. Such equivalences are used to provide accelerators or to support disabled users, for example keyboard equivalents for mouse actions, flashing versus beeping.
            - Global storage facilities: To support the interchange of data between applications or to act as a temporary repository, the dialogue system will often provide one or more globally accessible storage facilities, often referred to as clipboards.
        * Dialogue flow: Dialogue flow functions allow control of the temporal progress of the dialogue. These include:
            - start;
            - suspend;
            - resume;
            - end;
            - changes in the direction of the flow, e.g. to recover from errors by reverting to a previous dialogue state.
        * Object management: Object management functions allow control of the existence, state and position of objects used in the dialogue. These include:
            - create;
            - delete;
            - select;
            - deselect;
            - copy;
            - move.
        * Filtering: Filtering functions are used to reduce the volume of information exchanged during the dialogue. The purpose of these functions include:
            - implementation of security and privacy restrictions (e.g. by means of passwords);
            - implementation of user's capabilities and preferences (e.g. by means of user profiles);
            - removal or modification of options inappropriate in the current mode (e.g. by greying menu items or removing them completely).
    * Presentation of information
        *  Visual presentation: The use of visual appearance to categorize or identify objects and concepts.
            * Enhancement: The altering of the visual appearance of selected parts of information on the display to attract attention and provide feedback. The ways in which the visual appearance can be altered include:
                - size;
                - shape;
                - texture;
                - colour;
                - contrast;
                - brightness.
            * Alphanumeric: The use of letters or symbols with rules for their association. Used for reasons of brevity and security.
            * Arbitrary: use of unique entities formed by letters or numbers that have little or no significance to the user and which bear no direct relationship to what they represent.
            * Mnemonic: use of entities formed by letters or numbers that convey information that is meaningful to the user and have some association with the words they represent (e.g. abbreviations, acronyms).
            * Graphical: The use of graphical information that can be interpreted by the user as concepts or objects.
            * Abstract symbols: those which attempt to visualise a concept somehow apart from the concrete image.
            * Representational symbols: those which attempt to visualise a concept related to a concrete image.
        * Auditory presentation: The use of sound ranging from simple tones to sequences of tones to full speech capabilities.
        * Tactile presentation: The use of touch to convey information (e.g. touch screen, mouse clicking).
        * Temporal presentation: The use of variations in time to convey information (e.g. blinking, double clicking).
        * Spatial presentation: The use of positions in space to convey information.
    * I/O devices: Input/output devices can be divided into input devices, output devices and input/output devices. The last category is not treated separately, but is included in both the input and output devices taxonomy. Compound devices are considered to be combinations of I/O devices and hence do not require separate definitions here.
        * Input device taxonomy: The following list shows the fundamental types of interaction tasks and which input devices are suitable to be used for each type.
            - Selection
                * Definition: Choosing from a set of alternatives
                * Suitable devices: Mouse, tablet, light pen, pen, touch panel, touch screen, joystick, trackball, keyboard, microphone, glove, gesture suit.
            - Position
                * Definition: Indicating a location
                * Suitable devices: Mouse, tablet, light pen, pen, touch panel, touch screen, joystick, trackball, keyboard, eye tracker, wheel, glove, gesture suit.
            - Orientation
                * Definition: The orientation of an entity in a two-dimensional or three-dimensional space
                * Suitable devices: Joystick, keyboard, glove, gesture suit.
            - Path
                * Definition: Generating a series of positions or orientations over time
                * Suitable devices: Mouse, tablet, light pen, touch panel, touch screen, joystick, trackball, keyboard, eye tracker, wheel, glove, gesture suit.
            - Quantify
                * Definition: Specifying a value to quantify a measure.
                * Suitable devices: Switches, keyboard, mouse, wheel, microphone.
            - Text capture
                * Definition: Entering text directly, e.g. for annotating a drawing.
                * Suitable devices: Keyboard, microphone.
            - Image capture
                * Definition: Entering an image directly.
                * Suitable devices: Video, scanner.                
        * Output device taxonomy: At the highest level, output devices can be divided into those that provide output of a static and permanent nature and those that provide dynamic, temporary output.
            - Static output
                * Definition: providing an image on a permanent directly readable medium (e.g. paper).
                * Suitable devices: Printers, plotters
            - Dynamic output
                * Definition: providing variable information on a non-permanent medium.
                * Suitable devices: Screen, head mounted displays, loudspeakers, light.
* Engineering/ergonomic principles
    * Action/object order: Some systems are based upon actions being invoked on objects. Whether the action or the object is selected first varies from system to system.
    * Complexity of function set: Some systems provide a rich set of complex functions while others provide a small set of elementary functions which can achieve the same effect by being used in combination.
    * Complexity of objects: Some systems have a simple set of objects with limited possibilities for combining them to form more complex ones. Other systems allow objects to be combined in various ways such as nesting, embedding, grouping, linking etc.
    * WYSIWYG: A user interface methodology where the representation on the screen is judged by the user to have a close relationship to that which would be produced on a static output device (e.g. paper). (The "close" relationship may range from similar to identical, e.g. because of software or hardware limitations.)
    * Physical principles: Certain aspects of the user interface should be modelled closely on human perception and behaviour. For example:
        - font styles and sizes and the use of colour should be appropriate to human vision capability;
        - keyboard layout and required key combinations should be appropriate to human manual dexterity;
        - use of sound should be appropriate to human auditory characteristics.
    * Dialogue principles
        - Suitability for the task: A dialogue is suitable for a task to the extent that it supports the user in the effective and efficient completion of the task.
        - Self-descriptiveness: A dialogue is self-descriptive to the extent that each dialogue step is immediately comprehensible through feedback from the system or is explained to the user on his or her requesting the relevant
        information.
        - Controllability: A dialogue is controllable to the extent, that the user is able to maintain direction over the whole course of the interaction until the point at which the goal has been met.
        - Conformity with user expectations: A dialogue conforms with user expectations to the extent, that it corresponds to the user's task knowledge, education, experience, and to commonly held conventions.
        - Error tolerance: A dialogue is error tolerant to the extent, if despite evident errors in input, the intended result may be achieved with either no or minimal corrective action having to be taken.
        - Suitability for individualisation: A dialogue is suitable for individualisation to the extent, that the dialogue system is constructed to allow for modification to the user's individual needs and skills for a given task.
        - Suitability for learning: A dialogue is suitable for learning to the extent, that it provides means, guidance, and stimulation to the user during the learning phases.
    * Drivability: The extent to which user interfaces permit users to easily transfer from one application to another with minimal interference, error, confusion, re-learning and re-training.
    * Look and Feel: The extent to which a user interface complies with a particular style guide.
    * Internationalisation: Systems vary in the extent to which they support the needs of different cultural and language groups. These include translation of messages, formats, sorting/collating sequences, paper sizes, alphabets, text direction.
* Applicability domain
    * User domain
        - individual characteristics (e.g. skill level, preferences);
        - work group characteristics (e.g. open plan vs closed office, CSCW);
        - organisational characteristics (e.g. company policies).
    * Application domain
        - office;
        - public information systems;
        - education;
        - home;
        - control rooms;
        - factory floor.
* Environmental constraints
        - implementation dependencies (e.g. portability);
        - system environment constraints (e.g. technology, non-graphic screens);
        - economic constraints (e.g. cost of use, training)

---

## Miscellaneous reading

["How to Draw S-Curved Arrows"](https://dragonman225.js.org/curved-arrows.html)


