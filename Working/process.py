import os.path

f = open("langs.txt", "r")
for line in f.readlines():
    if line[0] == '-':
        name = line[3:line.find(']')]
        link = line[line.find('(')+1:line.find(')')]
        description = line[line.find(')')+4:]

        fname = name.lower().replace('/', '-')

        if os.path.isfile("../content/languages/" + fname + ".md"):
            print(name.lower() + ".md exists; appending \"" + description + "\" to the existing file.")

            o = open("../content/languages/" + fname + ".md", "+a")
            o.write("\n")
            o.write(link + "\n")
            o.write(description)
        else:
            print(name, "|", link, "|", description)

            if os.path.isfile(fname + ".md"):
                fname = name.lower() + "2"
                if os.path.isfile(fname + ".md"):
                    fname = name.lower() + "3"
            o = open(fname + ".md", "w")
            o.write("title=" + name + "\n")
            o.write("tags=language\n")
            o.write("summary=" + description)
            o.write("~~~~~~\n")
            o.write("\n")
            o.write("[Source](" + link + ")\n\n")
    else:
        pass
