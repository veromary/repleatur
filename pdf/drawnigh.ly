\version "2.22.2"

melody = \relative c' {
  \clef treble
  \key d \major
  \time 4/4

  d2 e4. e8 fis2. fis4 a a g4. g8 fis1
b2 b4 b a fis fis4. e8 fis2 cis e1
b'2 b4 b d2. d4 cis a a fis b2. b4 a b a fis a fis e4. d8 d1
}

text = \lyricmode {
\set stanza = "1. " Draw nigh and take the Bo -- dy of our Lord
And drink the ho -- ly Blood for you out -- poured,
Saved by that bo -- dy, hal -- lowed by that Blood,
Where -- by re -- freshed we ren -- der thanks to God.
}

versetwo = \lyricmode {
\set stanza = "2. "  Sal -- va -- tion's giver, Christ the on -- ly Son,
By that his Cross and blood the vic -- t'ry won
Of -- fered was he for great -- est and for least
Him -- self the vic -- tim and him -- self the priest.
}

versethree = \lyricmode {
\set stanza = "3. " Vic -- tims were of -- fer'd by the law of old,
That in a type ce -- les -- tial my -- stries told
He ran -- som -- er from death and light from shade
Giv -- eth his ho -- ly grave his saints to aid.
}

\score {
  <<
    \new Voice = "one" { \autoBeamOff \melody }
    \new Lyrics \lyricsto "one" \text
    \new Lyrics \lyricsto "one" \versetwo
    \new Lyrics \lyricsto "one" \versethree
  >>
  \layout { }
  \midi { }
}

