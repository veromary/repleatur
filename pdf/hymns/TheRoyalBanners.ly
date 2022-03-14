\version "2.10"

\header {
  title = "The Royal Banners Forward Go"
			       
  arranger = \markup { \small { "Sir Percy Carter Buck."} }
  poet = \markup { \small { \sans  "GONFALON ROYAL." \hspace #1 \roman { "(8 8. 8 8.)"} } }
%  meter = \markup { \small { \italic {Slow} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 54.} }
  tagline = ""
}

%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%% Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work 		 
%straddle =  { \once \override Score.SeparationItem #'padding = #2
%              \once \override NoteHead #'X-offset = #-0.8 
%              \once \override Stem #'X-offset = #-0.8 }

%%% merge. Macro to pull note slightly leftwards.  Used to produce those partially merged wholenotes 
%merge = \once \override NoteColumn #'force-hshift = #-0.01
		            
%%%%%%%%%%%%%%%%%%%%%%%%%% End of Macro definitions	   
	      
%%% SATB voices

global = {
  \time 4/2
  \key g \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' {
\partial 4 d4 | e g c b8( a) b4 g e2( | e4)  e a fis | d g c8( b) a( g) | a2. \bar "||"
\partial 4 a4 | d b g4. g8 | c4 a fis e8( fis) | g( a) b( a) c4 b a e d2 \bar "||"
}

alto = \relative c' {
\partial 4 b4 | b c e d | d2 c4 d | c2. d4 | d2. cis4 d2. \bar "||"
f4 | f2 e e dis4 cis8( dis) | e4 f e d | e c a2 \bar "||"
}

tenor = \relative c { \clef "treble_8"
\partial 4 d4 | e g c b8 a b4 g e2( | e4)  e a fis | d g c8( b) a( g) | a2. \bar "||"
a4 | d b g4. g8 | c4 a fis e8( fis) | g( a) b( a) c4 b a e d2 \bar "||"
}

bass = \relative c { \clef bass
\partial 4 d4 | e g c b8 a b4 g e2( | e4)  e a fis | d g c8( b) a( g) | a2. \bar "||"
a4 | d b g4. g8 | c4 a fis e8( fis) | g( a) b( a) c4 b a e d2 \bar "||"
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
The roy -- al ban -- ners for -- ward go;
The cross shines forth in myst -- ic glow,
Where He in flesh, our flesh Who made,
Our sent -- ence bore, our ran -- som paid:
}

secondWords = \lyricmode
{
\override Score . LyricText #'font-size = #-0.5
    \override Score . LyricHyphen #'minimum-distance = #1
    \override Score . LyricSpace #'minimum-distance = #0.8
    % \override Score . LyricText #'font-name = #"Gentium"
	\set stanza = "2. "
Where deep for us the spear was dyed,
Life's tor -- rent rush -- ing from His side,
To wash us in the pre -- cious flood
Where min -- gled wa -- ter flowed, and blood.
}

thirdWords = \lyricmode
{
	\set stanza = "3. "
Ful -- filled is all that Da -- vid told
In true Pro -- phe -- tic song of old.
A -- midst the na -- tions God, saith he
Hath reigned and tri -- umphed from the tree.
}

fourthWords = \lyricmode
{
\set stanza = "4. "
O Tree of beaut -- y, Tree of light!
	O Tree with roy -- al pur -- ple dight!
	Elect on whose tri -- um -- phal breast
	Those ho -- ly limbs should find their rest.
}

fifthWords = \lyricmode
{
\set stanza = "5. "
On whose dear arms, so wide -- ly flung,
The weight of this world's ran -- som hung,
The price of hu -- man kind to pay
And spoil the Spoil -- er of his prey.
}

sixthWords = \lyricmode
{
\set stanza = "6. "
To Thee, e -- ter -- nal Three in One,
Let hom -- age meet by all be done;
As by the cross Thou dost re -- store,
So guide and keep us ev -- er -- more.
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
	\context Lyrics = sopranosTwo \lyricsto sopranos \thirdWords
	\context Lyrics = sopranosThree \lyricsto sopranos \fifthWords
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
   \context { \Score tempoWholesPerMinute = #(ly:make-moment 54 2) }
       }	
} %%score bracket

%%% Next 3 verses

\score{
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \global \soprano }
	\context Lyrics = sopranos \lyricsto sopranos \secondWords
	\context Lyrics = sopranosTwo \lyricsto sopranos \fourthWords
	\context Lyrics = sopranosThree \lyricsto sopranos \sixthWords
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

} %% Score bracket

\markup { \line {" "} }
\markup { \line {" "} }
\markup { \line {" "} }
\markup { \line {" "} }

%%% Lyrics titles

\markup { \small { \hspace #50 \italic "Venantius Honorius Clementianus Fortunatus (ca. 540-ca. 600)"} }

\markup { \small { \hspace #66 \italic "Translated by John Mason Neale, 1818-66" } }

%%% Amen score block
\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                      << 
	\context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne \partial 4 d4( | e g a2) | g2 \bar "||" }}
	\context Voice = "altos"    { \relative c' {  \clef treble \global \voiceTwo b4 b e8 d c4 a | b2 \bar "||" }}
	                      >>
			      
	\context Lyrics \lyricsto "sopranos" { \override LyricText #'font-size = #-1 A -- men. }
	
	\context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
	                       <<
	\context Voice = "tenors" { \relative c' { \clef bass \global \voiceThree b4 g2. fis4 g2 \bar "||" }}
	\context Voice = "basses" { \relative c' { \clef bass \global \voiceFour  g4 e c8 b a4 d | g,2 \bar "||" }}
			        >> 
  >>			      
\header { breakbefore = ##f piece = " " opus = " " }
\layout { 
	\context { \Score timing = ##f }
	ragged-right = ##t
	indent = 13\cm
	\context { \Staff \remove Time_signature_engraver }

       }

%%% Amen midi       
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 54 2) }}   
       
}  

} %%book bracket
