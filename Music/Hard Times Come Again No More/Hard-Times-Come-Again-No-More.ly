\version "2.18.2"

\header {
  title = "Hard Times Come Again No More"
  composer = "Stephen Foster"
  copyright = \markup \center-column {"Licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
                                      "For details, see https://creativecommons.org/licenses/by-nc-sa/4.0/"}
}

global = {
  \key g \major
  \time 4/4
  \partial 4
  %\tempo 4=60
}

viola = {\global \transpose g g {\relative c' {
  d8 e8
  fis4 fis8 e8 fis8 a4 fis8
  e8 d8 d8 e8 fis4 b4
  a4 fis4 e8 d8 fis8 e8
  d2. d8 e8
  fis4 fis8 e8 fis8 a4 fis8
  e8 d8 d8 e8 fis4 b4
  a4 fis4 e8 d8 fis8 e8
  d2. fis8 g8
  a4. a8 a4 fis8 a8
  b2 a2
  d4 a4 b4 a4
  fis4 g8 fis8 e4 d8 e8
  fis4 fis8 e8 fis8 a4 fis8
  e8 d8 d8 e8 fis4 b4
  a4 fis4 e8 d8 fis8 e8
  d2. r4 \bar "|."
    }
  }
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
