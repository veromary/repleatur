\version "2.24.2"

%\include "gregorian.ly"

\header {
	title = "Vexilla Regis"
        composer = "Christoph Dalitz, 2020, music.dalitio.de"
	poet = "Venantius Fortunatus (530-609)"
        meter = "Melody: anonymous (1846) after Vexilla regis"
        arranger = "ed. Veronica Brandt, 2024, brandt.id.au"
        copyright = "CC BY-SA 4.0 - music.dalitio.de/choir/dalitz/vexilla-regis/"
        tagline = "www.brandt.id.au"
}

\paper {
  system-system-spacing.basic-distance = #8
  score-system-spacing =
    #'((basic-distance . 12)
       (minimum-distance . 6)
       (padding . 10)
       (stretchability . 12))
}


chant = \relative c'' {
  \key bes \major
  \set Score.timing = ##f
  bes4 c( d) ees d( c bes) c c( d c) bes a4.( g4.) \bar "'"
  c4 c d bes( g) bes a( bes) g f4.( g4.) \bar "|" \break
  g4 g bes g8( f) bes4 bes8( c d) c4 c4.( bes4.) \bar "'"
  bes4 bes8( d ees d c) d4 bes( g) bes a( bes) g f4.( g4.) \bar "||"
}

chantamen = \relative c'' {
  \key bes \major
  \set Score.timing = ##f
  bes4 c( d) ees d( c bes) c c( d c) bes a4.( g4.) \bar "'"
  c4 c d bes( g) bes a( bes) g f4.( g4.) \bar "|"
  g4 g bes g8( f) \bar "" \break bes4 bes8( c d) c4 c4.( bes4.) \bar "'"
  bes4 bes8( d ees d c) d4 bes( g) bes a( bes) g f4.( g4.) \bar "|"
  g4( a g) f4.( g4.) \bar "||"
}

altowords = \lyricmode { \set stanza = "1. " Ve -- xil -- la re -- gis pro -- de -- unt, ful -- get Cru -- cis my -- ste -- ri -- um 
qua vi -- ta mor -- tem per -- tu -- lit,
et mor -- te vi -- tam pro -- tu -- lit. }

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

origversetwowords = \lyricmode { \set stanza = "2. " 
   Quo vul -- ne -- ra -- tus in -- su -- per
   Mu -- cro -- ne di -- ro  lan -- ce -- ae
   Ut nos la -- va -- ret  cri -- mi -- ne,
   Ma -- na -- vit un -- da_et san -- gui -- ne.
}

origsoptwowords = \lyricmode { \set stanza = "2. " 
   Quo vul -- ne -- ra -- tus in -- su -- per
   Mu -- cro -- ne di -- ro  lan -- ce -- ae
   Ma -- na -- vit un -- da_et san -- gui -- ne.
}

versethreewords = \lyricmode { \set stanza = "3. "
Im -- ple -- ta sunt quae con -- ci -- nit
Da -- vid fi -- de -- li car -- mi -- ne,
di -- cen -- do na -- ti -- o -- ni -- bus:
re -- gna -- vit a li -- gno De -- us. }

origversethreewords = \lyricmode { \set stanza = "3. "
Im -- ple -- ta sunt quae con -- ci -- nit
Da -- vid fi -- de -- li car -- mi -- ne,
Di -- cens: in na -- ti -- o -- ni -- bus:
Re -- gna -- vit a li -- gno De -- us. }

versefourwords = \lyricmode { \set stanza = "4. "
Ar -- bor de -- co -- ra_et ful -- gi -- da,
or -- na -- ta Re -- gis pur -- pu -- ra,
e -- le -- cta di -- gno sti -- pi -- te
tam san -- cta mem -- bra tan -- ge -- re.
}


sopfourwords = \lyricmode { \set stanza = "4. "
Ar -- bor de -- co -- ra_et ful -- gi -- da,
Or -- na -- ta Re -- gis pur -- pu -- ra,
Tam san -- cta mem -- bra tan -- ge -- re.
}

versefivewords = \lyricmode { \set stanza = "5. "
Be -- a -- ta, cu -- jus bra -- chi -- is
Pre -- tium pe -- pen -- dit sae -- cu -- li:
Sta -- te -- ra fa -- cta cor -- po -- ris,
Tu -- lit -- que prae -- dam tar -- ta -- ri.
}


