\paper {
  #(set-paper-size '(cons (* 597.508 pt) (* 845.047 pt)))
  indent = 0\mm
  line-width = 170\mm
  % offset the left padding, also add 1mm as lilypond creates cropped
  % images with a little space on the right
  line-width = #(- line-width (* mm  3.000000) (* mm 1))
  line-width = 160\mm - 2.0 * 10.16\mm
  % offset the left padding, also add 1mm as lilypond creates cropped
  % images with a little space on the right
  line-width = #(- line-width (* mm  3.000000) (* mm 1))
}

\header {
  title = "Pange Lingua"
  composer = "attrib Palestrina"
  poet = "St Thomas Aquinas OP, 1225-1274"
}


\layout {
  
}

global = {
  \time 3/2
  \key a \minor
  \set Staff.midiInstrument = "church organ"
}

SopranoMusic = \relative c'' {
\global
 gis1 gis2 a1 a2 g1 g2 g1 g2
 c2. c4 c2 d c2. c4 b1.
 b1 b2 c1 c2 b1 c2 b1 b2
 c2. c4 a2 a2 a2. a4 a1.
 c1 c2 b1 b2 b1 c2 b1 b2
 a2. a4 a2 a2 gis1( a1) a2 gis1. }
AltoMusic = \relative c' { e1 e2 c1 f2 d1 d2 e1 e2
 g2. g4 g2 g2 g2 fis2 g1.
 g1 g2 g1 g2 g1 e2 g1 g2
 e2. e4 f2 f e2. e4 fis1.
 g1 g2 g1 g2 g1 e2 g1 g2
 e2. e4 f2 f2 e1~ e1 e2 e1. }
VerseOne = \lyricmode {
  \set stanza = "2."
  No -- bis da -- tus, no -- bis na -- tus,
  Ex in -- tac -- ta Vir -- gi -- ne,
  Et in mun -- do con -- ver -- sa -- tus
  Spar -- so ver -- bi se -- mi -- ne
  Su -- i mo -- ras in -- co -- la -- tus
  Mi -- ro clau -- sit or -- di -- ne.
}
VerseTwo = \lyricmode {
  \set stanza = "4."
  Ver -- bum ca -- ro, pa -- nem ve -- rum
  Ver -- bo car -- nem ef -- fi cit,
  Fit -- que san -- guis Chri -- sti me -- rum:
  Et si sen -- sus de -- fi -- cit
  Ad fir -- man -- dum cor sin -- ce -- rum
  So -- la fi -- des suf -- fi -- cit.
}
VerseThree = \lyricmode {
  \set stanza = "6."
  Ge -- ni -- to -- ri, Ge -- ni -- to -- que,
  Laus et ju -- bi -- la -- ti -- o
  Sa -- lus ho -- nor vir -- tus quo -- que
  Sit et be -- ne -- di -- cti -- o
  Pro -- ce -- den -- ti ab u -- tro -- que
  Com -- par sit lau -- da -- ti -- o.
}
TenorMusic = \relative { b1 b2 a1 d2 b1 b2 c1 c2
 e2. e4 e2 d2 e c d1.
 d1 d2 e1 e2 d1 c2 d1 d2 c2. c4 d2 d cis2. cis4 d1.
 e1 e2 d1 e2 d1 c2 d1 d2
 c2. c4 c2 d b1( c) c2 b1.}
BassMusic = \relative c { e1 e2 f1 d2 g1 g2 c,1 c2
  c'2. c4 c2 b2 a2 a2 g1.
  g1 g2 e1 c2 g'1 a2 g1 g2 a2. a4 f2 d a'2. a4 d,1.
  c1 e2 g1 e2 g1 a2 g1 g2 a2. a4 f2 d2 e1( a,) a2 e'1. }
TwoVoicesPerStaff = ##t
\include "satb.ly"

%%% Amen score block

\score{

  \new ChoirStaff

   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	         \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne \time 2/1 (a'1 a1 b1 a) gis  \bar "||" }}
	         \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo e1 f g c,2 d e1 \bar "||" }}
	                      >>
	         \context Lyrics \lyricsto "sopranos" {\override LyricText #'font-size = #-1  A -- men. }
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	         \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 d~ d2 g, a1 b1 \bar "||" }}
	         \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a'1 d, g f e \bar "||" }}
			        >> 

  >>			      

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-bottom = ##t
	indent = 5\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }}
}


