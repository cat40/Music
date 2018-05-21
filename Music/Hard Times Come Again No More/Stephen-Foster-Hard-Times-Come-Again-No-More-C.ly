\version "2.18.2"

\header {
  title = "Hard Times Come Again No More"
  composer = "Stephen Foster"
  copyright = \markup \center-column {"Licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
                                      "For details, see https://creativecommons.org/licenses/by-nc-sa/4.0/"}
}

global = {
  \key c \major
  \time 4/4
  \partial 4
}

viola = \relative c' {
  \global
 \repeat unfold 2 {
  c8 d8 e4 e8 d8 e8 g4
  e8 d8 c8 c8 d8 e2
  a4 g4 e4 d8 c8 e8 d8 c2}%verse
  
  %chorus
  \bar "||"
  e8 f8 g2 g4 g4 e8 g8 a2 g2
  c4 g4 a4 g4 e4 f8 e8 d2
  c8 d8 e4 e8 d8 e8 g4
  e8 d8 c8 c8 d8 e2
  a4 g4 e4 d8 c8 e8 d8 c2 
}

\score {
  \new Staff \with {
    instrumentName = "Viola"
    midiInstrument = "viola"
  } { \clef alto \viola }
  \layout { }
  \midi {
    \tempo 4=100
  }
}
