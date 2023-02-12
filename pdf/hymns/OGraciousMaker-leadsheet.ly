melody = \relative c' {
  \clef treble
  \key f \major
  \time 3/2

 \partial 2 d2 f1 g2 a1 a2 g1 f2 e1 e2 f1 g2 a1 a2 g2 g1 f1 \bar "||"
a2 c1 a2 g2.( f4) e2 f1 g2 a1 a2 a1 g2 a2.( g4) f2 e e1 d1 \bar "||"
}

text = \lyricmode {
O gra -- cious Ma -- ker bend thine ears
Un -- to our prayers and bit -- ter tears;
May we this fast in truth now keep,
Whilst thus we pray and hum -- bly weep.
}

harmonies = \chordmode {
d2:m d1.:m a1.:m g:m a:m
d1:m c2 a1.:m g:m f
f g:m f a:m f a:m a:m d:m
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Voice = "one" { \autoBeamOff \melody }
    \new Lyrics \lyricsto "one" \text
  >>
  \layout { }
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 2)}} 
}
