\version "2.24.2"


\header {
  title = "Hidden by Carmel"
  composer = "Josquin des Prés"
tagline = " "
}



global = {
  \key c \major
  \time 3/4
}

sopranonotes = \relative c'' {
g4 g g a2 a4 b2 b4 g2 r4
g4 g g a2 a4 b2 b4 g2 
g4 c2 c4 a2 a4 d4.( c8) b( a) g2
g4 c2 c4 d e4.( d8) c2 b4 c2.
}
origwords = \lyricmode { A -- ve ve -- ra Vir -- gi -- ni -- tas,
im -- ma -- cu -- la -- ta ca -- sti -- tas,
cu -- jus pu -- re -- fi -- ca -- ti -- o 
no -- stra fu -- it pur -- ga -- ti o. }
allwords = \lyricmode {Hid -- den by Car -- mel's cloi -- ster -- wall,
But e'en more ``hid with Christ in God,''
Love's vi -- ctim, who, in giv -- ing all,
Her ``Lit -- tle Way'' un -- swerv -- ing trod.
}
 
altonotes = \relative c' {
 e4 e e f4.( e8) d( c) b2 b4 c2 r4
 e4 e e f4.( e8) d( c) b2 b4 c2 
g'4 a2 a4 f2 f4 g2 d4 e2
g4 a4.( g8) f( e) d4( b) c f g2 c,2.
}
altowords = \lyricmode { re re re re }
tenornotes = \relative c' {
  \clef "G_8"
  r4 c4 c c d2 d4 e2 e4 c2
  r4 c4 c c d2 d4 e2 e4 c2
c4 f2 f4 d2 d4 g4.( f8) e( d) c2 
c4 f2 f4 g e f d2 c2.
}
tenorwords = \lyricmode { mi mi mi mi }
bassnotes = \relative c' {
  \clef bass
  c4 c c f,2 f4 g2 g4 c,2 r4
  c'4 c c f,2 f4 g2 g4 c,2
c'4 a2 a4 d2 d4 g,2 g4 c2 c4 a2 a4 b( g) a f4 g2 c,2.
}
basswords = \lyricmode { mi mi mi mi }

\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranonotes
      >>
      \new Lyrics \lyricsto "soprano" \allwords
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altonotes
      >>
      \new Lyrics \lyricsto "alto" \allwords
    >>
    \new Staff <<
      \new Voice = "tenor" <<
        \global
        \tenornotes
      >>
      \new Lyrics \lyricsto "tenor" \allwords
    >>
    \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassnotes
      >>
      \new Lyrics \lyricsto "bass" \allwords
    >>
  >>
}
