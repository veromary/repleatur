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
    title = "Help, Lord, the Souls"
    %subtitle = ""
    %subsubtitle = ""
    %poet = \markup{ \italic Text: Dundee}
    % composer = \markup{ \italic Music: }
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
    \key ees \major
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
   Help, Lord, the souls that thou hast made,
the souls to thee so dear,
in pri -- son for the debt un -- paid
of sin com -- mit -- ted here. 
}
sopWordsTwo = \lyricmode
{
    \set stanza = "2. "
These ho -- ly souls, they suf -- fer on,
re -- signed in heart and will,
un -- til thy high be -- hest is done,
and just -- ice has its fill.
}
sopWordsThree = \lyricmode
{
    \set stanza = "3. "
    For dai -- ly falls, for par -- doned crime
they joy to un -- der -- go
the sha -- dow of thy cross sub -- lime,
the rem -- nant of thy woe.
}
sopWordsFour = \lyricmode
{
    \set stanza = "4. "
Oh, by their pa -- tience of de -- lay,
their hope a -- mid their pain,
their sa -- cred zeal to burn a -- way
dis -- fig -- ure -- ment and stain.
}
sopWordsFive = \lyricmode
{
    \set stanza = "5. "
Oh, by their fire of love, not less
in keen -- ness than the flame;
oh, by their ve -- ry help -- less -- ness,
oh, by thy own great name.
}
sopWordsSix = \lyricmode
{
    \set stanza = "6. "
      A -- bel's blood for ven -- geance
        Plead -- ed to the skies;
       But the Blood of Je -- sus
        For our par -- don cries.
}
sopWordsSeven = \lyricmode
{
    \set stanza = "7. "
     Oft as it is sprinkl -- ed
     On our guilt -- y hearts
     Sa -- tan in con -- fu -- sion
     Ter -- ror -- struck de -- parts.
}
sopWordsSeven = \lyricmode
{
    \set stanza = "8. "
}
sopWordsSeven = \lyricmode
{
    \set stanza = "9. "
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
    \transpose ees d
    <<
	\new Staff
	<<
	    %\set Score.midiInstrument = "Orchestral Strings"
	    %\set Score.midiInstrument = "Choir Aahs"
	    \new Voice = "sopranos"
	    \relative c' {
		\voiceOne
		\global
		%\override Score.MetronomeMark #'transparent = ##t
		\override Score.MetronomeMark #'stencil = ##f
		\tempo 4 = 120
\partial 2
ees2 g4 aes bes ees, f g aes2
g2 f4 ees ees d ees2
bes'2 ees4 d c bes bes a bes2
g2 f4 ees ees d ees2
		\bar "|."
	    }

	    \new Voice = "altos"
	    \relative c' {
		\voiceTwo
bes2 ees4 ees bes bes des des ees2
ees2 d4 c c bes bes2
ees2 g4 f ees d c c d2
bes2 c4 g8( aes) bes4 bes bes2
	    }

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
	    \relative c' {
		\voiceThree
		\global
           g2 bes4 c f, g aes bes c2
bes2 bes4 g aes f g2
g2 bes4 bes g f g f f2
g2 aes4 ees f f g2 
	    }

	    \new Voice = "basses"
	    \relative c {
		\voiceFour
ees2 ees4 c d ees des bes aes2
ees'2 bes4 c aes bes ees2
ees2 ees4 bes c d ees f bes,2
ees2 aes,4 c bes bes ees2
	    }
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
	\line{\italic Text: Cardinal Newman}
	\line{\italic Music: Ravenscroft's Psalter}
	%\line{\italic {Words and Music:} }
	\line{\italic {Tune Name:} Dundee}
	%\line{\italic {Poetic Meter:} }
	\line{\italic Source: English Hymnal, no. 428}
        \line{\italic {Original Key:} G}
    }
}
