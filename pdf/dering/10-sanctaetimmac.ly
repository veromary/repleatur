\version "2.18.2"

\header {
  title = "Sancta et Immaculata Virginitas"
  composer = "M Richard Dering"
  tagline = "typeset VB 2017 brandt.id.au"
}

global = {
  \key c \major
  \time 4/4
  \dynamicUp
}
primusnotes = \relative c' {
  \clef "treble_8"
  d1 b b4 c d b d2. a8 a a2. a4 g1
  r\longa r2 d'2 b1 r1 a4 b c a gis fis8 e a1 gis2 a1
  r4 d2 d8 d d4. d8 d2 r4 c2 b8 a b4( c2) b4 c2 e2. d8 c d1 cis2 d
  r4 d4 b8 b b c d4. d8 g,2 
  r4 d'4 b8 b b b cis4. cis8 d2 
  r4 b4 gis8 gis gis gis a4. gis8 gis4 gis a2~ a4 gis4 a2~ a
  r\breve r1 r4 c8 d e4. d8 c4 b8( a) b4( c2) b4 c1
  r2 gis1 gis2 gis2. gis4 a gis a fis gis2. gis4 gis1
  r2 b1 b2 b2. b4 c b c a b( c2) b4 c2
  r2 r\breve r2 d2 cis8 cis cis cis d4. a8 b4 c b2 a1
  r4 a4 fis8 fis fis fis g4. fis8 e4 g fis( g2) fis4 g\breve
}
primuswords = \lyricmode { San -- cta et im -- ma -- cu -- la -- ta vir -- gi -- ni -- tas
             san -- cta et im -- ma -- cu -- la -- ta vir -- gi -- ni -- tas 
             qui -- bus te lau -- di -- bus ef -- fe -- ram ne -- sci -- o ef -- fe -- ram ne -- sci -- o 
             qui -- a quem Coe -- li ca -- pe -- re 
             qui -- a quem Coe -- li ca -- pe -- re 
             qui -- a quem Coe -- li ca -- pe -- re 
             non po -- te -- rant 
             tu -- o gre -- mi -- o con -- tu -- li -- sti 
             Be -- ne -- di -- cta tu in mu -- li -- e -- ri -- bus
             Be -- ne -- di -- cta tu in mu -- li -- e -- ri -- bus 
             et be -- ne -- di -- ctus fru -- ctus ven -- tris tu -- i
             et be -- ne -- di -- ctus fru -- ctus ven -- tris tu -- i
             }
secondnotes = \relative c' {
 \clef "treble_8"
  r\longa r1 d1 b b4 c d b d2. a8 a a2. a4 g1
  r2 d'2 b1 c4 d e c e2. b8 b b2. b4 a1
  r4 b2 b8 b b4. b8 b2 r4 e2 d8 c d2. d4 c1 a2. g8 f e2. e4 d1
  r4 d'4 b8 b b c d4. d8 b2 
  r4 g4 e8 e e e fis4. fis8 g2
  r4 e'4 c8 c c d e4. d8 c4 b b2. b4 a2
  r4 c8 d e4. d8 c4 b8 a d1 c
  r\breve r1 r2 b1 b2 b2. b4 c4 b c a b2. b4 b1
  r2 d1 d2 d2. d4 e d e c d2. d4 c2 c b8 b b b d4. a8
  b4 c a2 g1
  r\breve r2 e'2 cis8 cis cis cis d2 b c4 b a1 g\breve
}
secondwords = \lyricmode { San -- cta et im -- ma -- cu -- la -- ta vir -- gi -- ni -- tas 
             san -- cta et im -- ma -- cu -- la -- ta vir -- gi -- ni -- tas 
             qui -- bus te lau -- di -- bus ef -- fe -- ram ne -- sci -- o ef -- fe -- ram ne -- sci -- o
             qui -- a quem Coe -- li ca -- pe -- re 
             qui -- a quem Coe -- li ca -- pe -- re 
             qui -- a quem Coe -- li ca -- pe -- re 
             non po -- te -- rant 
             tu -- o gre -- mi -- o con -- tu -- li -- sti 
             Be -- ne -- di -- cta tu in mu -- li -- e -- ri -- bus
             Be -- ne -- di -- cta tu in mu -- li -- e -- ri -- bus
             et be -- ne -- di -- ctus fru -- ctus ven -- tris tu -- i
             et be -- ne -- di -- ctus fru -- ctus ven -- tris tu -- i
             }
bassnotes = \relative c' {
  \clef bass
 g\breve g1 b,2. c4 d1 g,\breve g'1 b,2. c4 d1 g, g'\breve a,1 e'2. d4 e1 a, g\breve
 c2 a g1 c f2. e8d a1 d g g2 g,1 a2 d g, e' a, e'\breve a,2 a' a1 g
 c,1 c4 d e f g1 c,1 e\breve e1 a, e'\breve g,\breve g'1 c, g c g'2 fis g4 c, d2
 g,1 a4 a' fis2 gis4 a e2 a,1 a2 d g, c4 g d'1 g,\breve
}

\score {
  \new ChoirStaff <<
    \new Staff \with {
        instrumentName = #"Tenor 1 "
      }
       <<
      \new Voice = "primus" <<
        \global
        \primusnotes
      >>
      \lyricsto "primus" \new Lyrics \primuswords
    >>
    \new Staff \with {
        instrumentName = #"Tenor 2 "
      }
    <<
      \new Voice = "second" <<
        \global
        \secondnotes
      >>
      \lyricsto "second" \new Lyrics \secondwords
    >>
    \new Staff \with {
        instrumentName = \markup {
        \center-column { "Basso "
        \line { "continuo" }
      } } } 
 <<
      \new Voice = "bass" <<
        \global
        \bassnotes
      >>
    >>
  >>
  \layout { }
  \midi { 
    \tempo 4 = 120
   }
}


