#!/usr/bin/env python
import sys

"""
This should go in usr/local/bin so they can type `hint`
"""

cmd_list = {
  'x': 'desc',
  'y': 'desc'
}

for arg in sys.argv:
  print arg
  
