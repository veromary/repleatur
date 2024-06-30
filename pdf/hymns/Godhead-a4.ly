\version "2.24"

\header {
  title = "Godhead Here in Hiding"
  tagline =""
composer = "Anon"
poet = "Thomas Aquinas, tr. Gerard M. Hopkins"
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
  \time 9/8
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
c8 e g g g( a) g4 \bar "|" \time 4/4 f8 e d c c2 \bar "|"
c8 e g g g( a) g4 \bar "|" f8 e d c c2 \bar "|"
\time 9/8 g'8 g a( b) c c( b) g4 \bar "|" \time 4/4 a8 g f e d2 \bar "|"
e8 g f e d( c) d4 \bar "|" e8 c d c c2 \bar ":|."
}

alto = \relative c' { 
c8 c c c b4 c c8 c b c g2
c8 c c c b4 c c8 c b c g2
e'8 e e4 e8 a4 g f8 f c c b2
c8 c c c a4 a c8 c b c g2
}

tenor = \relative c { \clef bass
e8 g e e f4 g a8 a g f e2
e8 g e e f4 g a8 a g f e2
c'8 c c4 c8 e4 c c8 c a a g2
g8 g f f f4 f g8 g g f e2
}

bass = \relative c { \clef bass
c8 c c c d4 e f,8 f g g c2
c8 c c c d4 e f,8 f g g c2
c8 c b4 b8 a4 e f8 f d d g2
c8 c a a f4 f e8 e g g c2
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
God -- head here in hid -- ing whom I do ad -- ore
Masked by these bare sha -- dows, shape and no -- thing more.
See, Lord, at thy ser -- vice low lies here a heart
Lost, all lost in won -- der at the God thou art.
}
secondWords = \lyricmode
{
    \set stanza = "2. "
\override LyricText #'font-shape = #'italic
See -- ing, touch -- ing, tast -- ing are in thee de -- ceived;
How says tru -- sty hear -- ing? that shall be be -- lieved;
What God's Son has told me, take for truth I do;
Truth him -- self speaks tru -- ly or there's no -- thing true.
}
thirdWords = \lyricmode
{
\set stanza = "3. " 
On the cross thy god -- head made no sign to men;
Here thy ve -- ry man -- hood steals from hu -- man ken:
Both are my con -- fes -- sion, both are my be -- lief,
And I pray the pray -- er of the dy -- ing thief.
}
	
fourthWords = \lyricmode
{
\set stanza = "4. "
\override LyricText #'font-shape = #'italic
I am not like Tho -- mas, wounds I can -- not see,
But can plain -- ly call thee Lord and God as he:
This faith each day deep -- er be my hold -- ing of,
Dai -- ly make me hard -- er hope and dear -- er love.
}
	
fifthWords = \lyricmode
{
\set stanza = "5."
O thou, our re -- mind -- er of the Cru -- ci -- fied,
Liv -- ing Bread, the life of us for whom he died,
Lend this life to me, then; feed and feast my mind,
There be thou the sweet -- ness man was meant to find.
}

sixthWords = \lyricmode
{
\set stanza = "6."
\override LyricText #'font-shape = #'italic
Like what tend -- er tales tell of the Pel -- i -- can,
Bathe me, Je -- su Lord, in what thy bo -- som ran
Blood that of a sin -- gle drop has pow'r to win
All the world for -- give -- ness of its world of sin.
}

seventhWords = \lyricmode
{
\set stanza = "7."
Je -- su whom I look at shroud -- ed here be -- low,
I be -- seech thee, send me what I long for so,
Some day to gaze on thee face to face in light
And be blest for -- ev -- er with thy glo -- ry's sight.
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

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 4)}} 

} %%% Score bracket

%%% Verses 5,6,7

\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \global \soprano }
	\context Lyrics = sopranos \lyricsto sopranos \fifthWords
	\context Lyrics = sopranosTwo \lyricsto sopranos \sixthWords
	\context Lyrics = sopranosThree \lyricsto sopranos \seventhWords
	%\context Lyrics = sopranosFour \lyricsto sopranos \fourthWords
			>>
        \context Staff = subupper <<
	\context Voice = altos    { \global \alto }
	\context Lyrics = altos \lyricsto altos \fifthWords
	\context Lyrics = altosTwo \lyricsto altos \sixthWords
	\context Lyrics = altosThree \lyricsto altos \seventhWords
	%\context Lyrics = altosFour \lyricsto altos \fourthWords
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \global \tenor }
	\context Lyrics = tenors \lyricsto tenors \fifthWords
	\context Lyrics = tenorsTwo \lyricsto tenors \sixthWords
	\context Lyrics = tenorsThree \lyricsto tenors \seventhWords
	%\context Lyrics = tenorsFour \lyricsto tenors \fourthWords
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
}

%%% Lyrics titles

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-1  \override StaffSymbol.staff-space = #(magstep -1) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne c8( d c) b4.( c4) \bar "|." }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo g4. b4. c4 \bar "|." }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText.font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-1  \override StaffSymbol.staff-space = #(magstep -1) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e8 f e d4. e4 \bar "|." }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c4. g4. c4 \bar "|." }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }

\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 12\cm
	\context { \Staff \remove Time_signature_engraver }

       } %%% close layout

%%% Amen Midi
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2) }} 

}


} %%% book bracket