origversefivewords = \lyricmode { \set stanza = "5. "
Be -- a -- ta, cu -- jus bra -- chi -- is
Sae -- cli pe -- pen -- dit pre -- tium,
Sta -- te -- ra fa -- cta cor -- po -- ris,
Prae -- dam -- que tu -- lit tar -- ta -- ri.
}

versesixwords = \lyricmode { \set stanza = "6. "
O Crux a -- ve, spes un -- i -- ca,
Hoc Pas -- si -- o -- nis tem -- po -- re!
Pi -- is ad -- au -- ge gra -- ti -- am,
Re -- is -- que de -- le cri -- mi -- na.}

origversesixwords = \lyricmode { \set stanza = "6. "
O Crux a -- ve, spes un -- i -- ca,
Hoc Pas -- si -- o -- nis tem -- po -- re!
Au -- ge pi -- is ju -- sti -- ti -- am,
Re -- is -- que do -- na ve -- ni -- am.}

origversesixwordstriumph = \lyricmode { \set stanza = "6. "
O Crux a -- ve, spes un -- i -- ca,
In hac tri -- um -- phi glo -- ri -- a!
Au -- ge pi -- is ju -- sti -- ti -- am,
Re -- is -- que do -- na ve -- ni -- am.}


sopsixwords = \lyricmode { \set stanza = "6. "
O Crux a -- ve, spes un -- i -- ca,
Hoc Pas -- si -- o -- nis tem -- po -- re!
Re -- is -- que de -- le cri -- mi -- na.}


origsopsixwords = \lyricmode { \set stanza = "6. "
O Crux a -- ve, spes un -- i -- ca,
Hoc Pas -- si -- o -- nis tem -- po -- re!
Re -- is -- que do -- na ve -- ni -- am.}

origsopsixwordstriumph = \lyricmode { \set stanza = "6. "
O Crux a -- ve, spes un -- i -- ca,
In hac tri -- um -- phi glo -- ri -- a!
Re -- is -- que do -- na ve -- ni -- am.}


versesixtriumph = \lyricmode { \set stanza = "6. "
O Crux a -- ve, spes un -- i -- ca,
In hac tri -- um -- phi glo -- ri -- a!
Pi -- is ad -- au -- ge gra -- ti -- am,
Re -- is -- que de -- le cri -- mi -- na.}


sopsixtriumph = \lyricmode { \set stanza = "6. "
O Crux a -- ve, spes un -- i -- ca,
In hac tri -- um -- phi glo -- ri -- a!
Re -- is -- que de -- le cri -- mi -- na.}

versesevenwords = \lyricmode { \set stanza = "7. "
Te, fons sa -- lu -- tis Tri -- ni -- tas,
Col -- lau -- det om -- nis spi -- ri -- tus:
Qui -- bus Cru -- cis vic -- to -- ri -- am
Lar -- gi -- ris, ad -- de prae -- mi -- um. A -- men. }


origversesevenwords = \lyricmode { \set stanza = "7. "
Te, fons sa -- lu -- tis Tri -- ni -- tas,
col -- lau -- det om -- nis spi -- ri -- tus:
quos per Cru -- cis mys -- te -- ri -- um
sal -- vas, re -- ge per sae -- cu -- la. A -- men. }

   global = {
     \key aes \major
     \time 4/4
     \dynamicUp
   }


   sopranonotes = \relative c'' {
   \override Slur.stencil = ##f
      \partial 4 aes8( bes) c4 des c bes c8( bes) aes( g) f4 bes4 c bes aes f8( g) aes4 g f2 |
    r1 r1 r2 r4 c'4 bes c aes f8( g) aes2 g f2. \bar "||"
   }
sopranowords = \lyricmode {  Ve -- xil -- la re -- gis pro -- de -- unt, ful -- get Cru -- cis my -- ste -- ri -- um
sus -- pen -- sus est pa -- ti -- bu -- lo. }

altonotes = \relative c'' {
\override Slur.stencil = ##f
   aes8( bes) c4 des c bes c8( bes) aes( g) f4 ees ees ees c des8( ees) f4 e f
f aes f ees aes c4.( bes16 aes g4 ees~ ees8) aes4( g8) aes4 aes g g f des c( f2) e4 f2. 
}

tenornotes = \relative c' {
\clef "G_8"
\override Slur.stencil = ##f
   \partial 4 aes8( bes) c4 des c bes c8( bes) aes( g) f4 
