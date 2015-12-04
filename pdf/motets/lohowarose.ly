\version "2.18.2"
#(set-global-staff-size 24)

\paper {
  myStaffSize = #20
  fonts = #(make-pango-font-tree
            "Linux Libertine"
            "DejaVu Sans"
            "DejaVu Sans Mono"
            (/ myStaffSize 18))
  oddFooterMarkup = \markup {
    \column {
    \line {
      Es ist ein Ros entsprungen, melody 15th century.
  }
    \line {Typed up by Veronica using Frescobaldi and  Lilypond 2.18.2, for Christmas 2015}
    }}
}

\header {
  title = "Lo, how a rose"
  poet = "Baker"
  composer = "harm. Michael Praetorius"
}

global = {
  \time 4/4
  \key f \major
  \tempo 2=60
}

soprano = \relative c'' {
  \global
  \partial 2 c2 c4 c d c
  c2 a2 bes a4 g4 ~ g4 f2 e4 f2\fermata 
  c'2 c4 c d c c2 a2 bes a4 g4 ~ g4 f2 e4 f2\fermata 
  r4 a4 g e f d c2
  r4 c'4 c c d c c2 a2 bes a4 g4 ~ g4 f2 e4 f2\fermata 
  \bar "||"
}

alto = \relative c' {
  \global
  a'2 a4 f f f e2 d2 d c d4 ~ d8 a8 c2 c2
  a'2 a4 f f f e2 d2 d c d4 ~ d8 a8 c2 c2
  r4 f4 d c c b c8( d e4)
  r4 e4 g f f f e2 d2
  d c d4 ~ d8 a8 c2 c2
  
}

tenor = \relative c' {
  \global
  c2 c4 a bes a g2 f f a4 c4( bes) a2 g4 a2
  c2 c4 a bes a g2 f f a4 c4( bes) a2 g4 a2
  r4 c4 bes a a g g2
  r4 g4 g a bes a g2 fis g c4 bes a2 g a
}

bass = \relative c {
  \global
  f2 f4 f bes f c2 d bes f'4 e d2 c f,\fermata
  f'2 f4 f bes f c2 d bes f'4 e d2 c f,\fermata
  r4 f'4 g a f g c,2 
  r4 c4 e f bes, f' c2 d g, a4 bes c2 c f,\fermata
  
}

verseOne = \lyricmode {
  \set stanza = "1."
Lo, how a rose e'er bloom -- ing,
From ten -- der stem hath sprung.
Of Jes -- se's li -- neage com -- ing,
As men of old have sung;
It came a flow' -- ret bright,
A -- mid the cold of win -- ter,
When half spent was the night.
}

verseTwo = \lyricmode {
  \set stanza = "2."
I -- sai -- ah 'twas fore -- told it,
The Rose I have in mind,
With Ma -- ry we be -- hold it,
The vir -- gin mo -- ther kind;
To show God's love a -- right,
She bore to men a Sa -- viour,
When half spent was the night.  
}

verseThree = \lyricmode {
  \set stanza = "3."
O Flower, whose fra -- grance ten -- der
With sweet -- ness fills the air,
Dis -- pel with glor -- ious splend -- our
The dark -- ness ev -- 'ry -- where;
True man, yet ve -- ry God,
From Sin and death now save us,
And share our ev -- 'ry load.
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { S A }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseOne
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseTwo
    \new Lyrics \with {
      \override VerticalAxisGroup #'staff-affinity = #CENTER
    } \lyricsto "soprano" \verseThree
    \new Staff \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { T B }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \layout { }
  \midi { }
}
