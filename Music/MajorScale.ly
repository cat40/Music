\version "2.18.2"

global = {
  \key c \major
  \time 4/4
}

oneOctave = {c1 d e f g a b c b a g f e d c}
twoOctave = {c1 d e f g a b c d e f g a b c b a g f e d c b a g f e d c~}

violin = \transpose c d {\relative c' {
  \global
  R1*2 \twoOctave
                         }
}

viola = \transpose c d {\relative c {
  \global
  \twoOctave c1 ~ c1
                        }
}

cello = \transpose c d {\relative c, {
  \global
  \twoOctave c1 ~ c1
  
                        }
}

contrabass = \transpose c d {\relative c, {
  \global
  \twoOctave c1 ~ c1
  
                             }
}

violinPart = \new Staff \with {
  instrumentName = "Violin"
  midiInstrument = "violin"
} \violin

violaPart = \new Staff \with {
  instrumentName = "Viola"
  midiInstrument = "viola"
} { \clef alto \viola }

celloPart = \new Staff \with {
  instrumentName = "Cello"
  midiInstrument = "cello"
} { \clef bass \cello }

contrabassPart = \new Staff \with {
  instrumentName = "Contrabass"
  midiInstrument = "contrabass"
} { \clef bass \contrabass }

\score {
  <<
    \violinPart
    \violaPart
    \celloPart
    \contrabassPart
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
