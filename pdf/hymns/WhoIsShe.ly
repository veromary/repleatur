\version "2.24.0"

\header {
  title = "Who Is She Ascends So High"
			       
  arranger = \markup { \small { \italic "" \smallCaps "David G Corner, 1585-1648."} }
  poet = \markup { \small { \sans  "ASSUMPTION." \hspace #1 \roman { "(7 7. 7 7.)"} } }
  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note {2} #1 = 54.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
%straddle =  { \once \override Score.SeparationItem.padding = #2
%              \once \override NoteHead.X-offset = #-0.8 
%              \once \override Stem.X-offset = #-0.8 }

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
%merge = \once \override NoteColumn.force-hshift = #-0.01
		            
%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 4/4
  \key g \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c'' {
  bes4 bes a a g g f2 d'4 d c c bes1 
  d4 d c c d d bes2 a4 g g fis g1 \break
}

alto = \relative c' {
  d4 g g f f ees d2 f4 f g f8( ees) d1
  f4 f ees g g fis g2 ees4 ees d d bes1
}

tenor = \relative c' { \clef "treble_8"
  bes4 d d d bes bes bes2 bes4 bes bes a bes1
  bes4 bes c c a d d2 c4 c bes a g1
}

bass = \relative c' { \clef bass
  g4 g d d ees ees bes2 bes8( c) d4 ees f bes,1
  bes'8( a) g4 c, ees d d g2 c,4 c d d g1
}

firstWords = \lyricmode
{
    \override Score.LyricText.font-size = #-0.5
    \override Score.LyricHyphen.minimum-distance = #1
    \override Score.LyricSpace.minimum-distance = #0.8
    % \override Score.LyricText.font-name = #"Gentium"
    % \override Score.LyricText.self-alignment-X = #-1
    \set stanza = "1. "
    %\set vocalName = "Men/Women/Unison/SATB"
Who is she as -- cends so high,
Next the heav'n -- ly King,
Round a -- bout whom an -- gels fly
And her prais -- es sing.
	}

secondWords = \lyricmode
{
	\set stanza = "2. "
Who is she a -- downed with light,
Makes the sun her robe,
At whose feet the queen of night
Lays her chang -- ing globe?
}

thirdWords = \lyricmode
{
	\set stanza = "3. "
This is she in whose pure womb
Hea -- ven's Prince remained;
There -- fore in no earth -- ly tomb
Can she be con -- tained.
}

#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

\book{

%%% Score block	
	
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
	%\context Lyrics = basses \lyricsto basses \firstWords
	%\context Lyrics = bassesTwo \lyricsto basses \secondWords
	%\context Lyrics = bassesThree \lyricsto basses \thirdWords
			        >> 
 >>
\layout {
		indent=0
%		\context { \Score timing = ##f }
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	}

\midi { 
   \tempo 2 = 54
       }	
} %%score bracket

%%% Lyrics titles

\markup { \small { \hspace #77 \italic "John Beaumont (d. 1627)"} }

%%% Lyrics in 3 columns,  column 1 (verses), column 2 (a dividing line), column 3 (verses)

\markup { \hspace #10  %%add space as necc. to center the entire block of lyrics
          \column { %%% super column for entire block of lyrics
	    \line { %% a master line of 3 columns, two for lyrics and one column of a separator line
		\column { %% column 1
		\hspace #1 
			\line { "4. "
			  \column {	     
				  "Heaven she was, which held that fire"
				  "    Whence the world took light"
				  "And to heaven doth now aspire"
				  "    Flames with flames t'unite."
			}}
		}  %% finish Page column 1
			
	\hspace #4 %%adds horizontal space columns 1 and 2   
			   
	\column { \filled-box #'(0.0 . 0.1) #'( -12 . 1) #0 }   %%% Column 2. This is the line dviding the columns 1 and 3. 
			   	   
	\hspace #4 %%adds horizontal space between columns 2 and 3	
	
	\column { %%start page column 3		
 
               \hspace #1 
           		\line {"5. "
			  \column {	     
				  "She that did so clearly shine"
				  "    When our day begun,"
				  "See how bright her beams decline:"
				  "    Now she sits with th'Son."
			}}
	    } %%% end column 3
     } %%% end master-line
   } %%% super column bracket
} %%% lyrics markup bracket

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol.staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne g'1 g1 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo ees1 d1 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "altos" { \override LyricText.font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol.staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree c'1 b1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c1 g'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       }

%%% Amen midi       
\midi { \tempo 2 = 54}   
       
}  

} %%book bracket
