\version "2.18.0-1"
\include "english.ly"

\layout { indent = 0.0\cm }

#(set-global-staff-size 16)
#(ly:set-option (quote no-point-and-click))
#(set! paper-alist (cons '("ustrade" . (cons (* 6 in) (* 9 in))) paper-alist))

\paper {
	#(set-paper-size "ustrade") 
}

\header {
   poet = \markup{ \fontsize #4 \smallCaps "Tantum ergo"  }
    meter = \markup { \small { Music: ST. THOMAS, 87.87.87.; \italic "Cantus Diversi," J.F. Wade; principally harm. V. Novello } }
    piece = \markup { \small {Text: \italic "Pange lingua, gloriosi," T. Aquinas }}
    %breakbefore
    %copyright = ""
    tagline = "Adapted VB 2017 for Australian custom"
}

global = {
	\key d \major
	\time 4/4
	%\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
	\global
	d4 e fs d |
	e fs g fs |
	b a g fs |
	fs e d2 | \break
	
	d'4 cs d a |
	b a g fs |
	b cs d cs |
	cs b a2 | \break
	
	a4 a fs d |
	e fs g fs |
	a fs b a |
	g8( fs) e4 d2 \bar "||"
	d2 d \bar "|."
}

alto = \relative c' {
	\global
	a4 cs d d |
	a d cs d |
	d d d8[ cs] d4 |
	d cs d2
	
	fs4 e d d |
	d d cs d |
	fs4. e8 d4 e |
	e4. d8 cs2 |

	d4 e d d |
	cs d d8[ cs] d4 |
	e d d8[ e] d4 |
	d cs d2

	b a
}

tenor = \relative c {
	\global
	fs4 a a a |
	a a a a |
	g a b8[ g] a4 |
	a4. g8 fs2 |
	a4 g fs fs |
	g a a a |
	d cs b a |
	a gs4 a2 |
	
	a4 a a a |
	a a g a |
	a a b8[ a] a4 |
	b a8[ g] fs2 

	g fs
}

bass = \relative c {
	\global
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
	cs fs b,8[ cs] d4 |
	g, a d2

	g, d'
}

verseOne = \lyricmode {
	\set stanza = "1."
	Tan -- tum er -- go Sac -- ra -- mén -- tum
	Ve -- ne -- ré -- mur cér -- nu -- i:
	Et an -- tí -- quum do -- cu -- mén -- tum
	No -- vo ce -- dat rí -- tu -- i:
	Prae -- stet fi -- des sup -- ple -- mén -- tum
	Sén -- su -- um de -- fé -- ctu -- i.
}

verseTwo = \lyricmode {
	\set stanza = "2."
	Ge -- ni -- tó -- ri, Ge -- ni -- tó -- que
	Laus et ju -- bi -- lá -- ti -- o,
	Sa -- lus, ho -- nor, vir -- tus quo -- que
	Sit et be -- ne -- dí -- cti -- o:
	Pro -- ce -- dén -- ti ab u -- tró -- que
	Com -- par sit lau -- dá -- ti -- o.
	A -- men.
}


\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Voice =
         altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
	  \context Lyrics = two \lyricsto sopranos \verseTwo
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenor >> }
      \context Voice =
        basses { \voiceTwo << \bass >> }
    >>
  >>
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 69 2)
            }
       }

	\layout {
\context {
      \Score
      % **** Turns off bar numbering
      \remove "Bar_number_engraver"
    }
	\context {
		\Staff
		\remove "Time_signature_engraver"
		 }
    \context {
      \Lyrics
      % **** Prevents lyrics from running too close together
      \override LyricSpace #'minimum-distance = #0.6
      % **** Makes the text of lyrics a little smaller
      %\override LyricText #'font-size = #-1
      % **** Moves lines of lyrics closer together
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
    }
}
}