g aes g aes bes c c c2 
r2 r4 f, aes f ees aes c bes aes ees' ees ees c bes aes4.( bes8 c4) c4 c2.
}


bassnotes = \relative c' {
  \clef bass
\override Slur.stencil = ##f
   \partial 4 aes8( bes) c4 des c bes c8( bes) aes( g) f4 
ees aes ees f des c c f2
r1 r1 r2 r4 aes, ees' c f bes, f2' c f2.
}


\book {
   \bookOutputSuffix "passiontide"
\header {
  subtitle = "in Passiontide - SATB"
}

\markup {
   \vspace #5
   \line {
 Chant verses after the Liber Usualis:
    }
}




%%%
%   Chant verses 1, 3, 5 - passiontide
%%%

   \score {
     \transpose f d
     \new GregorianTranscriptionStaff <<
       \new GregorianTranscriptionVoice = "melody" \chant
       \new GregorianTranscriptionLyrics = "one" \lyricsto melody \altowords
       \new GregorianTranscriptionLyrics = "two" \lyricsto melody \versethreewords
       \new GregorianTranscriptionLyrics = "three" \lyricsto melody \versefivewords
     >>
   \layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

   }


%%%%
%
%%%%


\markup {
\vspace #5
\line {
Final verse:
}
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

\markup {
\vspace #5
}

\pageBreak

\markup {
\vspace #3
\line {
 Polyphonic verses:
}
}

\score {
  \transpose f e
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranonotes
      >>
      \new Lyrics \lyricsto "soprano" \soptwowords
      \new Lyrics \lyricsto "soprano" \sopfourwords
      \new Lyrics \lyricsto "soprano" \sopsixwords
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altonotes
      >>
      \new Lyrics \lyricsto "alto" \versetwowords
      \new Lyrics \lyricsto "alto" \versefourwords
      \new Lyrics \lyricsto "alto" \versesixwords
    >>
   \new Staff <<
      \new Voice = "tenor" <<
        \global
        \tenornotes
      >>
      \new Lyrics \lyricsto "tenor" \versetwowords
      \new Lyrics \lyricsto "tenor" \versefourwords
      \new Lyrics \lyricsto "tenor" \versesixwords
    >>
    \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassnotes
      >>
      \new Lyrics \lyricsto "bass" \soptwowords
      \new Lyrics \lyricsto "bass" \sopfourwords
      \new Lyrics \lyricsto "bass" \sopsixwords
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


}


\book {
   \bookOutputSuffix "triumph"
\header {
  subtitle = "outside Passiontide - SATB"
}
\markup {
\vspace #5
\line {
 Chant verses after the Liber Usualis:
    }
}





   \score {
     \transpose f d
     \new GregorianTranscriptionStaff <<
       \new GregorianTranscriptionVoice = "melody" \chant
       \new GregorianTranscriptionLyrics = "one" \lyricsto melody \altowords
       \new GregorianTranscriptionLyrics = "two" \lyricsto melody \versethreewords
       \new GregorianTranscriptionLyrics = "three" \lyricsto melody \versefivewords
     >>
   \layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

   }

\markup {
\vspace #5
\line {
Final verse:
}
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

\markup {
\vspace #5
}

\pageBreak

\markup {
\vspace #3
\line {
 Polyphonic verses:
}
}

\score {
  \transpose f e
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranonotes
      >>
      \new Lyrics \lyricsto "soprano" \soptwowords
      \new Lyrics \lyricsto "soprano" \sopfourwords
      \new Lyrics \lyricsto "soprano" \sopsixtriumph
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altonotes
      >>
      \new Lyrics \lyricsto "alto" \versetwowords
      \new Lyrics \lyricsto "alto" \versefourwords
      \new Lyrics \lyricsto "alto" \versesixtriumph
    >>
   \new Staff <<
      \new Voice = "tenor" <<
        \global
        \tenornotes
      >>
      \new Lyrics \lyricsto "tenor" \versetwowords
      \new Lyrics \lyricsto "tenor" \versefourwords
      \new Lyrics \lyricsto "tenor" \versesixtriumph
    >>
   \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassnotes
      >>
      \new Lyrics \lyricsto "bass" \soptwowords
      \new Lyrics \lyricsto "bass" \sopfourwords
      \new Lyrics \lyricsto "bass" \sopsixtriumph
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


}


\book {
   \bookOutputSuffix "passiontide-orig"
\header {
  subtitle = "in Passiontide - SATB"
}
\markup {
\vspace #5
\line {
	Chant verses after the Antiphonale Monasticum:
    }
}


   \score {
     \transpose f d
     \new GregorianTranscriptionStaff <<
       \new GregorianTranscriptionVoice = "melody" \chant
       \new GregorianTranscriptionLyrics = "one" \lyricsto melody \basswords
       \new GregorianTranscriptionLyrics = "two" \lyricsto melody \origversethreewords
       \new GregorianTranscriptionLyrics = "three" \lyricsto melody \origversefivewords
     >>
   \layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

   }

\markup {
\vspace #5
\line {
Final verse:
}
}
\score {
  \transpose f d
  \new GregorianTranscriptionStaff <<
    \new GregorianTranscriptionVoice = "melody" \chantamen
    \new GregorianTranscriptionLyrics = "one" \lyricsto melody \origversesevenwords
  >>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

}

\markup {
\vspace #5
}



\pageBreak


\markup {
\vspace #3
\line {
 Polyphonic verses:
}
}

\score {
  \transpose f e
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranonotes
      >>
      \new Lyrics \lyricsto "soprano" \origsoptwowords
      \new Lyrics \lyricsto "soprano" \sopfourwords
      \new Lyrics \lyricsto "soprano" \origsopsixwords
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altonotes
      >>
      \new Lyrics \lyricsto "alto" \origversetwowords
      \new Lyrics \lyricsto "alto" \versefourwords
      \new Lyrics \lyricsto "alto" \origversesixwords
    >>
   \new Staff <<
      \new Voice = "tenor" <<
        \global
        \tenornotes
      >>
      \new Lyrics \lyricsto "tenor" \versetwowords
      \new Lyrics \lyricsto "tenor" \versefourwords
      \new Lyrics \lyricsto "tenor" \origversesixwords
    >>
   \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassnotes
      >>
      \new Lyrics \lyricsto "bass" \origsoptwowords
      \new Lyrics \lyricsto "bass" \sopfourwords
      \new Lyrics \lyricsto "bass" \origsopsixwords
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

}


\book {
   \bookOutputSuffix "triumph-orig"
\header {
  subtitle = "outside Passiontide - SATB"
}
\markup {
\vspace #5
\line {
 Chant verses after the Antiphonale Monasticum:
    }
}


   \score {
     \transpose f d
     \new GregorianTranscriptionStaff <<
       \new GregorianTranscriptionVoice = "melody" \chant
       \new GregorianTranscriptionLyrics = "one" \lyricsto melody \basswords
       \new GregorianTranscriptionLyrics = "two" \lyricsto melody \origversethreewords
       \new GregorianTranscriptionLyrics = "three" \lyricsto melody \origversefivewords
     >>
   \layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

   }

\markup {
\vspace #5
\line {
Final verse:
}
}
\score {
  \transpose f d
  \new GregorianTranscriptionStaff <<
    \new GregorianTranscriptionVoice = "melody" \chantamen
    \new GregorianTranscriptionLyrics = "one" \lyricsto melody \origversesevenwords
  >>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

}


\markup {
\vspace #5
}


\pageBreak


\markup {
\vspace #3
\line {
 Polyphonic verses:
}
}

\score {
  \transpose f e
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranonotes
      >>
      \new Lyrics \lyricsto "soprano" \origsoptwowords
      \new Lyrics \lyricsto "soprano" \sopfourwords
      \new Lyrics \lyricsto "soprano" \origsopsixwordstriumph
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altonotes
      >>
      \new Lyrics \lyricsto "alto" \origversetwowords
      \new Lyrics \lyricsto "alto" \versefourwords
      \new Lyrics \lyricsto "alto" \origversesixwordstriumph
    >>
   \new Staff <<
      \new Voice = "tenor" <<
        \global
        \tenornotes
      >>
      \new Lyrics \lyricsto "tenor" \versetwowords
      \new Lyrics \lyricsto "tenor" \versefourwords
      \new Lyrics \lyricsto "tenor" \origversesixwordstriumph
    >>
 \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassnotes
      >>
      \new Lyrics \lyricsto "bass" \origsoptwowords
      \new Lyrics \lyricsto "bass" \sopfourwords
      \new Lyrics \lyricsto "bass" \origsopsixwordstriumph
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

}


