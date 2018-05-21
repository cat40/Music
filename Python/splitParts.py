'''
python script for splitting a lilypond file into parts

Functions to add:
Split a single file into files of single parts

Split a single file into files of parts with sepcified instruments,
such that lines outside of the instrument's range have been transposed into the range
(should optimize so that maximum possible is in range, but NOT partial transposition
Also consider transposing by other than an octave (5th or 4th)
'''
import re


def fixpart(part, minnote, maxnote):
    '''
    :param part: string for the part, including \relative if applicable
    :param minnote: minimum note (in absolute ly notation, ex c', g,)
    :param maxnote: maximum note, same as above
    :return:
    what happens:
    figure out of there is a relative block (if not, or if transpositoin is not an octave, need to use transpose block)
    Determine the optimal octave for the instrument and the peice (probably just brute force 5 or so octaves and see
        which has the highest amount of fitting notes while not going below the minimum range (optimized for strings with a hard min but soft max)
    todo: add a way to override the transposition if a different octave is desired
    '''
    pass


def parse(fname):
    '''
    :param fname:
    :return:
    what happens:
    file is sorted and stuff is changed
    '''
    with open(fname, 'r') as f:
        text = f.read()
    parts = re.finditer(r'\\relative .* { .* }', text)
    # relatives = re.finditer('\\\\relative [^ ]+', text)
    # for relatives in relatives:
    #     pass


def parsedumb(fname, octave, clef=None, midiinstrument=None):
    '''
    this will not catch sometjing defined without a \relative block
    :param fname: file name
    :param octave: octave to transpose to
    :param clef: clef to use for every line. If None, clefs are unchanged
    :param midiinstrument: midiinstrument to use for all tracks. If None, instruments are unchanged
    :return: None
    '''
    with open(fname, 'r') as f:
        text = f.read()
        relatives = re.finditer(r'\\relative [^ ]+', text)
        music = ''''''
        prevstart = 0
        # relative blocks
        for relative in relatives:
            start = relative.start()
            music += text[prevstart:start]
            music += '\\relative c' + octave
            prevstart = relative.end()
        # clefs
        if clef is not None:
            text = music
            music = ''''''
            prevstart = 0
            clefs = re.finditer(r'\\clef [^ ]+')
            for match in clefs:
                start = match.start()
                music += text[prevstart:start]
                music += '\\clef ' + clef
                prevstart = match.end()



    with open(fname+'out.ly', 'w') as out:
        out.write(music)


# run tests
if __name__ == '__main__':
    fname = '..\\Music\\MajorScale.ly'
    parsedumb(fname, ",", 'bass')
