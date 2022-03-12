\version "2.10"

\header {
  title = "God of Mercy and Compassion"
			      subtitle = "Low Key (E minor)" 
  arranger = \markup { \small { \italic "Trad. French /" \smallCaps "Giovanni Battista Pergolesi, 1710-1736."} }
  poet = \markup { \small { \sans  "AU SANG QU'UN DIEU." \hspace #1 \roman { "(87 87. 87 87.)"} } }
  tagline = "typed up by Veronica Brandt 2022 - from an anonymous pdf off the internet"
}

      
%%% SATB voices

global = {
  \time 6/4
  \key g \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c'' {
\partial 2
bes4. c8 d2. d4 ees d d2 c d4 c bes2. d4 c bes bes2( a) 
\bar "|" \break
bes4 a g2 bes d4 d c( bes) a2 bes4 a g2 bes4( a) g fis g1
\bar "||"
}

alto = \relative c' {
f4. f8 f2. f4 f f f2 f fis4 fis g( f e) e f g f1 
fis4 fis g2 d d4 a'4 g2 g fis4 fis g( ees) d( ees) d4 d d1
}

tenor = \relative c' { \clef "treble_8"
bes4. a8 bes2. bes4 c bes bes2 a a4 a bes( d c) bes a g d'2( c)
d4 c bes2 bes a4 a c( d) ees2 d4 c bes4( c) d( c) bes a bes1 
}

verses = \relative c'' { \clef treble
\partial 2
bes4 a g2 bes d4 d c( bes) a2 bes4 a g2 bes4( a) g fis g2. r4
\bar "|" \break
bes4 a g2 bes d4 d c( bes) a2 bes4 a g2 bes4( a) g fis g2. r4
\bar "||"
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
God of mer -- cy and com -- pas -- sion
Look with pi -- ty up -- on me
Fa -- ther, let me call Thee Fa -- ther
'tis Thy child re -- turns to Thee
	}

secondWords = \lyricmode
{
	\set stanza = "2. "
By my sins I have de -- ser -- ved,
Death and end -- less mi -- se -- ry;
Hell with all its pains and tor -- ments
And for all e -- ter -- ni -- ty.

}

thirdWords = \lyricmode
{
	\set stanza = "3. "
By my sins I have ab -- an -- doned
Right and claim to heaven a -- bove,
Where the saints re -- joice for -- ev -- er,
In a bound -- less sea of love.
}

fourthWords = \lyricmode
{
\set stanza = "4. "
See our Sav -- iour, bleed -- ing, dy -- ing,
On the cross of Cal -- va -- ry;
To that cross my sins have nail'd Him,
Yet He bleeds and dies for me.
}

chorusWords = \lyricmode
{
Je -- sus, Lord, I ask for mer -- cy,
Let me not im -- plore in vain,
All my sins I now de -- test them,
Ne -- ver will I sin a -- gain.
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
\transpose bes g
\new ChoirStaff
<<
\context Staff = melody <<
\context Voice = verses { \global \verses }
\context Lyrics = verses \lyricsto verses \firstWords
	\context Lyrics = versesTwo \lyricsto verses \secondWords
	\context Lyrics = versesThree \lyricsto verses \thirdWords
	\context Lyrics = versesFour \lyricsto verses \fourthWords
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


\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 54 2) }}   
}
	
\markup { \hspace #1 
           \line {" "} }

\score{
\transpose bes g
\new ChoirStaff	
 <<

	\context Staff = upper << 
	\context Voice = sopranos { \global \soprano }
	\context Lyrics = sopranos \lyricsto sopranos \chorusWords
			>>
	\context Staff = subupper <<
	\context Voice = altos    { \global \alto }
	\context Lyrics = altos \lyricsto altos \chorusWords
	
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \global \tenor }
	\context Lyrics = tenors \lyricsto tenors \chorusWords
	
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

%%% Lyrics titles

\markup { \small { \hspace #66 \italic "Fr. Edmund Vaughan, C. Ss. R., 1827-1908."} }

} %%book bracket
