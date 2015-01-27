


# lets see what I remember



from sys import argv
script, filename = argv

print "Filename: %r" %filename

fd = open(filename)

text = fd.read()

print "Text: %r" %text

word_count = 0



# commands

#python wc.py 133midterm_notes.txt
