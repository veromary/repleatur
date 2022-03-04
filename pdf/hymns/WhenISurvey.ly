%%%% 177.png
%%%% Hymn 107. Caton or Rockingham. "When I survey the wondrous Cross"
%%%% Rev 3

\version "2.10.23"
\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"

	\hspace #0.1 }}	

  title = "107"

  meter = \markup { \small { \column {  \hspace #1
	                                \line { \sans {"CATON"} \sans \smallCaps "or"  \sans {"ROCKINGHAM."} \hspace #1 \roman {"(L. M.)"}}
		                        \line { \italic {Very slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 63.} }
  	}}	
	

 arranger = \markup { \small  { \center-align { \line {\italic "Adapted by" \smallCaps "E. Miller, 1731-1807."}
	 					 \line {  \italic "Harmony chiefly from" \smallCaps "S. Webbe" }
	  					 \line { "(" \hspace #-1 \italic "A Collection of Psalm Tunes, 1820" \hspace #-1 ")." }
  	}}}
	  
tagline =""

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%generates the breathmarks
breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
	\override Score.RehearsalMark #'Y-offset = #'4.0
	\override Score.RehearsalMark #'X-offset = #'-0.5
	\mark \markup {\fontsize #4 ","}
}

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

merge = \once \override NoteColumn #'force-hshift = #-0.01

      
	      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of macro definitions

%%% SATB voices

global = {
  \time 6/4
  \key d \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
	
    \partial 2 d2 | fis(g) e |  d1 fis2 |  a1 b2 | a1 a2 |  d1 cis2 | \break
     b1 a2 | a(g) fis | fis(e) \breathmark \bar "||" e |  a1 b2 | cis1 a2 | \break 
  
  d(fis,)  gis | a1 d,2 | 
  
   g1 fis2 | e1 d2 | d4(e fis2) e2 | d1 \bar "||" 
}

alto = \relative c' {
	
    \partial 2 d2 |  d1 cis2 | \merge d1 d2 | d1 d2 | d4(e fis2) e | d(g2.) fis4 | \break
    fis2(e) fis | cis1 d2 | d(cis) \bar "||" cis4(b) | a2(e') e4(d) | cis(e a g!) fis(e) | \break 
  
 d1 d2 | cis1 d4(cis) | 

 b2.(cis4) d2 | b1 b2 | a(d) cis | \merge d1 \bar "||"
}

tenor = \relative c { \clef "treble_8" 
	
    \partial 2 fis2 | a(b) a4(g) | fis1 a2 | a1 g2 | a(fis4 g) a2 | a(g) a | \break
    b(cis) d |  a1 a2 | a1 \bar "||" e4(d) | cis(e a2) gis | a1 a4(g) | \break 
  
  fis2(b) b | a2.(g4) fis2 | 
  
 g(b) a | g2.(fis4) e2 | fis4(g a2) a4(g) | fis1 \bar "||" 
}

bass = \relative c { \clef bass 
	
    \partial 2 d2 | d(g,) a | d1 d2 | fis1 g2 | fis(d) cis |  b1 a2 | \break
    g(g') fis |  e1 d2 | a1 \bar "||" a2 | a(cis) e | \merge a1 a,2 | \break 
  
  b1 e2 | a,1 b2 | 
  
      << { e1 }  
      \new Voice = "pedals" { \once 
                          \set fontSize = #-3 e,1 } >> 
      fis2 | g1 gis2 |  a1 a2 | d1 \bar "||" 
}      

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

firstWords = \lyricmode
{
    \override Score . LyricText #'font-size = #-0.5
    \override Score . LyricHyphen #'minimum-distance = #1
    \override Score . LyricSpace #'minimum-distance = #0.8
    % \override Score . LyricText #'font-name = #"Gentium"
    % \override Score . LyricText #'self-alignment-X = #-1
    \set stanza = "1. "
    %\set vocalName = "Men/Women/Unison/SATB"
WHEN I sur -- vey the won -- drous Cross, 
On which the Prince of glo -- ry died,  
My rich -- est gain I count but loss,
 And pour con -- tempt on all my pride.
}

secondWords = \lyricmode
{
	\set stanza = "2. "
For -- bid it, Lord, that I should boast
 Save in the death of Christ my God;
All the vain things that charm me most.
I sa -- cri -- fice them to his Blood.
}


thirdWords = \lyricmode
{
\set stanza = "3. "
		See from his head, his hands, his feet.
		Sor -- row and love flow min -- gled down;
		Did e'er such love and sor -- row meet,
		Or thorns com -- pose so rich a crown?
}
	
\book {

%%% Main Score block	

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \global \soprano }
	\context Lyrics = sopranos \lyricsto sopranos \firstWords
	\context Lyrics = sopranosTwo \lyricsto sopranos \secondWords
	\context Lyrics = sopranosThree \lyricsto sopranos \thirdWords
		>>
	\context Staff = subupper <<
	\context Voice = altos    { \global \alto }
	\context Lyrics = altos \lyricsto altos \firstWords
	\context Lyrics = altosTwo \lyricsto altos \secondWords
	\context Lyrics = altosThree \lyricsto altos \thirdWords
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \global \tenor }
	\context Lyrics = tenors \lyricsto tenors \firstWords
	\context Lyrics = tenorsTwo \lyricsto tenors \secondWords
	\context Lyrics = tenorsThree \lyricsto tenors \thirdWords
			>>
	\context Staff = sublower <<
	\context Voice = basses { \global \bass }
	\context Lyrics = basses \lyricsto basses \firstWords
	\context Lyrics = bassesTwo \lyricsto basses \secondWords
	\context Lyrics = bassesThree \lyricsto basses \thirdWords
			        >>
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %% close layout

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2)}} 

} %%% Score bracket

%%% Hymn note markup and lyric titles

\markup { \column{	\hspace #1 } }

\markup { \line {" "} }

\markup { \small { \hspace #70 \italic "I. Watts, 1674-1748."  } } 
                                                                                                    
		                                                                                                     
%%% Main lyric block

\markup { \hspace #30 %%add space as necc. to center the column
          \column { %%% one super column for the entire block of lyrics
	        \hspace #1 
           		\line { "4  "
			  \column {	     
				  "His dying crimson like a robe,"
				  "    Spreads o'er his body on the Tree;"
				  "Then am I dead to all the globe,"
				  "    And all the globe is dead to me."
			}}
    		        \hspace #1 
           		\line {"5. "
			  \column {	     
				  "Were the whole realm of nature mine,"
				  "    That were a present far too small;"
				  "Love so amazing, so divine,"
				  "    Demands my soul, my life, my all."
			}}
	  }
} %%% lyric markup bracket

%%% Amen score block

\score{

  \new ChoirStaff

   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	         \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne d1 d  \bar "||" }}
	         \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo b1 a \bar "||" }}
	                      >>
	         \context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	         \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree g'1 fis \bar "||" }}
	         \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  g1 d' \bar "||" }}
			        >> 

  >>			      

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
      \context { \Score timing = ##f }
	ragged-bottom = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 63 2) }}
}

} %%% book bracket
