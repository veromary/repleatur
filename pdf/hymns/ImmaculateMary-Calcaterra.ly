\version "2.24"

\header {
  title = "Immaculate Mary"
  tagline = "CPDL 2024"
  composer = "Renato Calcaterra 2009"
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
  \time 3/4
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
\partial 4  c4 f f a f f a g g a8( bes) f2 
c4 f f a f f a g g a8( bes) f2 
f4 bes2 bes4 a2 a4 g4 g g c2 a4 bes2 bes4 a2 a4 g g a8( g) f2
\bar "||"
}

alto = \relative c' { 
c4 c c c c c f e d c c2
c4 c c c c c f e d c c
c f f g e f f d e e e a8( g) f4 
e4~ e4 d4 d4~ d4 d4 d e d c c2
}

tenor = \relative c' { \clef bass
g4 a f f a f f bes g g a2
g4 a f f a f f bes g g a2
c4~ c g4 g4~ g f4 f g g bes f 
a a g g g f f f bes bes2 a2
}

bass = \relative c { \clef bass
e4 c f f f f c c g' d8( e) f2
e4 c f f f f c c g' d8( e) f2.
d c c c c4 g2 d' bes4 c g' d8( e) f2
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
Im -- ma -- cu -- late Ma -- ry thy praise -- s we sing
who reign -- est in hea -- ven with Je -- sus our King.
A -- ve, a -- ve, a -- ve Ma -- ri -- a
A -- ve, a -- ve, a -- ve Ma -- ri -- a
}
secondWords = \lyricmode
{
    \set stanza = "1. "
Im -- ma -- cu -- late Ma -- ry thy praise -- s we sing
who reign -- est in hea -- ven with Je -- sus our King.
A -- ve, a -- ve, a -- ve Ma -- ri -- a
A -- ve, a -- ve, a -- ve, a -- ve  Ma -- ri -- a
}
thirdWords = \lyricmode
{
\set stanza = "1. " 
Im -- ma -- cu -- late Ma -- ry thy praise -- s we sing
who reign -- est in hea -- ven with Je -- sus our King.
A -- ve, a -- ve Ma -- ri -- a
A -- ve Ma -- ri -- a
}
	
fourthWords = \lyricmode
{
\set stanza = "2. "
In hea -- ven the Bless -- ed thy glo -- ry pro -- claim
On earth we thy child -- ren in -- voke thy fair name.
}
	
fifthWords = \lyricmode
{
\set stanza = "1."
Im -- ma -- cu -- late Ma -- ry thy praise -- s we sing
who reign -- est in hea -- ven with Je -- sus our King.
A -- ve, a -- ve, a -- ve, a -- ve, a -- ve Ma -- ri -- a
A -- ve, a -- ve, a -- ve Ma -- ri -- a
}

sixthWords = \lyricmode
{
\set stanza = "3."
Thy name is our pow -- er, thy vir -- tues our light,
Thy love is our com -- fort, thy plead -- ing our might.
}

seventhWords = \lyricmode
{
\set stanza = "4."
We pray for our moth -- er, the Church up -- on earth,
And bless, dear -- est La -- dy, the land of our birth.
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
	%\context Lyrics = sopranosTwo \lyricsto sopranos \secondWords
	%\context Lyrics = sopranosThree \lyricsto sopranos \thirdWords
	\context Lyrics = sopranosFour \lyricsto sopranos \fourthWords
	\context Lyrics = sopSix \lyricsto sopranos \sixthWords
	\context Lyrics = sopSeven \lyricsto sopranos \seventhWords
			>>
        \context Staff = subupper <<
	\context Voice = altos    { \global \alto }
	\context Lyrics = altos \lyricsto altos \fifthWords
	\context Lyrics = altosFour \lyricsto altos \fourthWords
	\context Lyrics = altosTwo \lyricsto altos \sixthWords
	\context Lyrics = altosThree \lyricsto altos \seventhWords
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \global \tenor }
%	\context Lyrics = tenors \lyricsto tenors \firstWords
	\context Lyrics = tenorsTwo \lyricsto tenors \secondWords
	%\context Lyrics = tenorsThree \lyricsto tenors \thirdWords
	\context Lyrics = tenorsFour \lyricsto tenors \fourthWords
        \context Lyrics = tensSix \lyricsto tenors \sixthWords
	\context Lyrics = tensSeven \lyricsto tenors \seventhWords
			>>
	\context Staff = sublower <<    
	\context Voice = basses { \global \bass }
	%\context Lyrics = basses \lyricsto basses \firstWords
	%\context Lyrics = bassesTwo \lyricsto basses \secondWords
	\context Lyrics = bassesThree \lyricsto basses \thirdWords
	\context Lyrics = bassesFour \lyricsto basses \fourthWords
        \context Lyrics = bassSix \lyricsto basses \sixthWords
	\context Lyrics = bassSeven \lyricsto basses \seventhWords
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 70 4)}} 

} %%% Score bracket

%%% Lyrics titles

} %%% book bracket
