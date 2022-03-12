%%% 141png
%%% Hymn 77 Southwell Lord Jesus, think on me.
%%% Version 1

\version "2.10"

\header {
  title = "Lord Jesus Think On Me"
  meter = \markup { \small {\column {  \line { \sans {"SOUTHWELL."} \hspace #1 \roman {"(S. M.)"}}
                                       \line { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 60.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
		            \line{ \italic "Damon's Psalter, 1579" }
			    \line { \italic "(later form of third line)."  }
  		} } }
  tagline =""
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro to specify a partial measure in the middle of a piece.
%%% Manual does not recommend using \partial in the middle of a piece.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,
%%% hence we are halfway through the measure
halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2 2)

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

%merge = \once \override NoteColumn #'force-hshift = #-0.01

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% SATB Voices

global = {
  \time 4/2
  \key e \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 e1 | g2 g fis fis | e1 \bar "||" e1 | g2 g a a | b1 \bar "||"  b1 |
  d2 d c c | b b a1 ^\fermata \bar "||" \halfmeasure b1 | a2 g fis fis | e1 \bar "||"
}

alto = \relative c' { 
  e1 | e2 e e dis | e1 \bar "||" e1 | e2 g g fis | g1 \bar "||" g1 | 
  g2 fis e d | d d d1 \bar "||" g1 | fis2 e e dis | e1 \bar "||" 
}

tenor = \relative c { \clef "treble_8"
  g'1 | b2 b b b | g1 \bar "||" g1 | b2 b d d | d1 \bar "||" b1 |
  a2 a g a | g g fis1 \bar "||" d'1 | d2 b b b | g1 \bar "||" 
}

bass = \relative c { \clef bass
  e1 | e2 e b b | e1 \bar "||" e1 | e2 e d d | g1 \bar "||" g1 |
  d2 d e fis | g b, d1 _\fermata \bar "||" g,1 | d'2 e b b | e1 \bar "||" 
}

firstWords = \lyricmode
{
    %\override Score . LyricText #'font-size = #-1
    %\override Score . LyricHyphen #'minimum-distance = #1
    %\override Score . LyricSpace #'minimum-distance = #0.8
    % \override Score . LyricText #'font-name = #"Gentium"
    % \override Score . LyricText #'self-alignment-X = #-1
    \set stanza = "1. "
    %\set vocalName = "Men/Women/Unison/SATB"
    Lord Je -- sus, think on me,
And purge a -- way my sin;
From earth -- born pas -- sions set me free,
    And make me pure with -- in.
	
}
secondWords = \lyricmode
{
    \set stanza = "2. "
    Lord Je -- sus, think on me,
    With care and woe op -- prest;
Let me thy lov -- ing ser -- vant be,
   And taste thy pro -- mised rest.

}
thirdWords = \lyricmode
{
\set stanza = "3. " 
    Lord Je -- sus, think on me,
    Nor let me go a -- stray;
Through dark -- ness and per -- plex -- i -- ty
    Point thou the hea -- v'nly way.
}
	
fourthWords = \lyricmode
{
\set stanza = "4. "
    Lord Je -- sus, think on me,
    That, when the flood is past,
I may th'e -- ter -- nal bright -- ness see,
    And share thy joy at last.
}
	
#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}


\book {

%%% Score block	
	
\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \global \soprano }
	\context Lyrics = sopranos \lyricsto sopranos \firstWords
	\context Lyrics = sopranosTwo \lyricsto sopranos \secondWords
	\context Lyrics = sopranosThree \lyricsto sopranos \thirdWords
	\context Lyrics = sopranosFour \lyricsto sopranos \fourthWords
			>>
        \context Staff = subupper <<
	\context Voice = altos    { \global \alto }
	\context Lyrics = altos \lyricsto altos \firstWords
	\context Lyrics = altosTwo \lyricsto altos \secondWords
	\context Lyrics = altosThree \lyricsto altos \thirdWords
	\context Lyrics = altosFour \lyricsto altos \fourthWords
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \global \tenor }
	\context Lyrics = tenors \lyricsto tenors \firstWords
	\context Lyrics = tenorsTwo \lyricsto tenors \secondWords
	\context Lyrics = tenorsThree \lyricsto tenors \thirdWords
	\context Lyrics = tenorsFour \lyricsto tenors \fourthWords
        			>>
	\context Staff = sublower <<    
	\context Voice = basses { \global \bass }
	%\context Lyrics = basses \lyricsto basses \firstWords
	%\context Lyrics = bassesTwo \lyricsto basses \secondWords
	%\context Lyrics = bassesThree \lyricsto basses \thirdWords
	%\context Lyrics = bassesFour \lyricsto basses \fourthWords
			        >>
>>
\layout {
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2)}} 

} %%% Score bracket

%%% Lyrics titles

\markup { \small {  \hspace #60 \italic {"Bp. Synesius, 375-430.  Tr. A. W. Chatfield."} } }  

\markup { \small {\hspace #38 "Μνώεο Χριστέ.  [Mnôeo Christe.]"} }

%%% Lyrics, in 2 columns with separator line, 3 verses per column

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 gis1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a1 e'1 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 15\cm
	\context { \Staff \remove Time_signature_engraver }

       } %%% close layout

%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }} 

}


} %%% book bracket
