% Version 1.15
% Last edit: April 4, 2006

\version "2.8.0"
\include "english.ly"

#(set-default-paper-size "letter")
#(set-global-staff-size 20)
#(ly:set-option (quote no-point-and-click))

title = "Tantum Ergo"
poet = "St. Thomas Aquinas"
translator = "tr. Edward Caswall"
composer = "John Francis Wade"
meter = "87.87.87"
piece = "St. Thomas"
arranger = ""

world = {
  \key d \major
  \time 4/4
  \autoBeamOff
}

melody = \relative c' {
  \world
  d4 e fs d |
  e fs g fs |
  b a g fs |
  fs e d2 |
  d'4 cs d a |
  b a g fs |
  b cs d cs |
  cs b a2 |
  a4 a fs d |
  e fs g fs | 
  a fs b a |
  g8( fs) e4 d2
  \bar "||"
  < \tweak #'font-size #-1 g d>2
  < \tweak #'font-size #-1 fs d>2 \bar "|."
}

alto = \relative c' {
  \world
  a4 cs d d |
  a d cs d |
  d d d8[ cs] d4 |
  d cs d2 |
  fs4 e d d |
  d d d8[ cs] d4 |
  fs4. e8 d4 e |
  e4. d8 cs2 |
  d4 e d d | 
  cs d d8[ cs] d4 |
  d d d8[ e] d4 |
  d cs a2 |
  b2 a 
}

tenor = \relative c {
  \world
  fs4 a a a |
  a a a a | 
  g a b8[ g] a4 | 
  a4. g8 fs2 |
  a4 g a fs |
  g a a a |
  d cs b a |
  a gs a2 |
  a4 a a a |
  a a g a |
  g a b8[ a] a4 |
  b a8[ g] fs2 |
  g2 fs
}

bass = \relative c {
  \key d \major
  \time 4/4
  d4 a d fs |
  cs d e d |
  g fs e d |
  a a d2 |
  d4 e fs d |
  g fs e d |
  b as b cs8[ d] | 
  e4 e a,2 |
  fs'4 cs d fs |
  g fs e d |
  g fs b,8[ cs] d4 |
  g, a d2 |
  g, d'
}

wordsOne = \lyricmode {
  \override LyricText #'font-shape = #'italic
  \override StanzaNumber #'font-shape = #'italic
  \set stanza = "1. "
  Tan -- tum er -- go sa -- cra -- men -- tum
  Ve -- ne -- re -- mur cer -- nu -- i;
  Et an -- ti -- quum do -- cu -- men -- tum
  No -- vo ce -- dat ri -- tu -- i;
  Præ -- stet fi -- des sup -- ple -- men -- tum
  Sen -- su -- um de -- fec -- tu -- i.
}

wordsTwo = \lyricmode {
  \override LyricText #'font-shape = #'italic
  \override StanzaNumber #'font-shape = #'italic
  \set stanza = "2. "
  Gen -- i -- to -- ri, Gen -- i -- to -- que,
  Laus et ju -- bi -- la -- ti -- o,
  Sa -- lus, ho -- nor, vir -- tus quo -- que
  Sit et be -- ne -- dic -- ti -- o:
  Pro -- ce -- den -- ti ab u -- tro -- que
  Com -- par sit lau -- da -- ti -- o.
  A -- men.
}


\markup {
  \column {
    \fill-line { \large \bold \title } % title
    \fill-line { \caps \piece               % piece
	         \caps \composer      % composer
	  }
    \fill-line { \meter          % meter
	         \arranger           % arranger
	  }
  }
}

\score {
  \context ChoirStaff <<
    \new Staff  <<
      \context Voice = soprano { \voiceOne \melody }
      \context Voice = alto { \voiceTwo \alto }
      \context Lyrics = one \lyricsto soprano \wordsOne
      \context Lyrics = two \lyricsto soprano \wordsTwo
      >>
    \new Staff <<
      \clef bass
      \context Voice = tenor { \voiceThree \tenor }
      \context Voice = bass { \voiceFour \bass }
      >>
    >>
  \layout {
    \context {
      \Score
      % **** Turns off bar numbering
      \remove "Bar_number_engraver"
    }
    \context {
      \Lyrics
      % **** Prevents lyrics from running too close together
      \override LyricSpace #'minimum-distance = #0.6
      % **** Makes the text of lyrics a little smaller
      \override LyricText #'font-size = #-1
      % **** Moves lines of lyrics closer together
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
    }
  }
}

\markup { 
  \normalsize {
    \fill-line {
      \hspace #3.0
      \line {
	\bold "1. "
	\column {
	  "Down in adoration falling,"
	  "Lo! the sacred Host we hail;"
	  "Lo! o'er ancient forms of worship"
	  "Newer rites of grace prevail;"
	  "Faith for all defects supplying,"
	  "Where the feeble senses fail."
	}
      }
      \hspace #3.0
      \line {
	\bold "2. "
	\column {
	  "To the everlasting Father"
	  "And the Son who reigns on high,"
	  "With the Holy Ghost proceeding"
	  "Forth from each eternally,"
	  "Be salvation, honor, blessing,"
	  "Might and endless majesty."
	  "Amen."
	}
      }
      \hspace #3.0
    }
  }
}

\markup {
  \fill-line {
    " "
    \column {
      \small \caps \poet % poet
      \small \caps \translator % translator
    }
  }
}


%{
  Music per _Worship III_, #758.
  Changelog:
  4/4/06 removed point-and-click from the PDF, switched to new formatting
%}
