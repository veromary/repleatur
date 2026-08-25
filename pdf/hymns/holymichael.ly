% ŵ (UTF-8 test character: double-u circumflex)
% “ = 0147 (left formatted quote)
% ” = 0148 (right formatted quote)
% — = 0151 (dash)
% – = 0150 (shorter dash)
% © = 0169 (copyright symbol)
% ® = 0174 (registered copyright symbol)
% ⌜ = u231C
% ⌝ = u231D

\version "2.10.33"
#(ly:set-option 'point-and-click #f)

\paper
{
    indent = 0.0
    line-width = 185 \mm
    %between-system-space = 0.1 \mm
    %between-system-padding = #1
    %ragged-bottom = ##t
    %top-margin = 0.1 \mm
    %bottom-margin = 0.1 \mm
    %foot-separation = 0.1 \mm
    %head-separation = 0.1 \mm
    %before-title-space = 0.1 \mm
    %between-title-space = 0.1 \mm
    %after-title-space = 0.1 \mm
    %paper-height = 32 \cm
    %print-page-number = ##t
    %print-first-page-number = ##t
    %ragged-last-bottom
    %horizontal-shift
    %system-count
    %left-margin
    %paper-width
    %printallheaders
    %systemSeparatorMarkup
}

\header
{
    %dedication = ""
    title = "Holy Michael, Great Archangel"
    %subtitle = ""
    %subsubtitle = ""
    % poet = \markup{ \italic text: Anonymous}
    % composer = \markup{ \italic Music: Henry Thomas Smart, 1867}
    %meter = ""
    %opus = ""
    %arranger = ""
    %instrument = ""
    %piece = \markup{\null \null \null \null \null \null \null \null \null \null \null \null \null \italic Slowly \null \null \null \null \null \note #"4" #1.0 = 70-100}
    %breakbefore
    %copyright = ""
    tagline = ""
}


global =
{
    %\override Staff.TimeSignature #'style = #'()
    \time 4/4
    \key bes \major
    \override Rest #'direction = #'0
    \override MultiMeasureRest #'staff-position = #0
}

sopWords = \lyricmode
{
    \override Score . LyricText #'font-size = #-1
    \override Score . LyricHyphen #'minimum-distance = #1
    \override Score . LyricSpace #'minimum-distance = #0.8
    % \override Score . LyricText #'font-name = #"Gentium"
    % \override Score . LyricText #'self-alignment-X = #-1
    \set stanza = "1. "
    %\set vocalName = "Men/Women/Unison/SATB"
Ho -- ly Mi -- chael, great Arch -- an -- gel,
Nerve thine arm and bare thy sword,
Lead us with thy dazz -- ling le -- gions,
In the bat -- tle for the Lord:
Sure de -- fence and trust -- y safe -- guard,
Let thy might -- y strength af -- ford.
}

sopWordsTwo = \lyricmode
{
    \set stanza = "2. "
     Not with flesh and blood we wrest -- le,
Not as man with man con -- tend,
But a -- gainst the powers of dark -- ness,
Who on craft and lies de -- pend:
Treach -- er -- y and shame and vio -- lence,
All the cause of Hell be -- friend.
}
sopWordsThree = \lyricmode
{
    \set stanza = "3. "
 Through God’s three -- fold fair cre -- a -- tion,
Through the earth, the sea, the sky,
Wand -- er Sa -- tan's loath -- ly spi -- rits,
Lur -- ing souls of men to die:
Cast them down, O Prince of An -- gels,
By the power of God most high.
}
sopWordsFour = \lyricmode
{
    \set stanza = "4. "
All who pour -- ing out their life blood,
More than con -- quer in the fight,
All who in th’un -- e -- qual com -- bat,
Fall be -- neath the oppress -- or's might:
Christ the King’s great Stand -- ard -- Bear -- er,
Lead in -- to the Ho -- ly Light!
}
sopWordsFive = \lyricmode
{
    \set stanza = "5. "
Laud and ho -- nour to the Fa -- ther,
Laud and ho -- nour to the Son,
Laud and ho -- nour to the Spi -- rit,
Ev -- er Three, and ev -- er One;
Con -- sub -- stan -- tial, co -- et -- er -- nal,
While un -- end -- ing age -- s run.
}
sopWordsSix = \lyricmode
{
    \set stanza = "6. "
}
sopWordsSeven = \lyricmode
{
    \set stanza = "7. "
}
altoWords = \lyricmode
{

}
tenorWords = \lyricmode
{

}
bassWords = \lyricmode
{

}

\score
{
    <<
	\new Staff
	<<
	    %\set Score.midiInstrument = "Orchestral Strings"
	    %\set Score.midiInstrument = "Choir Aahs"
	    \new Voice = "sopranos"
	    {
		\voiceOne
		\global
		%\override Score.MetronomeMark #'transparent = ##t
		\override Score.MetronomeMark #'stencil = ##f
		\tempo 4 = 120
        f'4 d' bes' f' d''4. c''8 bes'4 f' 
        g' g' f' bes' f' ees' d'2 
        f'4 d' bes' f' d''4. c''8 bes'4 a' 
        bes' a' g' a'8[(  bes']) a'4 g' f'2 
        c''4. c''8 a'4 f' d''4. c''8 bes'4 g' 
        ees'' d'' c'' bes' bes' a' bes'2  \bar "|." 
	    }

	    \new Voice = "altos"
	    {
		\voiceTwo
 d'4 bes f' d' f'4. f'8 f'4 f' bes bes bes bes c' a bes2 d'4 bes f' f'8 ees' d'4. ees'8 d'4 d' d' d' d' d' f' e' f'2 f'4. f'8 f'4 f' f'4. d'8 ees'4 ees' g' f' ees' d'8 ees' f'4 f'8 ees' d'2  \bar "|."        	    }

	    \new Lyrics = sopranos { s1 }
	    \new Lyrics = sopranosTwo { s1 }
	    \new Lyrics = sopranosThree { s1 }
	    \new Lyrics = sopranosFour { s1 }
	    \new Lyrics = sopranosFive { s1 }
	    %\new Lyrics = sopranosSix { s1 }
	    %\new Lyrics = sopranosSeven { s1 }
	    %\new Lyrics = altos { s1 }
	    %\new Lyrics = tenors { s1 }
	    %\new Lyrics = basses { s1 }
	>>


	\new Staff
	<<
	    \clef bass
	    \new Voice = "tenors"
	 {
		\voiceThree
		\global
 bes4 f f bes bes4. a8 bes4 bes g bes f g f f f2 bes4 bes f f bes4. a8 g4 ges g ges d' c'8 bes c'4 bes a2 a4. a8 c'4 a bes4. aes8 g4 bes c' f g8 a bes4 c' c' bes2  \bar "|."          }

	    \new Voice = "basses"
	 {
		\voiceFour 
	        bes,4 bes, d bes, f4. ees8 d4 d 
        ees ees d g, a, f, bes,2 
        bes4 f d d8 c bes,4. c8 d4 d 
        g d bes, g, c c f,2 
        f4. f8 f4 f bes,4. bes,8 ees4 ees 
        c d ees8 f g4 f f, bes,2  \bar "|."    }
	>>
	\context Lyrics = sopranos \lyricsto sopranos \sopWords
	\context Lyrics = sopranosTwo \lyricsto sopranos \sopWordsTwo
	\context Lyrics = sopranosThree \lyricsto sopranos \sopWordsThree
	\context Lyrics = sopranosFour \lyricsto sopranos \sopWordsFour
	\context Lyrics = sopranosFive \lyricsto sopranos \sopWordsFive
	%\context Lyrics = sopranosSix \lyricsto sopranos \sopWordsSix
	%\context Lyrics = sopranosSeven \lyricsto sopranos \sopWordsSeven
	%\context Lyrics = altos \lyricsto altos \altoWords
	%\context Lyrics = tenors \lyricsto tenors \tenorWords
	%\context Lyrics = basses \lyricsto basses \bassWords
    >>
	
    \midi { }
    \layout
    {	
	\context
	{
	    \Lyrics
	    \override VerticalAxisGroup #'minimum-Y-extent = #'(0 . 0)
	}
    }
}

\markup
{
    \column
    {
	\line{\italic Text: Anonymous}
	\line{\italic Music: Henry Thomas Smart (1813-1879), 1867}
	%\line{\italic Arrangement: }
	%\line{\italic {Words and Music:} }
	\line{\italic {Tune Name:} Regent Square}
	\line{\italic {Poetic Meter:} 878787}
	%\line{\italic Source: }
        \line{\italic {Original Key:} B flat}
    }
}
