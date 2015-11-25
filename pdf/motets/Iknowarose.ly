\version "2.18.2"
#(set-global-staff-size 24)

\paper {
  myStaffSize = #24
  fonts = #(make-pango-font-tree
            "Lido STF"
            "DejaVu Sans"
            "DejaVu Sans Mono"
            (/ myStaffSize 20))
  oddFooterMarkup = \markup {
    \column {
    \line {
      Es ist ein Ros entsprungen, melody 15th century.
  }\line {
Transcribed from R R Terry's Two Hundred Folk Carols, 1933, pp20-21.
    }
    \line {Typed up by Veronica using Frescobaldi and  Lilypond 2.18.2, for Christmas 2014}
    }}
}

\header {
  title = "I know a flower"
  poet = "tr. Rev G. R. Woodward"
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
  I know a flow'r it spring -- eth
  From earth a ten -- der shoot:
  As old -- en pro -- phet sing -- eth,
  From Jes -- se came the root
  That bore a blos -- som bright
  In depth of chil -- ly win -- ter
  A -- bout the dead of night.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  This plant with blos -- som la -- den
  As spake E -- sai of yore,
  Is Ma -- ry, spot -- less mai -- den,
  For us this flow' -- ret bore;
  By God's e -- ter -- nal will,
  A seem -- ly Babe she child -- eth,
  Yet maid re -- main -- eth still.
  
}

verseThree = \lyricmode {
  \set stanza = "3."
  Praise, ho -- nour to the Fa -- ther,
  The Son, the Spi -- rit blest;
  And Ma -- ry, God's own Mo -- ther,
  For help we make re -- quest:-
  Be -- seech thy dear -- est Son
  That He would be our Re -- fuge
  And shrive us, ev -- ry -- one.
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
