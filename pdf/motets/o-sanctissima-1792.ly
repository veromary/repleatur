%lilypond input for Ich hab' dich lieb, mein Wien!


\version "2.18"
#(set-default-paper-size "a4")

\header {
	title = "O sanctissima!"
	composer = "Sizilianisches Volkslied"
	arranger = "1792 transcription"
	meter = "84"
  lastupdated = "3 May 2024"
}

\paper {
  top-margin = 10
  bottom-margin = 10
  left-margin = 20
  ragged-last-bottom = ##f
  ragged-bottom = ##f
}

ScoreSettings = {
 	\set Score.skipBars = ##t
	\override Score.BarNumber  #'break-visibility = #end-of-line-invisible
	\set Score.barNumberVisibility = #(every-nth-bar-number-visible 5)
}

GlobalSettings = \notemode
{	
	\key f \major
	\time 4/4
 	\autoBeamOff
	\revert Rest #'direction
	\revert MultiMeasureRest #'staff-position
}

sopMusic = \relative c'' {
  c2 d | c4. bes8 a4[ bes] |
  c2 d | c4. bes8 a2 | 
  c c | d e4 f | e2 d2 | c1 
  g4.( a8) g4 a | bes4.( c8) bes2 | 
  a4.( bes8) a4 bes | c4.( d8) c2 | 
  f4[e] d[c] | f[d] c bes |
  a2( g2) | f1 
  \bar"|."
}

altoMusic = \relative c'' {
  a2 bes | a4. g8 f4[ g] |
  a2 bes | a4. g8 f2 | 
  a g | b c4 d | c2( b) c1 
  e,4.( f8) e4 f | g4.( a8) g2 | 
  f4.(g8) f4 g | a4.( bes8) a2 | d4[c] bes[a] | d[bes] a g |
  f2( e) f1
  \bar"|."
}

bassMusic = \relative c {
  f2 bes, | f'2 f, 
  f' bes, f' f, 
  f' e d c4 f g2 g, c1
  c c f f, f' bes,2 bes f' c f,1
  \bar"|."
}

VerseI = \lyricmode
{
  \set stanza = "1."
  O san -- ctis -- si -- ma, o pi -- is -- si -- ma dul -- cis vir -- go Ma -- ri _ -- a!
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
	\context Staff = women <<
		\dynamicUp
		\context Voice = sopranos { \voiceOne << \GlobalSettings \sopMusic >> }
		\context Voice = altos { \voiceTwo << \GlobalSettings \altoMusic >> }
		>>
	\context Lyrics = sopranosI \lyricsto sopranos \VerseI
	\context Lyrics = sopranosII \lyricsto sopranos \VerseII
	\context Lyrics = sopranosIII \lyricsto sopranos \VerseIII

	\context Staff = men <<
		\clef bass
		\dynamicDown
		\context Voice = basses { \voiceTwo <<\GlobalSettings \bassMusic >> }
		>>
	>>
\layout {
  indent = 0\mm
    \context {
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
    }
  }


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

