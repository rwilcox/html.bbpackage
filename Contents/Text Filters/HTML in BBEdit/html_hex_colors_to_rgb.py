#!/usr/bin/env python

from __future__ import print_function

import sys

def hex_to_rgb(value):
    """Thanks <http://stackoverflow.com/a/7548779/224334> !! """
    
    value = value.lstrip('#')
    lv = len(value)
    if lv == 1:
        v = int(value, 16)*17
        return v, v, v
    if lv == 3:
        return tuple(int(value[i:i+1], 16)*17 for i in range(0, 3))
    return tuple(int(value[i:i+lv/3], 16) for i in range(0, lv, lv/3))

if __name__ == "__main__":
    print("rgb", end="")
    print(hex_to_rgb( sys.stdin.read() ), end="")

