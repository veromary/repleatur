\version "2.12.3"

\paper
{
        #(set-paper-size "a4")
	#(define fonts
	 (make-pango-font-tree "LinuxLibertineO"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ 20 20)))
    %indent = 0.0
    %line-width = 185 \mm
    %between-system-space = 5 \mm
    between-system-padding = #1
    ragged-bottom = ##t
    %top-margin = 0.1 \mm
    %bottom-margin = 0.1 \mm
    %foot-separation = 0.1 \mm
    %head-separation = 0.1 \mm
    %before-title-space = 0.1 \mm
    %between-title-space = 0.1 \mm
    %after-title-space = 0.1 \mm
    %paper-height = 32 \cm
    %print-page-number = ##t
    %print-first-page-number = ##t
    %ragged-last-bottom
    %horizontal-shift
    %system-count
    %left-margin
    %paper-width
    %printallheaders
    %systemSeparatorMarkup
}


%#(set-global-staff-size 23)

\header {
        title = "Veni Creator"
        poet = "Rabanus Maurus (776-856)"
        meter = ""
        composer = "arr Mar. de Jong"
        arranger = "Nova Organi Harmonia (VII)"
        tagline = "Transcribed by V. Brandt, 2012 - http://brandt.id.au - This edition may be edited, copied and distributed."
}

global = {
       \key bes \major
}

chant = \relative c' {
        \voiceOne
        \time 10/4
        f4 g f( ees) f g( f) bes c bes
        \time 9/4
        bes f g bes c( bes) c d c
        \time 12/4
        bes c( d) bes( a) g( f) bes( c) f, g bes
        a( bes) g f( ees) g g( a g) f ees f
        \bar "||"
        } 	


chantamen = \relative c' {
        \voiceOne
        \time 10/4
        f4 g f( ees) f g( f) bes c bes
        \time 9/4
        bes f g bes c bes c d c
        \time 12/4
        bes c( d) bes( a) g( f) bes( c) f, g bes
        a( bes) g f( ees) g g( a g) f ees f
        \bar "||"
       \time 5/4 f4( g f) ees4( f4) \bar "|."
        } 	

alt = \relative c' {
       \voiceTwo
       d2 c2.( c2) d2.
       f1( f2)( f2)( f4)
       d1( s4 d2) ees2 f2.
       d2( d4) s4 ees2 d2. c2( c4)
       }

ten = \relative c' {
       \voiceThree
       s4 bes4 c2 bes4 a2 bes2.
       d4( d2) bes4( bes2)( bes2) a4
       s4 a2 bes2( bes) c d2.(
       d2) a4 bes2( bes4)( bes2.)( bes2) a4
       }

bass = \relative c' {
       \voiceFour
       s1 s2. g2.(
       g4) a2( a4) g2 f2( f4)
       g4( g2)( g2) bes s1 s4
       g2( g4)( g2) ees4( ees2.) g2 f4
       }

altb = \relative c' {
      \voiceTwo
d2 s1 s4 d2( d4)
f2( s2 f2.)( f2)
f4( f2) ees c d1( d4)(
d2)( d4) c2( c4) bes2.( bes2) a4
}

tenb = \relative c' {
      \voiceThree
s4 bes4( bes2)( bes4) a2 g2 bes4
d4 c2 bes4( bes2.) a2
g4 f2 g2( g)( g) a g4(
g2) a4 g2 ees4( ees2.) c2( c4)
}

basb = \relative c {
      \voiceFour
bes4( bes) c2 d4( d2) g2( g4)
d2.( d4) g2. f2
s4 d2 c a g1( g4)
bes2( bes4) c2( c4)( c2.) g2 f4
}

altc = \relative c' {
       \voiceTwo
d2 c2.( c2) d2.
f2.( f4)( f2)( f)( f4)
f4( f2) e2 c2 d1( d4)(
d2)( d4) c2( c4) bes2.( bes2) a4
bes2.( bes2)
       }

tenc = \relative c' {
       \voiceThree
bes2 c bes4 a2 bes2.
d4 c2 bes4( bes2)( bes2) a4
g4 f2 g2( g)( g) a g4(
g2) a4 g2 ees4( ees2.) c2( c4)
d2. c4 d
       }

basc = \relative c' {
       \voiceFour
s1 s2. g2.
d2.( d4) g2 f2( f4)
s4 d2 c2 a g1( g4)
bes2( bes4) c2( c4)( c2.) g2 f4
bes2.( bes2)
       }


verba = \lyricmode {
     \set stanza = "1. "
     Ve -- ni Cre -- a -- tor Spi -- ri -- tus,
     Men -- tes tu -- o -- rum vi -- si -- ta:
    Im -- ple su -- per -- na gra -- ti -- a,
    Quae tu cre -- a -- sti pe -- cto -- ra.
       }

verseii = \lyricmode {
    \set stanza = "2. "
   Qui di -- ce -- ris Pa -- ra cli -- tus,
Al -- tis -- si -- mi do -- num De -- i,
Fons vi -- vus i -- gnis ca -- ri -- tas,
Et spi -- ri -- ta -- lis un -- cti -- o.
}

