\version "2.22.1"
\include "gregorian.ly"

htitle=\markup \italic {"Glory be to Jesus"}
hcomposer=\markup \smallCaps{ ""}

ss=\once \set suggestAccidentals = ##t
molle=^\markup{\musicglyph #"accidentals.vaticanaM1"}

incipit =
#(define-music-function (parser location incipit-music) (ly:music?)
#{
\once \override Staff.InstrumentName.self-alignment-X = #RIGHT
\once \override Staff.InstrumentName.self-alignment-Y = ##f
\once \override Staff.InstrumentName.padding = #0.3
\once \override Staff.InstrumentName.stencil =
#(lambda (grob)
(let* ((instrument-name (ly:grob-property grob 'long-text)))
(set! (ly:grob-property grob 'long-text)
#{ \markup
\score
{
{ \context MensuralStaff \with {
instrumentName = #instrument-name
\remove "Time_signature_engraver"
} $incipit-music
}

\layout { $(ly:grob-layout grob)
line-width = \indent
indent =
% primitive-eval is probably easiest for
% escaping lexical closure and evaluating
% everything respective to (current-module).
#(primitive-eval
'(or (false-if-exception (- indent incipit-width))
(* 0.5 indent)))
ragged-right = ##f
ragged-last = ##f
system-count = #1 }
}
#})
(system-start-text::print grob)))
#}) 

global = {
  \override Staff.BarLine #'transparent = ##t
   \set Score.skipBars = ##t
   \override Voice.NoteHead.style = #'baroque
   \key g \major
   \time 4/4
   \repeat unfold 4 { \skip 1 \bar "" \skip 1}
  
 
  % the final bar line is not interrupted
  \revert Staff.BarLine #'transparent
  \bar "|." \stopStaff
}



staffSoprano = 
	
	\relative c'' {
		
	
	\clef treble
	
\override NoteHead #'style = #'baroque

		\tempo 4 = 120
                b4 b a a g2 fis
                g4 g a a b1
                d4 d c c b2 a
                b4 b a a g1
		\bar "|."

	}


staffAlto = 
	
	\relative c'' { 
		
	\clef treble

\override NoteHead #'style = #'baroque
                
g4 g g fis fis( e) dis2
                e4 g g fis g1
                fis4 g e a a( g) fis2
                g4 g g fis g1

	}


staffTenor = 
	
	\relative c' { 	
		
	
	\clef "G_8"

\override NoteHead #'style = #'baroque

d4 d d d b2 b
        b4 b d d d1
        d4 b c d d2 d
        d4 d e d b1

 
	\bar "|."
	}


staffBass = 
	
	\relative c' {
		
\clef bass


	
	\clef bass
	
\override NoteHead #'style = #'baroque
	
    g4 g d d e2 b
                e4 e d d g1
                b4 g a fis g2 d
%                g4 b, c d g,1
                g4 b c d, g1


	\bar "|."
	}
	
	


testoa = \lyricmode {
  
  \set stanza = "1."
    Glo -- ry be to Je -- sus,
      Who in bit -- ter pains
     Pour'd for me the life -- blood
    From His sa -- cred veins!

 }
 
 testoaa = \lyricmode {
  
  \set stanza = "2."
     Grace and life e -- ter -- nal
    In that Blood I find;
    Blest be His com -- pas -- sion,
    In -- fi -- nite -- ly kind!

 }
 
 testoaaa = \lyricmode
{
  \set stanza = "3."
   Blest through end -- less age -- s
     Be the pre -- cious stream,
     Which from end -- less tor -- ment
     Doth the world re -- deem!


 }
 
 
 testob = \lyricmode {
   
   \set stanza = "4."
 
There the faint -- ing spi -- rit
Drinks of life her fill;
There as in a foun -- tain
Laves her -- self at will.

 }
 
  testobb = \lyricmode {
   
   \set stanza = "5."
  A -- bel’s blood for ven -- geance
Plead -- ed to the skies;
But the Blood of Je -- sus
For our par -- don cries.


}
 
  testobbb = \lyricmode
{
  \set stanza = "6."

Oft as it is sprinkl -- ed
On our guil -- ty hearts,
Sa -- tan in con -- fu -- sion
Ter -- ror -- struck de -- parts.

}
 
 testoc = \lyricmode {
   
   \set stanza = "7."
 
Oft as earth exalt -- ing
Wafts its praise on high,
Hell with hor -- ror trem -- bles;
Heav’n is fill’d with joy.

 }
 
  testocc = \lyricmode {
   
   \set stanza = "8."
   Lift ye, then, your voice -- s;
Swell the might -- y flood;
Loud -- er still and loud -- er,
Praise the pre -- cious Blood.

 }
 
 
\book {

 \paper{
	evenHeaderMarkup=\markup  \fill-line { \hcomposer \htitle \fromproperty #'page:page-number-string   }
	oddHeaderMarkup= \markup  \fill-line { \on-the-fly #not-first-page \fromproperty #'page:page-number-string \on-the-fly #not-first-page \htitle \on-the-fly #not-first-page \hcomposer   }
	
	system-system-spacing =
	#'((basic-distance . 10) (minimum-distance . 1) (padding . 5))
	
  }

	
\header {
	title = \markup \smallCaps "Glory Be to Jesus"
	composer = \markup \center-column { "F. Flitz (1874)" "Westminster Hymnal 1912" }
	poet = \markup \left-column { \line { \smallCaps {E. Caswall,} } \line { Viva! Viva! Gesu } \line { "   " } }
}



\score { 
    \transpose g d
	<<
	\new StaffGroup = choirStaff 	<<
	  
		  \new Voice = "cantus" <<
		          \global
		           \set Staff.instrumentName =  #"[Cantus]  "
		           \staffSoprano
		            >>
		               
		           \new Lyrics \lyricsto "cantus" { \testoa } 
		           \new Lyrics \lyricsto "cantus" { \testoaa } 
		           \new Lyrics \lyricsto "cantus" { \testoaaa } 
		        
		     
		  \new Voice = "cantusII" <<
		          \global
		           \set Staff.instrumentName =  #"[Altus]    "
		           \staffAlto
		            >>
		               
		           \new Lyrics \lyricsto "cantusII" { \testoa }
		           \new Lyrics \lyricsto "cantusII" { \testoaa }
		           \new Lyrics \lyricsto "cantusII" { \testoaaa }
		           
		  
		   \new Voice = "altus" <<
		          \global
		           \set Staff.instrumentName =  #"[Tenor]   "
		           \staffTenor
		            >>
		               
		           \new Lyrics \lyricsto "altus" { \testoa }
		           \new Lyrics \lyricsto "altus" { \testoaa }
		           \new Lyrics \lyricsto "altus" { \testoaaa }
		          
		
		  \new Voice = "tenor" <<
		          \global
		           \set Staff.instrumentName = #"[Bassus]  "
		           \staffBass
		            >>
		               
		           \new Lyrics \lyricsto "tenor" {\testoa }
		           \new Lyrics \lyricsto "tenor" { \testoaa } 
		           \new Lyrics \lyricsto "tenor" { \testoaaa } 
		           
		  
		
	>>
         >>
 
  
  \midi { \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 48 1)
    }
	}
  
  \layout {  indent = 2.5\cm
              incipit-width = 1\cm
              ragged-last=##f

	
	
 
  	  
  	  \context {
         \Score
         \remove "Bar_number_engraver"
         
       }
 \context {
      \Staff
      \consists Custos_engraver
      \override Custos #'style = #'mensural
    
    }
    \context {
      \Lyrics
      % **** Prevents lyrics from running too close together
      \override LyricSpace #'minimum-distance = #0.6
      % **** Makes the text of lyrics a little smaller
      \override LyricText #'font-size = #-1
      % **** Moves lines of lyrics closer together
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
    }
  }
}

\markup { 
\fill-line {
\column {

\hspace #0.8 % adds vertical spacing between verses
\line { \bold "4. "
\column {
 
"There the fainting spirit"
"Drinks of life her fill;"
"There as in a fountain"
"Laves herself at will."

}
}

\hspace #0.8 % adds vertical spacing between verses
\line { \bold "5. "
\column {
 
"Abel’s blood for vengeance"
"Pleaded to the skies;"
"But the Blood of Jesus"
"For our pardon cries."

}
}

\hspace #0.8 % adds vertical spacing between verses
\line { \bold "6. "
\column {
 

"Oft as it is sprinkled"
"On our guilty hearts,"
"Satan in confusion"
"Terror-struck departs."

}
}


\hspace #0.8 % adds vertical spacing between verses
\line { \bold "7. "
\column {
 
"Oft as earth exalting"
"Wafts its praise on high,"
"Hell with horror trembles;"
"Heav’n is fill’d with joy."
 
}
}


\hspace #0.8 % adds vertical spacing between verses
\line { \bold "8. "
\column {
 
"Lift ye, then, your voices;"
"Swell the mighty flood;"
"Louder still and louder,"
"Praise the precious Blood."
 
}
}

}
}
}

}

