\version "2.18.2"

\header {
  title = "Battle Cry of Freedom"
  composer = "George Frederick Root"
  copyright = \markup \center-column {"Licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
                                      "For details, see https://creativecommons.org/licenses/by-nc-sa/4.0/"}
}

caesuraOn = \override BreathingSign #'text =
#(make-musicglyph-markup "scripts.caesura.straight")

caesuraOff = \revert BreathingSign #'text
caesura = { \once \caesuraOn \revert BreathingSign #'Y-offset \breathe }
breath = { \caesuraOff \override BreathingSign #'Y-offset = #5 \breathe }

global = {
  \key c \major
  \time 2/2
  \partial 2
  \tempo 4=80
}

chorus = {
  \repeat unfold 2 {g'2 e4. f8 g4 a2.}
\alternative {
 {g2 e4. f8 g1}
 {g2 e4 c4 d2}}
c4 d4 e4. e8 e4 d4 c2
  a4 <b e>4 <c e>4. <c e>8 <c e>4 <b e>4 <a e'>1
  g2 g4. f8 e4 g4 c4 e4 d1_"rit." e8 d8 c2.
}

verseG = {
  \repeat unfold 2{
  g'4 a4 b4 b4 b4. a8 g2
  e4 (g4) g4 g4 g4. fis8 e1
  d2 d4. (c8) b4 d4 g4 }
  \alternative {
    {a4 b1 a2}
    {b4 a1 g1}
  }
}
chorusG = {
  \repeat unfold 2{
  d'2 b4. c8 d4 e2.}
  \alternative {
  {d2 b4. c8 d1}
  {d2 b4 g4 a2}
  }g4 a4 b4 b4 b4. a8 g2
  e4 (g4) g4 g4 g4. fis8 e2
  d2 d4. (c8) b4 d4 g4 b4 a1 g1
}

  
viola = \relative c' {
  %get rid of chords on first iteration, then do another repeat with chords everywhere
  \global
  \set Staff.midiInstrument = #"pizzicato strings"
  \repeat unfold 2 {c4 d4 e4. e8 e4 d4 c2
  a4 <b e>4 <c e>4. <c e>8 <c e>4 <b e>4 <a e'>1
  g2 g4. f8 e4 g4} 
  \alternative{
  {c4 d4 e1 d2}
  {c4 e4 d2. e8 d8 c1}}
  
  \chorus
  \caesura
\bar "||"
\set Staff.midiInstrument = #"viola"
R1*34
\caesura \bar"||" \key g \major \tempo 2=90 
r2 \verseG \chorusG
\bar "|."
}

celloI = \relative c {
  r2
  R1*32 \caesura
  r2 <c, c'>2 ~ <c c'>2 c'4 <g d'>4  
  \repeat unfold 2 {e'4. e8 e4 d4 c2
  a4 b4 c4. c8 c4 b4 a1
  g2 g4. f8 e4 g4} 
  \alternative{
  {c4 d4 e1 d2 c4 d4}
  {c4 e4 d2. e8 d8 c1}}
 
  %chorus
\repeat unfold 2 {g'2 e4. f8 g4 a2.}
\alternative {
 {g2 e4. f8 g1}
 {g2 e4 c4 d2}}
  c4 d4 e4. e8 e4 d4 c2
  a4 b4 c4. c8 c4 b4 a1
  g2 g4. f8 e4 g4 c4 e4 d2._"rit." e8 d8 c1
  \caesura \bar "||" \key g \major \tempo 2=90
  r1 r2
  %<a c e>2-> \ff \downbow <g b d>2-> \downbow %powerful chords one beat past the melody
  \repeat unfold 2{
  <b d fis>2->\ff\downbow <a c e>2->\downbow
  r2 r2
  %<g b d>2 <fis a c>2
  <a c e>2->\downbow <g b d>2->\downbow
  %<fis a c>2 \downbow  <e g b>2%<fis a c>2 \downbow %chords
  r2 R1*3 r2
  }
}

celloII = \relative c {  
  \set doubleSlurs = ##t
  \global r2 R1*32 \caesura
  R1*2
    a1\p ~ a1
    f1 ~ f1
    c1 ~ c1
    a'1 ( g1 )
    a1 ~ a1%f1 ~ f1
    c,1 ~ c1
    c1 ~ c1 %possilby change halfway thorugh measure before pickup
    g'1 
    <c,>1  %start chords here. Use empty 5ths instead of chords?
  <c' e g>1 \pp ~ <c e g>1 %bad
  <a c e>1 (<g b d>1) %* start chords here
  <a c e>1 ~ <a c e>1 %possilby change halfway thorugh measure before pickup *
  <c e g>1  (<g b d>1)%change notes<a c e>1%<f a c>1 ~ <f a c>1 *
  <c e g>1 ~ <a c e>1%<c, e g>1 ~ <c e g>1
  <c, e g>1 ~ <c e g>1%<f, a c>1 ~ <f a c>1
  <c e g>1 ~ <c e g>1
  <g' b d>1  <c, e g>1 
  \caesura \bar "||" \key g \major \tempo 2=90
  r1 r2
  %<g' b d>2->\downbow\ff <a c e>2->\downbow
 \repeat unfold 2 {
  <b' d fis>2->\downbow\ff <c e g>2->\downbow %possibly octave down
  r2 r2
  <a c e>2->\downbow <b d fis>2->\downbow
  r2 R1*3 r2
 }
}
%cello I has long double stops
%Cello 2 has melody
%Viola has plucked chords

scoreAViolaIPart = \new Staff \with {
  instrumentName = "Viola "
} 
<<{ \clef alto \viola } {s4^"pizz."}>>

scoreACelloIPart = \new Staff \with {
  instrumentName = "Cello I"
  midiInstrument = "cello"
} { \clef bass \celloI }

scoreACelloIIPart = \new Staff \with {
  instrumentName = "Cello II"
  midiInstrument = "cello"
} {\clef bass \celloII}
\score {
  \new StaffGroup
  <<
    \scoreAViolaIPart
    \scoreACelloIPart
    \scoreACelloIIPart
  >>
  \layout { }
  \midi {  }
}


%alternate endings with full verse ahead:
 %{ \bar "||"
    \repeat unfold 2 {c4 d4 e4. e8 e4 d4 c2
  a4 <b e>4 <c e>4. <c e>8 <c e>4 <b e>4 <a e'>1
  g2 g4. f8 e4 g4} %key change to D major on second repeat beginning of this line (G goes to high A)
  \alternative{
  {c4 d4 e1 d2}
  {c4 b'4 a1 g1}}
  
  \bar "||"%{viola2 = \r%{viola2 = \relative c' {
  \global%{viola2 = \relative c' {
  \global
  r4 <g d>1 %<g d> when on d string, <c g> when on g string. Possibly omit upper note 
 %}
