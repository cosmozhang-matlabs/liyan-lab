import re

miny = 3000
maxy = 0
data = {}

filename = "WT(-999).rwl_tabs"

r = re.compile("[\\s\\,]+")
r_space_ls = re.compile("^\\s+")
r_space_le = re.compile("\\s+$")

def line_to_words(line):
    words = line
    words = r_space_ls.sub('', words)
    words = r_space_le.sub('', words)
    words = r.split(words)
    return words

r_digit = re.compile("^\\d+(\\.\\d*)?$")
f = open("/Users/cosmozhang/Downloads/%s" % filename)

l = f.readline()
if (not l):
    exit(0)
words = line_to_words(l)
names = words[1:]
for n in names:
    data[n] = ['' for i in range(0, 3001)]

while True:
    l = f.readline()
    if (not l): break
    words = line_to_words(l)
    y = words[0]
    if not y.isdigit(): continue
    y = int(y)
    if miny > y: miny = y
    if maxy < y: maxy = y
    for i in range(0, min(len(names), len(words) - 1)):
        w = words[i+1]
        n = names[i]
        if not r_digit.match(w): continue
        v = float(w)
        data[n][y] = v
f.close()

for n in data:
    data[n] = data[n][miny:maxy+1]

f = open("/Users/cosmozhang/Downloads/%s.csv" % filename, 'w')
f.write(",")
for y in range(miny,maxy+1):
    f.write("%d," % y)
f.write("\n")
for n in data:
    arr = data[n]
    f.write("%s," % n)
    for y in range(0,maxy-miny+1):
        f.write("%s," % (("%f" % arr[y]) if isinstance(arr[y], float) else ""))
    f.write("\n")
f.close()