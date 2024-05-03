\version "2.24.2"

\header {
  title = "O salutaris Hostia"
  composer = "Oreste Ravanello (1871-1938)"
  poet = "St. Thomas Aquinas (1225-1274)"
}

global = {
  \key d \major
  \time 4/4
  \dynamicUp
}

sopranonotes = \relative c' {
\bar ".|:"
  d2 e4 fis a2 g4( fis) e2 g fis1
  a2 b4 cis d2 cis b b cis1
  cis2 cis4 e d2. a4 b2 cis d1
  d2 cis4 b a2 b e,2 a4( g) fis1
\bar ":|."
  r1 r1 a2( b4 cis d2 b) a1~ a1
\bar "||"
}
sopranowords = \lyricmode { \set stanza = "1. "  O sa -- lu -- ta -- ris Hos -- ti -- a 
quae cae -- li pan -- dis os -- ti -- um,
bel -- la pre -- munt hos -- ti -- li -- a,
da ro -- bur fer au -- xi -- li -- um. A -- men. }
secondverse = \lyricmode { \set stanza = "2. " U -- ni tri -- no -- que Do -- mi -- no,
sit sem -- pi -- ter -- na glo -- ri -- a,
qui vi -- tam si -- ne ter -- mi -- no, 
no -- bis do -- net in pa -- tri -- a. }
altonotes = \relative c' {
  d2 e4 fis a2 g4( fis) e2 g fis1
  fis2 fis4 fis fis( gis) a2 a gis a1
  a2 a4 a a( g) fis2 g g fis1
  fis2 fis4 g fis2 e d cis d1
  d2( e4 fis a2 g) fis1 g1~( g2 fis4 e) fis1
}
altowords = \lyricmode {  \set stanza = "1. " O sa -- lu -- ta -- ris Hos -- ti -- a 
quae cae -- li pan -- dis os -- ti -- um,
bel -- la pre -- munt hos -- ti -- li -- a,
da ro -- bur fer au -- xi -- li -- um. A -- men, a -- men. }
tenornotes = \relative c' {
  d2 e4 fis a2 g4( fis) e2 g fis1
  d2 d4 cis b2 cis4( d) e2 e a,1
  a'2 a4 g fis4( e) d2 g e b1
  b2 a4 g d'2 g, a a d1
  r1 a2( b4 cis d2. cis4 b2 g) d'1~ d1
}
tenorwords = \lyricmode { \set stanza = "1. " O sa -- lu -- ta -- ris Hos -- ti -- a 
quae cae -- li pan -- dis os -- ti -- um,
bel -- la pre -- munt hos -- ti -- li -- a,
da ro -- bur fer au -- xi -- li -- um. A -- men. }

\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranonotes
      >>
      \new Lyrics \lyricsto "soprano" \sopranowords
      \new Lyrics \lyricsto "soprano" \secondverse
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altonotes
      >>
      \new Lyrics \lyricsto "alto" \altowords
      \new Lyrics \lyricsto "alto" \secondverse
    >>
    \new Staff <<
      \new Voice = "tenor" <<
        \global
        \tenornotes
      >>
      \new Lyrics \lyricsto "tenor" \tenorwords
      \new Lyrics \lyricsto "tenor" \secondverse
    >>
 >>
\midi {
    \tempo 2 = 72
}
\layout { }
}
