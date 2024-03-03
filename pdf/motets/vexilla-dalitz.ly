\version "2.24.2"

%\include "gregorian.ly"

chant = \relative c'' {
  \key f \major
  \set Score.timing = ##f
  bes4 c( d) ees d( c bes) c c( d c) bes a( g4.) \divisioMinima
  g4 b a2 f2 \divisioMaior
  g4( f) f( g) a2 \finalis
}

verba = \lyricmode {
  Lo -- rem ip -- sum do -- lor sit a -- met
}
altowords = \lyricmode { Ve -- xil -- la re -- gis pro -- de -- unt, ful -- get Cru -- cis my -- ste -- ri -- um 
quo car -- ne car -- nis con -- di -- tor
sus -- pen -- sus est pa -- ti -- bu -- lo. }
\score {
  \transpose f d
  \new GregorianTranscriptionStaff <<
    \new GregorianTranscriptionVoice = "melody" \chant
    \new GregorianTranscriptionLyrics = "one" \lyricsto melody \altowords
  >>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

}

global = {
  \key f \major
  \time 4/4
  \dynamicUp
}


sopranonotes = \relative c'' {
   \partial 4 bes8( c) d4 ees d c d8( c) bes( a) g4 c4 d c bes g8( a) bes4 a g2 |
 r1 r1 r2 r4 d'4 c d bes g8( a) bes2 a g2. \bar "||"
}
sopranowords = \lyricmode {  Ve -- xil -- la re -- gis pro -- de -- unt, ful -- get Cru -- cis my -- ste -- ri -- um
sus -- pen -- sus est pa -- ti -- bu -- lo. }
altonotes = \relative c'' {
   \partial 4 bes8( c) d4 ees d c d8( c) bes( a) g4 a bes a d, ees8( f) g4 fis g
 g bes g f bes d4.( c16 bes a4 f~ f8) bes4( a8) bes4 f f f d ees d( g2) fis4 g2.
}

bassnotes = \relative c' {
  \clef bass
   \partial 4 bes8( c) d4 ees d c d8( c) bes( a) g4 f bes f g c d d g,2
  r2 r4 g4 bes g f bes d c bes bes a f g c g8.( a16 bes8 c d4) d,4 g2.
}
basswords = \lyricmode { Ve -- xil -- la re -- gis pro -- de -- unt, ful -- get Cru -- cis my -- ste -- ri -- um 
quo car -- ne car -- nis con -- di -- tor
sus -- pen -- sus est pa -- ti -- bu -- lo. }

versetwowords = \lyricmode {
   Quae vul -- ne -- ra -- ta lan -- ce -- ae
   Mu -- cro -- ne di -- ro cri -- mi -- num
   Ut nos la -- va -- ret sor -- di -- bus,
   Ma -- na -- vit un -- da_et san -- gui -- ne.
}

soptwowords = \lyricmode {
   Quae vul -- ne -- ra -- ta lan -- ce -- ae
   Mu -- cro -- ne di -- ro cri -- mi -- num
   Ma -- na -- vit un -- da_et san -- gui -- ne.
}



\score {
  \transpose f d
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranonotes
      >>
      \new Lyrics \lyricsto "soprano" \soptwowords
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altonotes
      >>
      \new Lyrics \lyricsto "alto" \versetwowords
    >>
   \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassnotes
      >>
      \new Lyrics \lyricsto "bass" \versetwowords
    >>
  >>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }} 
}

