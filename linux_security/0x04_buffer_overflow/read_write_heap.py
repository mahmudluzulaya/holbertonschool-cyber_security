#!/usr/bin/python3
import sys


def error():
    print("Usage: read_write_heap.py pid search_string replace_string")
    sys.exit(1)


if len(sys.argv) != 4:
    error()

pid = sys.argv[1]
search = sys.argv[2].encode('ascii')
replace = sys.argv[3].encode('ascii')

if len(replace) > len(search):
    sys.exit(1)

heap_start = None
heap_end = None

try:
    with open("/proc/{}/maps".format(pid), "r") as maps:
        for line in maps:
            if "[heap]" in line:
                parts = line.split()
                addresses = parts[0]
                heap_start, heap_end = [
                    int(x, 16) for x in addresses.split('-')
                ]
                break
except Exception:
    print("Error: Cannot read maps")
    sys.exit(1)

if heap_start is None:
    print("Error: Heap not found")
    sys.exit(1)

try:
    with open("/proc/{}/mem".format(pid), "rb+") as mem:
        mem.seek(heap_start)
        heap_data = mem.read(heap_end - heap_start)

        index = heap_data.find(search)

        while index != -1:
            mem.seek(heap_start + index)
            payload = replace + b'\x00' * (len(search) - len(replace))
            mem.write(payload)

            index = heap_data.find(search, index + 1)

except Exception as e:
    print("Error: {}".format(e))
    sys.exit(1)
