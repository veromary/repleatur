\version "2.24.2"


\header {
  title = "Hidden by Carmel"
  composer = "Anthony Werner"
tagline = " "
}



global = {
  \key f \major
  \time 3/4
}

sopranonotes = \relative c' {
c4 d c f2 c4 d2 d4 c2.
c4 f a g2 e4 f( e) d c2.
c4 c c c( f) a bes2 a4 g2.
c4 c c c( a) f a2 g4 f2.
}
origwords = \lyricmode { A -- ve ve -- ra Vir -- gi -- ni -- tas,
im -- ma -- cu -- la -- ta ca -- sti -- tas,
cu -- jus pu -- re -- fi -- ca -- ti -- o 
no -- stra fu -- it pur -- ga -- ti o. }
allwords = \lyricmode { \set stanza = "1. " Hid -- den by Car -- mel's cloi -- ster -- wall,
But e'en more hid with Christ in God,
Love's vi -- ctim, who, in giv -- ing all,
Her Lit -- tle Way un -- swerv -- ing trod.
}
twowords = \lyricmode { \set stanza = "2. " No earth -- ly cloud e'er came be -- tween
Te -- re -- sa and her On -- ly Love,
While all un -- no -- tic'd and un -- seen,
She lived as an -- gels live a -- bove.
}
threewords = \lyricmode { \set stanza = "3. " And still her pray'rs make sick men whole,
To an -- guish'd minds bring peace and rest
More wond -- rous still, those heal'd in soul
By thou -- sands rise, and call her blest.
}
fourwords = \lyricmode { \set stanza = "4. " Te -- re -- sa of the Child Di -- vine
Styl'd Saint by Ho -- ly Church -- 's pow'r,
The sa -- cred au -- re -- ole is thine
But still thou'rt Je -- sus' Lit -- tle Flower.
}
 
altonotes = \relative c' {
a4 bes a a( bes) c bes2 bes4 c2.
c4 d f8( e) d2 c4 d( c) b c2.
c4 c c a( c) f8( e) d4( e) f f( d e)
f e f c( e) d f( d) e c2.
}
tenornotes = \relative c {
  \clef "G_8"
f4 f f f2 f4 f2 f8( g) a2.
g4 a c c( b) a a( g) g8( f) e2.
g4 f e f( a) c bes2 c4 c2.
c4 bes a g( c) a c2 c8( bes) a2.
}
bassnotes = \relative c, {
  \clef bass
f4 bes f f( g) a bes( c) d8( e) f2.
e4 d f, g2 a4 f( g) g c2.
e4 d c f( a,) f g2 a8( bes) c4( c' bes)
a4 g f e( c) d c2 c4 f2.
}

\score {
  \new ChoirStaff <<
    \new Staff = "women" <<
      \new Voice = "soprano" {
        \voiceOne
        << \global \sopranonotes >> 
        }
      \new Voice = "alto" {
        \voiceTwo
        << \global \altonotes >> 
        }
      >>
      \new Lyrics \lyricsto "alto" \allwords
      \new Lyrics \lyricsto "alto" \twowords
      \new Lyrics \lyricsto "alto" \threewords
      \new Lyrics \lyricsto "alto" \fourwords
    \new Staff = "men" <<
      \new Voice = "tenor" {
        \voiceOne
        << \global \tenornotes >>
        }
      \new Voice = "bass" {
        \voiceTwo
        << \global \bassnotes >>
        }
    >>
  >>
  \layout { }
  \midi { }
}
