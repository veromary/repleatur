\version "2.24.2"
\paper {
  top-system-spacing.basic-distance = #10
  score-system-spacing.basic-distance = #20
  system-system-spacing.basic-distance = #20
  last-bottom-spacing.basic-distance = #10
}

global = {
  \key c \major
  \time 4/4
}

melody = \relative c'' {
  \clef treble

r1 r1 g2 a4 b c2.
g4 a2( f4 e8 d) e2. 
e4 a4. a8 a4 b c2 c4 b a2( b4 a8 gis) a2.
g4 e'2( f4) e8( d) c2. g4 e'2( f4 e8 d) e2.
e,4 c'4. c8
}

harmony = \relative c'' {

s1 s1 r1 r1 r1 r1 r1 r1 r1 r1
g2 a4 b c2. g4 a2( f4 e8 d) e2.

}

text = \lyricmode {
  As -- sum -- pta est Ma -- ri -- a,
  as -- sum -- pta est Ma -- ri -- a
  in cae -- lum,
  as -- sum -- pta est Ma -- ri -- a,
  as -- sum -- pta est Ma -- ri -- a
  in cae -- lum:
}


texttwo = \lyricmode {
  As -- sum -- pta est Ma -- ri -- a,
  as -- sum -- pta est Ma -- ri -- a
  in cae -- lum:

}

upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  g,1( g2) c4 d e1( d2) f4 g
a2 f4 e8 d e1( e1)( e2) f2 e1( e2.)
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  g2 c4 d e2 f4 e8 d c1( c2) d4 e
 f1 r4 e4 a b c2. b4 a1( a2) b4 a8 gis a2. r4
g2 a4 b c b8 a g2 a1
}

\score {
  \new ChoirStaff <<
    \new Lyrics = "sopranos" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
    \new Staff = "women" <<
      \new Voice = "sopranos" {
        \voiceOne
        << \global \melody >>
      }
      \new Voice = "altos" {
        \voiceTwo
        << \global \harmony >>
      }
    >>
    \new Lyrics = "altos"
   \new PianoStaff <<
      \new Staff = "upper" \upper
      \new Staff = "lower" \lower
    >>
    \context Lyrics = "sopranos" \lyricsto "sopranos" \text
    \context Lyrics = "altos" \lyricsto "altos" \texttwo
  >>
  \layout {
    \context { \Staff \RemoveEmptyStaves }
  }
  \midi { }
}
