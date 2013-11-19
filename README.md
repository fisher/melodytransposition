melodytransposition
===================

the place where I give it a try for the new (I mean for me new)
programming languages, using the same task.

what is melody transposition anyway
===================================

Well, the melody in music is composed of notes (Do-Re-Mi and so on),
from first to last. If you look closely you can find that in each
particular melody there is a repetitive pattern of the same notes in
use. This can be named a 'base accord'.

Transposition is the process of moving a set of notes up or down in
pitch by a constant interval, for each of note separately and in
sequence. In other words it is nothing more but shifting the melody to
another key while maintaining the same tone structure, i.e. the same
succession of whole tones and semitones and remaining melodic
intervals. For the practical purposes though it is not always needed
to specify all the whole bunch of notes in a melody but only ones
which repeats throughout the melody, or common pattern, or an accord.

Let's say we have a melody of only three notes C, D, F and we want to
transpose it for one full tone up; this will give us D, E, G. Simple
enough, but the magic really occurs with the same C, D, F transposed
by two notes up, it becames E, F#, A.

The magic goes away if we'll think in the terms of 12 semitone system
(cromatic system) instead of just 8 tones (diatonic system). Let's
look at piano's keyboard:

    .C# D# F# G#A#
    ||_|_|||_|_|_||
    | | | | | | | |
    |_|_|_|_|_|_|_|
     C D E F G A B

Yes, this is only 8 notes in the octave, but if we count it with the
black keys we see our full chromatic 12 semitones. It is really
simple. Instead of thinking 'we transpose from C to D by one note'
think instead 'we transpose from C to D by two semitones'.

For more in-depth information about chromatic system and the process
of transposition you should google it somewhere else. This software
though is designed to transpose a set of notes to another set using
bias (the interval) in semitones. The bias can be a negative number of
semitones. It is useless to specify the bias outside the value domain
(-11..11) -- it should be obvious -- and it will be considered a bad
usage with corresponded error message.


Input format for the melody (or chord, or an accord)
====================================================

The set of notes is expected to be specified in english notation:

| N   |Input| Meaning
|:---:|:---:|:---
| 0   |  C  | Do
| 1   |  Db | Do diese (C-sharp) or Re bemoll (D-flat)
| 2   |  D  | Re
| 3   |  Eb | Re diese (D-sharp) or Mi bemoll (E-flat)
| 4   |  E  | Mi (or Fa bemoll)
| 5   |  F  | Fa (or Mi diese)
| 6   |  Gb | Fa diese or Sol bemoll
| 7   |  G  | Sol
| 8   |  Ab | Sol diese or La bemoll
| 9   |  A  | La
| 10  |  Hb | La diese or Si bemoll, aka B in some countries
| 11  |  H  | Si (Ti), or Do bemoll

As you can see there is no sharp signs in this system---just because
it is not so simple to transfer this sign from the usual command-line
into program---it is common sign for comment in shells. It is possible
though to enter it using so called quoting character---usually a
backslash---like './mt-console --vertical --flute G A\# C', but as you
see it is not so obvious, so just keep in mind there is always a
possibility to enter correspondent bemoll everywhere you think of
diese.

However, when used from stdin the corresponded 'sharped' values should
be recognised.

Output formats
==============

The console program should accept the **--output** parameter with
these values: **letters** (1), **freq** (2), **names** (3), **flute**
(4). By default the first oneis used (letters).

| (1) |  (2)    |  (3)     |    (4)
|:--- |:-------:|:-------- |:---------
|  C  | 261.626 | Do       | (X) X X X  X X X X
|  C# | 277.180 | Do-diese | (X) X X X  X X X .
|  D  | 293.665 | Re       | (X) X X X  X X X O
|  D# | 311.127 | Re-diese | (X) X X X  X X . O
|  E  | 329.628 | Mi       | (X) X X X  X X O O
|  F  | 349.228 | Fa       | (X) X X X  X O O O
|  F# | 369.994 | Fa-diese | (X) X X X  O X X X
|  G  | 391.995 | Sol      | (X) X X X  O O O O
|  G# | 415.305 | Sol-diese| (X) X X O  X X . O
|  A  | 440.000 | La       | (X) X X O  O O O O
|  A# | 466.164 | La-diese | (X) X O X  X O O O
|  H  | 493.883 | Si       | (X) X O O  O O O O


1. **letters** -- just an english letters
2. **freq** -- in Hz, just to practice floating-point real numbers
3. **names** -- common note names, french notation (as used in Ukraine)
4. **flute** -- applicature (aka fingering chart in english) for
  block-flute (aka recorder in english), german system (as used in
  classic music education system in Ukraine). 'X' means closed hole,
  'O' stands for 'open' and '.' means 'half-open'.

Nota bene, for flute fingering there is also an option --vertical
which aligns the output vertically, each note on its own line.
