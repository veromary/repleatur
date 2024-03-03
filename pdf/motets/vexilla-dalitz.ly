\version "2.24.2"

%\include "gregorian.ly"

\header {
	title = "Vexilla Regis"
        composer = "Christoph Dalitz, 2020"
	poet = "Venantius Fortunatus"
}

chant = \relative c'' {
  \key bes \major
  \set Score.timing = ##f
  bes4 c( d) ees d( c bes) c c( d c) bes a( g4.) \bar "'"
  c4 c d c( g) bes a( bes) g f( g4.) \bar "|" \break
  g4 g bes g8( f) bes4 bes8( c d) c4 c4( bes4.) \bar "'"
  bes4 bes8( d ees d c) d4 bes( g) bes a( bes) g f4( g4.) \bar "||"
}

chantamen = \relative c'' {
  \key bes \major
  \set Score.timing = ##f
  bes4 c( d) ees d( c bes) c c( d c) bes a( g4.) \bar "'"
  c4 c d c( g) bes a( bes) g f( g4.) \bar "|"
  g4 g bes g8( f) \bar "" \break bes4 bes8( c d) c4 c4( bes4.) \bar "'"
  bes4 bes8( d ees d c) d4 bes( g) bes a( bes) g f4( g4.) \bar "|"
  g4( a g) f( g4.) \bar "||"
}

altowords = \lyricmode { \set stanza = "1. " Ve -- xil -- la re -- gis pro -- de -- unt, ful -- get Cru -- cis my -- ste -- ri -- um 
qua vi -- ta mort -- em per -- tu -- lit,
et mort -- e vi -- tam pro -- tu -- lit. }

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
  \key bes \major
  \time 4/4
  \dynamicUp
}


sopranonotes = \relative c'' {
\override Slur.stencil = ##f
   \partial 4 bes8( c) d4 ees d c d8( c) bes( a) g4 c4 d c bes g8( a) bes4 a g2 |
 r1 r1 r2 r4 d'4 c d bes g8( a) bes2 a g2. \bar "||"
}
sopranowords = \lyricmode {  Ve -- xil -- la re -- gis pro -- de -- unt, ful -- get Cru -- cis my -- ste -- ri -- um
sus -- pen -- sus est pa -- ti -- bu -- lo. }
altonotes = \relative c'' {
\override Slur.stencil = ##f
   \partial 4 bes8( c) d4 ees d c d8( c) bes( a) g4 a bes a d, ees8( f) g4 fis g
 g bes g f bes d4.( c16 bes a4 f~ f8) bes4( a8) bes4 f f f d ees d( g2) fis4 g2.
}

bassnotes = \relative c' {
  \clef bass
\override Slur.stencil = ##f
   \partial 4 bes8( c) d4 ees d c d8( c) bes( a) g4 f bes f g c d d g,2
  r2 r4 g4 bes g f bes d c bes bes a f g c g8.( a16 bes8 c d4) d,4 g2.
}
basswords = \lyricmode { \set stanza = "1. " Ve -- xil -- la re -- gis pro -- de -- unt, ful -- get Cru -- cis my -- ste -- ri -- um 
quo car -- ne car -- nis con -- di -- tor
sus -- pen -- sus est pa -- ti -- bu -- lo. }

versetwowords = \lyricmode { \set stanza = "2. " 
   Quae vul -- ne -- ra -- ta lan -- ce -- ae
   Mu -- cro -- ne di -- ro cri -- mi -- num
   Ut nos la -- va -- ret sor -- di -- bus,
   Ma -- na -- vit un -- da_et san -- gui -- ne.
}

soptwowords = \lyricmode { \set stanza = "2. " 
   Quae vul -- ne -- ra -- ta lan -- ce -- ae
   Mu -- cro -- ne di -- ro cri -- mi -- num
   Ma -- na -- vit un -- da_et san -- gui -- ne.
}

versethreewords = \lyricmode { \set stanza = "3. "
Im -- ple -- ta sunt quae con -- ci -- nit
Da -- vid fi -- de -- li car -- mi -- ne,
di -- cen -- do na -- ti -- o -- ni -- bus:
re -- gna -- vit a li -- gno De -- us. }

versefourwords = \lyricmode { \set stanza = "4. "
Ar -- bor de -- co -- ra_et ful -- gi -- da,
or -- na -- ta Re -- gis pur -- pu -- ra,
e -- le -- cta di -- gno sti -- pi -- te
tam san -- cta mem -- bra tan -- ge -- re.
}


sopfourwords = \lyricmode { \set stanza = "4. "
Ar -- bor de -- co -- ra_et ful -- gi -- da,
or -- na -- ta Re -- gis pur -- pu -- ra,
tam san -- cta mem -- bra tan -- ge -- re.
}

versefivewords = \lyricmode { \set stanza = "5. "
Be -- a -- ta, cu -- jus bra -- chi -- is
pre -- tium pe -- pen -- dit sae -- cu -- li:
sta -- te -- ra fa -- cta cor -- po -- ris,
tu -- lit -- que prae -- dam tar -- ta -- ri.
}

versesixwords = \lyricmode { \set stanza = "6. "
O Crux a -- ve, spes un -- i -- ca,
hoc Pas -- si -- o -- nis tem -- po -- re!
pi -- is ad -- au -- ge gra -- ti -- am,
re -- is -- que de -- le cri -- mi -- na.}


sopsixwords = \lyricmode { \set stanza = "6. "
O Crux a -- ve, spes un -- i -- ca,
hoc Pas -- si -- o -- nis tem -- po -- re!
re -- is -- que de -- le cri -- mi -- na.}

versesevenwords = \lyricmode { \set stanza = "7. "
Te, fons sa -- lu -- tis Tri -- ni -- tas,
col -- lau -- det om -- nis spi -- ri -- tus:
qui -- bus Cru -- cis vic -- to -- ri -- am
lar -- gi -- ris, ad -- de prae -- mi -- um. A -- men. }

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

\score {
  \transpose f d
  \new GregorianTranscriptionStaff <<
    \new GregorianTranscriptionVoice = "melody" \chant
    \new GregorianTranscriptionLyrics = "one" \lyricsto melody \versethreewords
  >>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

}


\score {
  \transpose f d
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranonotes
      >>
      \new Lyrics \lyricsto "soprano" \sopfourwords
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altonotes
      >>
      \new Lyrics \lyricsto "alto" \versefourwords
    >>
   \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassnotes
      >>
      \new Lyrics \lyricsto "bass" \versefourwords
    >>
  >>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

}

\score {
  \transpose f d
  \new GregorianTranscriptionStaff <<
    \new GregorianTranscriptionVoice = "melody" \chant
    \new GregorianTranscriptionLyrics = "one" \lyricsto melody \versefivewords
  >>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

}


\score {
  \transpose f d
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranonotes
      >>
      \new Lyrics \lyricsto "soprano" \sopsixwords
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altonotes
      >>
      \new Lyrics \lyricsto "alto" \versesixwords
    >>
   \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassnotes
      >>
      \new Lyrics \lyricsto "bass" \versesixwords
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

\score {
  \transpose f d
  \new GregorianTranscriptionStaff <<
    \new GregorianTranscriptionVoice = "melody" \chantamen
    \new GregorianTranscriptionLyrics = "one" \lyricsto melody \versesevenwords
  >>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

}



