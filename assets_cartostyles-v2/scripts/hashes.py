import os
import glob
import md5
import json

files = {}
for fname in glob.glob("../*/*"):
  if fname.find('icons/') != -1 or fname.find('scripts') != -1:
    continue
  with open(fname, 'rb') as f:
    m = md5.new()
    m.update(f.read())
    hash = m.digest()
  st = os.stat(fname)
  files[fname.replace('\\', '/')] = { 'size': st.st_size, 'md5': bytes(hash).encode('hex') }
print(json.dumps({ 'files': files }, indent=2))
