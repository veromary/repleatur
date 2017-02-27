\version "2.18.2"

\include "gregorian.ly"

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
        title = "Sub tuum praesidium - Monastic adjustments"
        poet = "ancient Marian antiphon"
        meter = ""
        composer = "arr G. Nees"
        arranger = "Nova Organi Harmonia (VII)"
        tagline = "Transcribed by V. Brandt, 2017 - http://brandt.id.au - This edition may be edited, copied and distributed."
}

XinO = {
  \once \override NoteHead.stencil = #ly:text-interface::print
  \once \override NoteHead.text = \markup {
   % \combine
    %  \halign #-0.7 \draw-circle #0.85 #0.2 ##f
      \musicglyph #"scripts.prall"
  }
}

global = {
       \key aes \major
}

chant = \relative c' {
%  \set Score.timing = ##f
        \voiceOne
        ees ees g aes bes bes g aes bes( c) c bes \divisioMinima
        bes bes aes f aes aes g \divisioMaior
        ees ees g aes bes aes bes( c) bes \divisioMinima
        c bes aes( g) f g( aes) bes( aes) f g f ees des( ees) ees \divisioMaxima
        f des f aes g f aes( aes) g \divisioMinima
        bes bes aes aes bes( c bes) aes( g) aes( bes aes) \divisioMaior
        f ees f( aes) aes( bes) aes( g) f( ees) \divisioMinima
        f f( \XinO g aes f) g( f) ees ees
        \finalis
        } 	

alt = \relative c' {
       \voiceTwo
       s4 ees~ ees2~ ees1~ ees2.~ ees4~
       ees2~ ees2~ ees2.~
       ees2~ ees1~ ees2.~
       ees2 c2. ees2 f bes,2.~ bes2.~ bes4
       des2. ees2.~ ees2~ ees4~
       ees2~ ees~ ees2.~ ees2 f2.
       c2~ c1~ c2 ees
       c4~ c1~ c2 bes2
       }

ten = \relative c' {
       \voiceThree
       s4 c2.~ c1~ c2.~ c4~ \divisioMinima
       c2~ c~ c2. \divisioMaior
       s2 c2 bes aes g4 \divisioMinima
       aes2~ aes2. bes2~ bes aes2.~ aes2. g4 \divisioMaxima
       aes2.~ aes f2 g4 \divisioMinima
       c2~ c~ c1~ s4 c2.~ \divisioMaior
       c2 bes1 aes2 bes \divisioMinima
       aes4 g2 f aes~ aes4 g \finalis
       }

bass = \relative c' {
       \voiceFour
       s1 bes1 aes2. g4
       f2 aes c2.
       c,2~ c1~ c2.~
       c2 f2. ees2 des~ des2. ees2.~ ees4
       bes2. c ees2~ ees4
       s2 bes'2 aes2. g2 f2.~
       f2~ f1~ f2 ees
       aes,4~ aes1~ aes2 ees'2
       }

verba = \lyricmode {
Sub tu -- um prae -- sí -- di -- um con -- fú -- gi -- mus,
san -- cta De -- i Gé -- ni -- trix:
no -- stras de -- pre -- ca -- ti -- ó -- nes
ne de -- spí -- ci -- as in ne -- ces -- si -- tá -- ti -- bus:
sed a per -- í -- cu -- lis cun -- ctis
lí -- be -- ra nos sem -- per, _
Vir -- go glo -- ri -- ó -- sa
et be -- ne -- dí -- cta.
       }


\score {
        \transpose aes g
        <<
	\new GrandStaff <<
	    \set Score.midiInstrument = "Pipe Organ"
	    %\set Score.midiInstrument = "Choir Aahs"
	\new Staff = "plainchant" <<
          \clef treble
          \global 
          \new Voice = "melody" \chant
	  \new Lyrics \lyricsto "melody" \verba
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
               \hide BarLine
               \override Beam #'transparent = ##t
               \override Stem #'transparent = ##t
             }
            \context {
                \GrandStaff
                \remove "Span_bar_engraver"
            }
            \context {
               \Lyrics
               \consists "Bar_engraver"
             }
             \context {
               \Score
               barAlways = ##t
             }
	}
}

 

\markup
{
    \column
    {
	\line{\italic Text: Really Old}
%%\line{\italic Music: }
%	\line{\italic Arrangement: G. Nees (?)}
%	%\line{\italic {Words and Music:} }
%	%\line{\italic {Tune Name:} }
%	%\line{\italic {Poetic Meter:} }
	\line{\italic Source: Nova Organi Harmonia VII, page 206}
        \line{\italic {Original Key:} A flat}
        \line{\italic {Notes:} Tune adjusted to match the Monastic version}
 }
}
