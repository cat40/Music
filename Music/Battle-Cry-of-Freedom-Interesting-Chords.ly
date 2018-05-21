\version "2.18.2"

\header {
  title = "Battle Cry of Freedom"
  composer = "George Frederick Root"
  copyright = \markup \center-column {"Licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License."
                                      "For details, see https://creativecommons.org/licenses/by-nc-sa/4.0/"}
}

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

viola = \relative c' {
  %get rid of chords on first iteration, then do another repeat with chords everywhere
  \global
  \repeat unfold 2 {c4 d4 e4. e8 e4 d4 c2
  a4 <b e>4 <c e>4. <c e>8 <c e>4 <b e>4 <a e'>1
  g2 g4. f8 e4 g4} 
  \alternative{
  {c4 d4 e1 d2}
  {c4 e4 d2. e8 d8 c1}}
  
  \chorus
\bar "||"
}

%{  %chorus
\repeat unfold 2 {
  g'2 e4. f8 g4 ga2.}
\alternative {
 {g2 e4. f8 g1}
 {g2 e4 c4 d2}}
c4 d4 e4. e8 e4 d4 c2
  a4 <b e>4 <c e>4. <c e>8 <c e>4 <b e>4 <a e'>1
  g2 g4. f8 e4 g4 c4 e4 d1_"rit." e8 d8 c2.
  
  \bar "||" %}

celloI = \relative c {
  \global
  r2 R1*32
  <c, c'>1 ~ <c c'>2 c'4 <g d'>4  
  \repeat unfold 2 {
  \repeat unfold 2 {e'4. e8 e4 d4 c2
  a4 <b e>4 <c e>4. <c e>8 <c e>4 <b e>4 <a e'>1
  g2 g4. f8 e4 g4} 
  \alternative{
  {c4 d4 e1 d2 c4 d4}
  {c4 e4 d1 e8 d8 c2.}}
 
  %chorus
\repeat unfold 2 {g'2 e4. f8 g4 a2.}
\alternative {
 {g2 e4. f8 g1}
 {g2 e4 c4 d2}}
c4 d4 e4. e8 e4 d4 c2
  a4 <b e>4 <c e>4. <c e>8 <c e>4 <b e>4 <a e'>1
  g2 g4. f8 e4 g4 c4 e4 d1_"rit." e8 d8 c2.
  }
  \alternative{
    {c4 d4}
    {r2}}
}

celloII = \relative c {
  \set doubleSlurs = ##t
  \global r2 R1*33
  %do single notes first time, then chords second time
  r1 \p %some whole note chord here instead of rest
  \repeat unfold 2 {
    a1 ~ a1
    f1 ~ f1
    c1 ~ c1
  }
  %try building chords from top down istead
  %<g d'>1 ~ <g d'>1 <c, g'>1
  %<a c e>1 ~ <g c e>1
  %<g c e>1 ~ <g c e>1
  %<e a c>1 ~ <e a c>1  %dominant note goes on top, middle of chord built is dominant note
  \repeat unfold 2 {
  <a c e>1 ~ <a c e>1 %possilby change halfway thorugh measure before pickup
  <a c e>1 ~ <a c e>1%<f a c>1 ~ <f a c>1
  <c e g>1 ~ <c e g>1}
  \alternative{
  {<a' c e>1 (<g b d>1)}
  {<g b d>1 ~ <g b d>4 (<c, e g>2.)}}
}
%cello I has long double stops
%Cello 2 has melody
%Viola has plucked chords

scoreAViolaIPart = \new Staff \with {
  instrumentName = "Viola "
  midiInstrument = "acoustic grand"
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
