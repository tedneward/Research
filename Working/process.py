f = open("langs.txt", "r")
for line in f.readlines():
    print(line[2:])
    name = line[3:line.find(']')]
    link = line[line.find('(')+1:line.find(')')]
    description = line[line.find(')')+4:]
    print(name, "|", link, "|", description)
    print("--------------")

    o = open(name.lower() + ".md", "w")
    o.write("title=" + name + "\n")
    o.write("tags=language\n")
    o.write("summary=" + description + "\n")
    o.write("~~~~~~\n")
    o.write("\n")
    o.write("[Source](" + link + ")\n\n")

