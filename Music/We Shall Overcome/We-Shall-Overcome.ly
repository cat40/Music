\version "2.18.2"

\header {
  title = "We Shall Overcome"
  copyright = \markup \center-column {"Licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
                                      "For details, see https://creativecommons.org/licenses/by-nc-sa/4.0/"}
}

scale = {c d e f g a b}

verse = {
    g4 \mf g4 a4 a4 % solo
    g4. f8 e2
    %ensemble
    <g>4 <g>4 <a>4 <a>4
    g4. f8 e2
    g4 g4 a4 b4
    c2 d2
    b2. \tuplet 3/2 {a8 b a}
    g2 a4 b4
    c2 b4 a4
    g1
    a2 g4 f4
    e1 
    g4 g4 c,4 f4 
    e2 d2
    c2.r4
}

global = {
  \key c \major \numericTimeSignature\time 4/4
}
%try transposing down from g to d
verse = {
    g4 g4 a4 a4 % solo
    g4. f8 e2
    %ensemble
    <g>4 <g>4 <a>4 <a>4
    g4. f8 e2
    g4 g4 a4 b4
    c2 d2
    b2. \tuplet 3/2 {a8 b a}
    g2 a4 b4
    c2 b4 a4
    g1
    a2 g4 f4
    e1
    g4 g4 c,4 f4
    e2 d2
    c2.r4
}

viola = \relative c' {
    \global

}

cello = \transpose c c'{
  \relative c {
    \global
    \repeat unfold 3 {\verse \bar"||"}
  }
}

celloTwo = \relative c {
  \global
  % R1*15
  c,1 g'1
  c1 g1
  c1 f1
  e1 g,1
  g' c
  d <a c e>1
  
  r1
 %{ \transpose c c,, {
    \chordmode {
      g1 \pppp ~ g1 g1 ~ g1 
      g1 c1 b1:m
    }
  } %}
}

celloThree = \modalTranspose c f, \scale {
  \relative c {
  \global
  R1*15
  R1*15 \pp  \bar "||" 
  }
}
hornF = \relative c' {
   \global
   %\verse
   R1*15
   R1*15
   R1*11
   <a, c e>1
}

violaPart = \new Staff \with {
  instrumentName = "Viola"
  midiInstrument = "viola"
} { \clef alto \viola }

celloPart = \new Staff \with {
  instrumentName = "Cello"
  midiInstrument = "cello"
} { \clef bass \cello }
celloPartTwo = \new Staff \with {
  instrumentName = "Cello"
  midiInstrument = "cello"
} { \clef bass \celloTwo }
celloPartThree = \new Staff \with {
  instrumentName = "Cello"
  midiInstrument = "cello"
} { \clef bass \celloThree }
hornFPart = \new Staff \with {
  instrumentName = "Horn in F"
  midiInstrument = "french horn"
} \hornF

\score {
  <<
    \violaPart
    \celloPart
    \celloPartTwo
    \celloPartThree
    \hornFPart
  >>
  \layout { }
  \midi {
    \tempo 4=100
  }
}
