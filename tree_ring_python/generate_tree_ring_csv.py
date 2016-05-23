import re

miny = 3000
maxy = 0
data = {}

filename = "hs6.txt_ind1"

r = re.compile("\\s+")
f = open("/Users/cosmozhang/Downloads/%s" % filename)
while True:
	l = f.readline()
	if (not l): break
	words = r.split(l)
	n = words[0]
	y = words[1]
	if not y.isdigit(): continue
	if not n in data: data[n] = ['' for i in range(0, 3001)]
	y = int(y)
	if miny > y: miny = y
	for w in words[2:]:
		if not w.isdigit(): continue
		v = int(w)
		data[n][y] = v
		y += 1
	if maxy < y: maxy = y
f.close()
maxy -= 1

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
		f.write("%s," % (("%d" % arr[y]) if isinstance(arr[y], int) else ""))
	f.write("\n")
f.close()