%%% 141png
%%% Hymn 77 Southwell Lord Jesus, think on me.
%%% Version 1

\version "2.24.0"

\header {
  title = "Jesu, grant me this, I pray"
  meter = \markup { \small {\column {  \line { \sans {"Song 13"} \hspace #1 \roman {"(7.7.7.7.)"}}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-column {
		            \line{ \italic "Orlando Gibbons" }
			    \line { \italic "(1583-1625)"  }
  		} } }
  tagline ="Typeset V Brandt 2026"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% macro to specify a partial measure in the middle of a piece.
%%% Manual does not recommend using \partial in the middle of a piece.
%%% In this case, the macro specifies that 2 1/2 notes in a 4/2 measure have past,
%%% hence we are halfway through the measure
halfmeasure =  \set Score.measurePosition = #(ly:make-moment 2/2)

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 

%merge = \once \override NoteColumn.force-hshift = #-0.01

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro Definitions


%%% SATB Voices

global = {
  \time 4/4
  \key ees \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c'' { 
  r4 g2 aes4 bes c f,4. ees8 \time 2/4 g2
\time 4/4 r4 bes2 c4 d ees c c \time 2/4 bes2
\time 4/4 r4 g2 aes4 bes c aes g \time 2/4 f2
\time 4/4 r4 bes2 aes8( g) f4 ees8( f16 g) f4 f \time 2/4 ees2 \bar "||"
}

alto = \relative c' { 
r4 ees2 ees4 d ees ees d ees2
r4 ees2 ees4 d g f8( ees8) c4 d2
r4 ees2 ees8( f) g4 aes f ees d2
r4 ees2 c4 d ees ees d ees2
}

tenor = \relative c' { \clef "treble_8"
r4 bes2 ees,4 f aes f4 bes bes2
r4 g2 g8( a8) bes4 bes bes a bes2
r4 bes2 c4 d4 ees des8( c) bes4 bes2
r4 bes2 ees,4 bes'4 g bes4. aes8 g2
}

bass = \relative c { \clef bass
r4 ees2 c4 bes aes bes bes ees2
r4 ees2 c4 bes ees f f bes,2
r4 ees2 c4 bes aes des ees bes2
r4 g2 aes4 bes ees bes bes ees2
}

firstWords = \lyricmode
{
    %\override Score.LyricText.font-size = #-1
    %\override Score.LyricHyphen.minimum-distance = #1
    %\override Score.LyricSpace.minimum-distance = #0.8
    % \override Score.LyricText.font-name = #"Gentium"
    % \override Score.LyricText.self-alignment-X = #-1
    \set stanza = "1. "
    %\set vocalName = "Men/Women/Unison/SATB"
Je -- su, grant me this, I pray,
Ev -- er in Thy heart to stay;
Let me ev -- er -- more a -- bide
Hid -- den in Thy wound -- ed side.	
}
secondWords = \lyricmode
{
    \set stanza = "2. "
If the world or Sa -- tan lay
Tempt -- ing snares a -- bout my way,
I am safe when I a -- bide
In thy heart and wound -- ed side.
}
thirdWords = \lyricmode
{
\set stanza = "3. " 
If the flesh, more dan -- g'rous still,
Tempt my soul to deeds of ill,
Naught I fear when I a -- bide
In thy heart and wound -- ed side.
}
	
fourthWords = \lyricmode
{
\set stanza = "4. "
   Death will come one day to me;
Je -- su, cast me not from thee:
Dy -- ing let me still a -- bide
In thy heart and wound -- ed side. 
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

\midi { \tempo 2 = 60} 

} %%% Score bracket

%%% Lyrics titles


%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol.staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne aes'1 g1  \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo ees1 ees1 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText.font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol.staff-space = #(magstep -2) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree aes'1 bes1 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  aes1 ees'1 \bar "||" }}
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
\midi { \tempo 2 = 60} 

}


} %%% book bracket
