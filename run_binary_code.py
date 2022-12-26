#!/usr/bin/env python3
import sys

try:
    import rmcof
except ImportError as ie:
    print('error:', ie.msg, file=sys.stderr)
    sys.exit(1)

if len(sys.argv) != 2:
    print('usage: python3 run_binary_code.py FILE', file=sys.stderr)

data = b'\xc3'
with open(sys.argv[1], 'rb') as file:
    data = file.read()

print('Result:', rmcof.execute_code(data))
