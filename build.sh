#!/bin/bash
clang -shared -o rmcof.so rmcof.c -I/usr/include/python3.10 -lpython3.10
