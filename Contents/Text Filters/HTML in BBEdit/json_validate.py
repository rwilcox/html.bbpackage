#!/usr/local/bin/python

# From: http://blog.stevex.net/2011/09/json-validation-in-bbedit/

import fileinput
import json
if __name__ == "__main__":
  jsonStr = ''
  for a_line in fileinput.input():
    jsonStr = jsonStr + '\n' + a_line.strip()
  jsonObj = json.loads(jsonStr)
  print json.dumps(jsonObj, sort_keys=True, indent=2)
