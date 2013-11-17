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

As you can see there is no sharp signs in this system -- just because
it is not so simple to transfer this sign from the usual command-line
into program -- it is common sign for comment in shells.

However, when used from stdin the corresponded 'sharped' values should
be recognised.

Output formats
==============

The console program should accept the --output parameter with these
values: **letters** (1), **freq** (2), **names** (3). By default the first oneis
used (letters).

| (1) |  (2)    |  (3)
|:--- |:-------:|:-----
|  C  | 261.626 | Do
|  C# | 277.180 | Do-diese
|  D  | 293.665 | Re
|  D# | 311.127 | Re-diese
|  E  | 329.628 | Mi
|  F  | 349.228 | Fa
|  F# | 369.994 | Fa-diese
|  G  | 391.995 | Sol
|  G# | 415.305 | Sol-diese
|  A  | 440.000 | La
|  A# | 466.164 | La-diese
|  H  | 493.883 | Si
