\version "2.24.4"

\header {
  title = "There is no Rose"
  composer = "English (15th century)"
}

melody = \relative c' {
  \clef treble
  \key d \major
  \time 3/4

  r4 r d fis2 g4 a b4.( a8) a4.( gis8) gis( fis) a2.
  r4 r a a g2 fis4.( e8) g( fis) d4.( cis8) cis( b) d2.
  r4 r a' fis4.( e8) fis( g) a4 b2 a( fis4) g( fis4. e8) fis4 r 
  e8( fis) d4.( cis8) d( cis)
  a4.( b8) cis4 d2 cis4 d2 r4
  d4.( e8 fis g) a4( g8 fis e4) d2( cis4 e d b) cis8( d e d g fis d4. cis8 cis b) d2.
}

harmony = \relative c' {
\clef bass
  \key d \major
  r4 r d, a' b2 a4 d2 cis b4 a2.
  r4 r a cis b2 a g4 d fis e d2.
  r4 r d'4 d cis b a e2 a b4 b a g fis r a b4. a8 b g a2 g4 fis2 e4 d2 r4
  d'4. cis8 d cis a4 b cis d b a~ a b2 a fis4 a g e d2.
}

text = \lyricmode {
There is no rose of such vir -- tue
As is the rose that bare Je -- su.
There is no rose of such vir -- tue
As is the rose that bare Je -- su.
Al -- le -- lu -- ia.
}

\score{
  \new ChoirStaff <<
    \new Staff = "women" <<
    \new Voice = "one" {
%      \autoBeamOff
      \melody
    }
    \new Lyrics \lyricsto "one" \text
    >>
    \new Staff = "men" <<
    \new Voice = "two" {
%        \autoBeamOff
        \harmony
    }
    >>
  >>
  \layout { }
  \midi { }
}

