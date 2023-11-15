#(set-default-paper-size "a5")

\header {
  title = "To Jesus Christ our Sovereign King"
  subtitle = "Ich Glaub an Gott"
  composer = "Mainz Gesangbuch 1870"
  poet = "Martin B. Hellriegel"
}

melody = \relative c' {
  \clef treble
  \key f \major
  \time 4/4

  \partial 4 c f g a8( bes) c4 bes4 a g a
  a f bes a g2 f4 c f g a8( bes) c4 bes4 a g a
  a f bes a g2 f \bar "||"
}

text = \lyricmode {
\set stanza = "1. "  To Je -- sus Christ our Sov' -- reign King, who
  is the world's sal -- va -- tion, all praise and ho -- mage
  do we bring and thanks and a -- do -- ra -- tion.
}

versetwo = \lyricmode {
\set stanza = "2. " Your reign ex -- tend O King be -- nign
to e -- v'ry land and na -- tion; 
for in yout king -- dom Lord di -- vine, 
a -- lone we find sal -- va -- tion.
}

versethree = \lyricmode {
\set stanza = "3. " To you and to your Church, great King,
we pledge our heart's ob -- la -- tion; 
un -- til be -- fore your throne we sing
in end -- less ju -- bi -- la -- tion.
}

chorus = \relative c' {
  \clef treble
  \key f \major
  \time 4/4

 c'2 c4 c d2 d bes a4 g c2 c
 c,2 f4 a c2 bes4 a g1 f2. \bar "||"
}

refrain = \lyricmode {
 Christ Je -- sus Vic -- tor!
 Christ Je -- sus Ru -- ler!
 Christ Je -- sus Lord and Re -- deem -- er!
}

\score{
  <<
    \new Voice = "one" {
      \melody
    }
    \new Lyrics \lyricsto "one" \text
    \new Lyrics \lyricsto "one" \versetwo
    \new Lyrics \lyricsto "one" \versethree
  >>
  \layout { }
  \midi { }
}
\score{
  <<
    \new Voice = "one" {
      \chorus
    }
    \new Lyrics \lyricsto "one" \refrain
  >>
  \layout { }
  \midi { }
}
