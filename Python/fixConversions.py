'''
Will take the output of musicxml2ly and make it look pretty (remove bar line overrides, breaks, etc)

TODO: add ability to use a global block instead of repeating information in each instrument
TODO: use argparse to make the arguments all nice (and add arguments)
'''
import sys
import os

fname = sys.argv[1]
if len(sys.argv) > 2:
    outname = sys.argv[2]
else:
    name, ext = os.path.splitext(fname)
    outname = name + '_out' + ext


def fix(line):
    line = line.replace('\\pageBreak', '')
    line = line.split(' | ')[0]  # removes the | % n on each line
    line = line.rstrip(' ')
    line = line.replace('        skipBars = ##t', '').replace('        autoBeaming = ##f', '')  # todo put this somehwere else
    line = line.replace('[ ', '').replace(' ]', '')  # remove the manual beams
    indent = line[:len(line)-len(line.lstrip(' '))]
    return indent+' '.join(line.split(' '))  # remove multiple spaces


with open(fname, 'r') as fin, open(outname, 'w') as fout:
    for line in fin:
        fout.write(fix(line))
