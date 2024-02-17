\version "2.24"

\header {
  title = "Adoro Te Devote"
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
  \time 9/8
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
c8 e \parenthesize g g g g( a) g4 \bar "|" \time 4/4 f8 e d c c2 \bar "|"
c8 e g g g( a) g4 \bar "|" f8 e d c c2 \bar "|"
\time 9/8 g'8 g a( b) c c( b) g4 \bar "|" \time 4/4 a8 g f e d2 \bar "|"
e8 g f e d( c) d4 \bar "|" e8 c d c c2 \bar "||"
}

alto = \relative c' { 
c8 c \parenthesize c c c b4 c c8 c b c g2
c8 c c c b4 c c8 c b c g2
e'8 e e4 e8 a4 g f8 f c c b2
c8 c c c a4 a c8 c b c g2
}

tenor = \relative c { \clef bass
e8 g \parenthesize g e e f4 g a8 a g f e2
e8 g e e f4 g a8 a g f e2
c'8 c c4 c8 e4 c c8 c a a g2
g8 g f f f4 f g8 g g f e2
}

bass = \relative c { \clef bass
c8 c \parenthesize c c c d4 e f,8 f g g c2
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
A -- do -- ro te de -- vo -- te la -- tens De -- i -- tas,
quae sub his fi -- gu -- ris ve -- re la -- ti -- tas,
Ti -- bi se cor me -- um to -- tum sub -- ji -- cit,
qui -- a te con -- tem -- plans to -- tum de -- fi -- cit.	
}
secondWords = \lyricmode
{
    \set stanza = "2. "
Vi -- sus  _ tac -- tus gus -- tus in te fal -- li -- tur,
sed au -- di -- tur so -- lo tu -- to cre -- di -- tur
Cre -- do quid quid dix -- it De -- i Fi -- li -- us
nil hoc ver -- bo ve -- ri -- ta -- tis ver -- i -- us.
}
thirdWords = \lyricmode
{
\set stanza = "3. " 
In cru -- _ -- ce la -- te -- bat so -- la De -- i -- tas
at hic la -- tet si -- mul et hu -- man -- i -- tas
Am -- bo ta -- men cre -- dens at -- que con -- fi -- tens
pe -- to quod pe -- ti -- vit la -- tro pae -- ni -- tens.
}
	
fourthWords = \lyricmode
{
\set stanza = "4. "
Pla -- gas _ si -- cut Tho -- mas non in -- tu -- e -- or;
De -- um ta -- men  me -- um te con -- fi -- te -- or;
 fac me ti -- bi sem -- per ma -- gis cre -- de -- re,
in te spem ha -- be -- re, te di -- li -- ge -- re.
}
	
fifthWords = \lyricmode
{
\set stanza = "5."
O me -- _ -- mo -- ri -- a -- le mor -- tis Do -- mi -- ni!
pa -- nis vi -- vus, vi -- tam prae -- stans ho -- mi -- ni!
prae -- sta me -- ae men -- ti de te vi -- ve -- re
et te il -- li sem -- per dul -- ce sa -- pe -- re.
}

sixthWords = \lyricmode
{
\set stanza = "6."
Pi -- e _ pel -- li -- ca -- ne, Je -- su Do -- mi -- ne,
me im -- mun -- dum mun -- da tu -- o san -- gui -- ne;
cu -- jus u -- na stil -- la sal -- vum fa -- ce -- re
to -- tum mun -- dum quit ab om -- ni sce -- le -- re.
}

seventhWords = \lyricmode
{
\set stanza = "7."
Je -- su, _ quem ve -- la -- tum nunc as -- pi -- ci -- o,
o -- ro fi -- at il -- lud quod tam si -- ti -- o;
ut te re -- ve -- la -- ta cer -- nens fa -- ci -- e,
vi -- su sim be -- a -- tus tu -- ae glo -- ri -- ae.
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
	\context Lyrics = altos \lyricsto altos \fifthWords
	\context Lyrics = altosTwo \lyricsto altos \sixthWords
	\context Lyrics = altosThree \lyricsto altos \seventhWords
	%\context Lyrics = altosFour \lyricsto altos \fourthWords
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

%%% Lyrics titles

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-1  \override StaffSymbol.staff-space = #(magstep -1) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne c8( d c) b4.( c4) \bar "||" }}
	\context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo g4. b4. c4 \bar "||" }}
	                      >>
			  
	\context Lyrics \lyricsto "altos" {\override LyricText.font-size = #-1  A -- men. }
	
	\context Staff = lower \with { fontSize = #-1  \override StaffSymbol.staff-space = #(magstep -1) }  
	                       << 
	\context Voice = "tenors" { \relative c { \clef bass \global \voiceThree e8 f e d4. e4 \bar "||" }}
	\context Voice = "basses" { \relative c { \clef bass \global \voiceFour  c4. g4. c4 \bar "||" }}
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
