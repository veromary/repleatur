\header {
	title = "Franconia"
	composer = "Johann B. Koenig (1691-1758), 1738, arr. William Henry Havergal (1793-1870), 1840"
	mutopiatitle = "Franconia (hymntune)"
	mutopiacomposer = "KoenigJB"
	mutopiainstrument = "Voice (SATB)"
	copyright = "Public Domain"
	date = "1738"
	maintainer = "Steve Dunlop"
	maintainerWeb = "http://www.nerstrand.net"
	maintainerEmail = "music@nerstrand.net"
	style = "Hymn"
	source = "www.cyberhymnal.org"
	lastupdated = "2008/1/12"
 footer = "Mutopia-2008/01/13-1244"
 tagline = \markup { \override #'(box-padding . 1.0) \override #'(baseline-skip . 2.7) \box \center-align { \small \line { Sheet music from \with-url #"http://www.MutopiaProject.org" \line { \teeny www. \hspace #-1.0 MutopiaProject \hspace #-1.0 \teeny .org \hspace #0.5 } • \hspace #0.5 \italic Free to download, with the \italic freedom to distribute, modify and perform. } \line { \small \line { Typeset using \with-url #"http://www.LilyPond.org" \line { \teeny www. \hspace #-1.0 LilyPond \hspace #-1.0 \teeny .org } by \maintainer \hspace #-1.0 . \hspace #0.5 Reference: \footer } } \line { \teeny \line { This sheet music has been placed in the public domain by the typesetter, for details see: \hspace #-0.5 \with-url #"http://creativecommons.org/licenses/publicdomain" http://creativecommons.org/licenses/publicdomain } } } }
}
\version "2.12.0"

global = {
    \time 4/4 
    \partial 4  
    \key ees \major 
}

Soprano = { ees'4 f' g' aes' bes' g'2. bes'4 c'' ees'' aes' g' f'2. bes'4 ees'' d'' c'' bes' c'' c'' bes' bes' ees' g' f' f' ees'2. s4  \bar "|." } }
Alto = { bes4 d' ees' ees' d' ees'2. ees'4 ees' ees' d' ees' d'2. f'4 ees' f' g' d' f' f'8 ees' d'4 d' ees' ees' ees' d' bes2. s4  \bar "|." } }
Tenor = { g4 bes bes aes f g2. g4 aes bes aes bes bes2. d'4 bes bes ees' d' c'8 bes a4 bes bes g bes c' bes8 aes g2. s4  \bar "|." } }
Bass = { ees4 bes, ees c bes, ees2. ees4 aes g f ees bes,2. bes4 g bes ees g8 f ees4 f bes, bes, c g, aes, bes, ees2. s4  \bar "|." } }

verseone = \lyricmode {
Re -- mem -- ber those, O Lord,
Who in Your peace have died,
Yet may not gain Love's high re -- ward
'Til love is pu -- ri -- fied. }

versetwo = \lyricmode {
With You they faced Death's night,
Sealed with Your Vic’ -- try Sign;
Soon may the splen -- dour of Your Light
On them for -- ev -- er shine. }

versethree = \lyricmode {
Sweet is their pain, yet deep,
'Til Per -- fect Love is born.
Their long night watch they glad -- ly keep
Be -- fore Your Ra -- diant Morn'.
}

Words = \context Lyrics = "Soprano" <<
        \context Lyrics = "Sop1" {
                \set stanza = "1."
                \verseone
       }
       \context Lyrics = "Sop2" {
              \set stanza = "2."
              \versetwo
       }
       \context Lyrics = "Sop3" {
              \set stanza = "3."
              \versethree
       }
>>

upper = \context Staff = "upper" <<
        \clef "treble"
        \global
        \context Voice = "Sop" {\voiceOne \Soprano}
        \lyricsto Sop \Words
        \context Voice = "Alto" {\voiceTwo \Alto}
>>

lower = \context Staff = "lower" <<
        \clef "bass"
        \global
        \context Voice = "Tenor" {\voiceOne \Tenor}
        \context Voice = "Bass" {\voiceTwo \Bass}
>>


\score {
    \transpose ees c
    \context ChoirStaff <<
            \upper
            \lower
      >>  
\layout {
  \context {
    \Score
  }
  }
}

