import os.path

with open('classes.txt', 'rt') as f:
  classes = [cls.strip() for cls in f.readlines()]

for cls in classes:
  fileName = '../icons/%s-11.svg' % cls
  if os.path.isfile(fileName):
    continue
  with open(fileName, 'wt') as f:
    f.write('<?xml version="1.0" encoding="UTF-8"?>\n<svg version="1.1" id="%s-11" xmlns="http://www.w3.org/2000/svg" width="0px" height="0px">\n</svg>' % cls)
    print("Created %s" % fileName)