verseiii = \lyricmode {
    \set stanza = "3. "
    Tu se -- pti -- for -- mis mu -- ne -- re,
    Digi -- tus pa -- ter -- nae dex -- te -- rae,
    Tu ri -- te pro -- mis -- sum Pa -- tris,
    Ser -- mo -- ne di --  tans gut -- tu -- ra.
}


verseiv = \lyricmode {
    \set stanza = "4. "
Ac -- cen -- de lu -- men sen -- si -- bus,
In -- fun -- de'a -- mo -- rem cor -- di -- bus,
In -- fir -- ma no -- stri cor -- po -- ris
Vir -- tu -- te fir -- mans per -- pe -- ti.
}


versev = \lyricmode {
    \set stanza = "5. "
Ho -- stem re -- pel -- las lon -- gi -- us,
Pa -- cem -- que do -- nes pro -- ti -- nus:
Du -- cto -- re sic te prae -- vi -- o,
Vi -- te -- mus o -- mne no -- xi -- um.
}

versevi = \lyricmode {
    \set stanza = "6. "
Per te sci -- a -- mus da Pa -- trem,
No -- sac -- mus at -- que Fi -- li -- um
Te -- que'u -- tri -- us -- que Spi -- ri -- tum
Cre -- da -- mus o -- mni tem -- po -- re.
}

versevii  = \lyricmode {
    \set stanza = "7. "
De -- o Pa -- tri sit glo -- ri -- a,
Et Fi -- li -- o, qui a mor -- tu -- is
Sur -- re -- xit, ac Pa -- ra -- cli -- to,
In sae -- cu -- lo -- rum sae -- cu -- la.
A -- men.
}



\score {
        \transpose bes g
        <<
	\new ChoirStaff <<
	    \set Score.midiInstrument = "Pipe Organ"
	    %\set Score.midiInstrument = "Choir Aahs"
	\new Staff = "plainchant" <<
          \clef treble
          \global 
          \new Voice = "melody" \chant
	  \new Lyrics \lyricsto "melody" \verba
          \new Lyrics \lyricsto "melody" \verseiii
          \new Lyrics \lyricsto "melody" \versev
          \new Voice = "alto" << \alt >>
                  >>
	\new Staff = bass <<
          \global
             \clef bass
            \new Voice = "tenors" << \ten >> 
            \new Voice = "bass" << \bass >>
	  >>
        >>
        >>
	\midi { }
	\layout{
            \context {
               \Staff
               \remove "Time_signature_engraver"
               %\remove "Bar_engraver"
               \override BarLine #'X-extent = #'(-1 . 1)
               \override Beam #'transparent = ##t
               \override Stem #'transparent = ##t
               %\override BarLine #'transparent = ##t
               %\override TupletNumber #'transparent = ##t
             }
            \context {
               \Lyrics
               \consists "Bar_engraver"
             }
	}
}

\score {
         \transpose bes g
        <<
	         \new ChoirStaff <<
          \new Staff <<
          \global
          \clef treble
          \new Voice = "altverse" { \chant }
          \new Lyrics \lyricsto "altverse" \verseii
          \new Lyrics \lyricsto "altverse" \verseiv
          \new Lyrics \lyricsto "altverse" \versevi
          \new Voice = "altalto" << \altb >>
          >>
          \new Staff <<
          \global
          \clef bass
          \new Voice = "altten" \tenb
          \new Voice = "altbas" \basb
          >>
>>
>>
	\midi { }
	\layout{
            \context {
               \Staff
               \remove "Time_signature_engraver"
               %\remove "Bar_engraver"
               %\override BarLine #'X-extent = #'(-1 . 1)
               \override Beam #'transparent = ##t
               \override Stem #'transparent = ##t
               %\override BarLine #'transparent = ##t
               %\override TupletNumber #'transparent = ##t
             }
            \context {
               \Lyrics
               \consists "Bar_engraver"
             }
	}

}
 

\score {
         \transpose bes g
        <<
	         \new ChoirStaff <<
          \new Staff <<
          \global
          \clef treble
          \new Voice = "lastverse" { \chantamen }
          \new Lyrics \lyricsto "lastverse" \versevii
          \new Voice = "altalto" << \altc >>
          >>
          \new Staff <<
          \global
          \clef bass
          \new Voice = "altten" \tenc
          \new Voice = "altbas" \basc
          >>
>>
>>
	\midi { }
	\layout{
            \context {
               \Staff
               \remove "Time_signature_engraver"
               %\remove "Bar_engraver"
               %\override BarLine #'X-extent = #'(-1 . 1)
               \override Beam #'transparent = ##t
               \override Stem #'transparent = ##t
               %\override BarLine #'transparent = ##t
               %\override TupletNumber #'transparent = ##t
             }
            \context {
               \Lyrics
               \consists "Bar_engraver"
             }
	}

}
 

\markup
{
    \column
    {
	\line{\italic Text: Probably by Rabanus Maurus (776-856)}
%%\line{\italic Music: }
%	\line{\italic Arrangement: Mar. de Jong (?)}
%	%\line{\italic {Words and Music:} }
%	%\line{\italic {Tune Name:} }
%	%\line{\italic {Poetic Meter:} }
	\line{\italic Source: Nova Organi Harmonia VII, page 49}
        \line{\italic {Original Key:} E flat}
 }
}
