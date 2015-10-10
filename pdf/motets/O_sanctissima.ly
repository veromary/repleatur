%lilypond input for Ich hab' dich lieb, mein Wien!


\version "2.18"
#(set-default-paper-size "a4")

\header {
	title = "O sanctissima! (O, du fröhliche)"
	composer = "Sizilianisches Volkslied"
	arranger = "Satz: Ludwig v. Beethoven"
	meter = "Andante con moto, ma con pietà"
  enteredby = "Reinhold Kainhofer"
  maintainer = "R. Kainhofer"
  maintainerEmail = "reinhold@kainhofer.com"
  lastupdated = "10 October 2015"
  
  tagline = \markup { \center-align { \small \teeny \line { Modified from \maintainer by V. Brandt with \with-url #"http://www.LilyPond.org" { \teeny www. \hspace #-1.0 LilyPond \hspace #-1.0 \teeny .org}\hspace #-1.0 , \lastupdated\hspace #-1.0 . } } }
}

\paper {
  top-margin = 10
  bottom-margin = 10
  left-margin = 20
  ragged-last-bottom = ##f
  ragged-bottom = ##f
}

\include "deutsch.ly"


ScoreSettings = {
 	\set Score.skipBars = ##t
% 	\override Staff.VerticalAxisGroup #'minimum-Y-extent = #'(-0 . 0)
% 	\set Staff.midiInstrument = "acoustic grand"
% 	\override Lyrics.VerticalAxisGroup #'minimum-Y-extent = #'(-0 . 0)
	% left-align all rehearsal marks
% 	\override Score.RehearsalMark #'self-alignment-X = #-1
% 	\override Score.RehearsalMark #'padding = #2.8
% 	\override Score.RehearsalMark #'font-size = #1
% 	\override Score.RehearsalMark #'font-shape = #'italic
%
	\override Score.BarNumber  #'break-visibility = #end-of-line-invisible
	\set Score.barNumberVisibility = #(every-nth-bar-number-visible 5)
}

GlobalSettings = \notemode
{	
	\key f \major
	\time 2/4
 	\autoBeamOff
	\revert Rest #'direction
	\revert MultiMeasureRest #'staff-position
}

sopMusic = \relative c'' {
  c4 d | c8. b16 a8[ b] |
  c4 d | c8. b16 a4 | c c | d e8 f | e4 \grace e8 \afterGrace d4 {c16[d]} | c2 
  g8.[ a16] g8 a | b8.[ c16] b4 | a8.[ b16] a8 b | c8.[ d16] c4 | f8[e] d[c] | f[d] c b |
  a4( \grace a8 \afterGrace g4 {f16[g16])} | f2 
  \bar"|."
}

altoMusic = \relative c'' {
  a4 b | a8. g16 f8[ g] |
  a4 b | a8. g16 f4 | a g | h c8 d | c4( h) c2 
  e,8.[ f16] e8 f | g8.[ a16] g4 | f8.[g16] f8 g | a8.[ b16] a4 | d8[c] b[a] | d[b] a g |
  f4( e) f2
  \bar"|."
}

bassMusic = \relative c {
  f4 f | f8. f16 f4 |
  f4 f | f8. f16 f4 | f e | d8[ g] c, f | \slurDotted g4~ g4 \slurSolid | c,2
  c4 c8 c | c4 c | c c8 c | c[f] f4 | f f | b, b8 b |
  \slurDotted c4~ c \slurSolid | f2 
  \bar"|."
}

VerseI = \lyricmode
{
  \set stanza = "1."
  O san -- ctis -- si -- ma, o pi -- is -- si -- ma dul -- cis vir -- go Ma -- ri -- _ a!
  Ma -- ter a -- ma -- ta, in -- ter -- me -- ra -- ta! O -- ra! __ O -- ra pro no -- bis!
}

VerseII = \lyricmode
{
  \set stanza = "2."
  To -- ta pul -- chra est, O Ma -- ri -- _ a, Et ma -- cu -- la non est in te.
  Ma -- ter a -- ma -- ta, in -- ter -- me -- ra -- ta! O -- ra! __ O -- ra pro no -- bis!
}

VerseIII = \lyricmode
{
  \set stanza = "3."
  Sic -- ut li -- li -- um in -- ter spi -- _ nas
  Sic Ma -- ria in -- ter fi -- li -- as
  Ma -- ter a -- ma -- ta, in -- ter -- me -- ra -- ta! O -- ra! __ O -- ra pro no -- bis!
}

VerseIV = \lyricmode
{
  \set stanza = "4."
  In mi -- se -- ri -- a, in an -- gu -- sti -- a, 
  O -- ra Vir -- go pro no -- _ bis.
  Pro no -- bis o -- ra, in mor -- tis ho -- ra,
  O -- ra! __ O -- ra pro no -- bis!
}

VerseV = \lyricmode
{
  \set stanza = "5."
  Tu so -- la -- ti -- um et re -- fu -- gi -- um,
  Vir -- go Ma -- ter Ma -- ri -- _ a
  Quid -- quid op -- ta -- mus
  per te spe -- ra -- mus
  O -- ra! __ O -- ra pro no -- bis!
}


\score {

	\context ChoirStaff <<
%		\ScoreSettings
		\context Staff = women <<
			\dynamicUp
			\context Voice = sopranos { \voiceOne << \GlobalSettings \sopMusic >> }
			\context Voice = altos { \voiceTwo << \GlobalSettings \altoMusic >> }
\set Staff.instrumentName = \markup { \column { "S" \line {"A"} } }
		>>
		\context Lyrics = sopranosI \lyricsto sopranos \VerseI
		\context Lyrics = sopranosII \lyricsto sopranos \VerseII
		\context Lyrics = sopranosIII \lyricsto sopranos \VerseIII

		\context Staff = men <<
                        \set Staff.instrumentName = "B"
			\clef bass
			\dynamicDown
			\context Voice = basses { \voiceTwo <<\GlobalSettings \bassMusic >> }
		>>
	>>


}

\score {

	\context ChoirStaff <<
%		\ScoreSettings
		\context Staff = women <<
			\dynamicUp
			\context Voice = sopranos { \voiceOne << \GlobalSettings \sopMusic >> }
			\context Voice = altos { \voiceTwo << \GlobalSettings \altoMusic >> }
		>>
		\context Lyrics = sopranosI \lyricsto sopranos \VerseIV
		\context Lyrics = sopranosII \lyricsto sopranos \VerseV

		\context Staff = men <<
			\clef bass
			\dynamicDown
			\context Voice = basses { \voiceTwo <<\GlobalSettings \bassMusic >> }
		>>
	>>

\layout {
  indent = 0\mm
}

}

