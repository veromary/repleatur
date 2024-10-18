\version "2.12"

\paper {
        #(set-paper-size "a4")
	#(define fonts
	 (make-pango-font-tree "Linux Libertine O"
	 		       "Lucida Sans"
			       "Nimbus Mono"
			       (/ 23 23)))
}

#(set-global-staff-size 23)

\header {
        title = \markup "O salutaris Hostia"
	composer = "Webbe"
%	poet = ""
%	instrument = "organ"
	tagline = \markup { \fill-line { 
	                       \line { VB 2010 } 
			       \line { \italic brandt.id.au } } }
}

global = {
    \key c \major
    \time 4/4
}

sop = \transpose ees c \relative c'' {
       
       \partial 4 bes4 bes aes g f ees c' bes\fermata
       bes ees\> d c\! bes \break bes( a8.) bes16 bes4\fermata
       g g aes bes g f g aes\fermata
       aes \break g\< f bes\! aes g(\> f8.) ees16 ees2\!\fermata
       ees2 ees
       
       }

alto = \transpose ees c \relative c' {
       
       \partial 4 ees4 bes c8( d) ees4 d ees ees ees
       f ees f g g g( ees8.) d16 d4
       ees4 ees d8( c) bes4 ees d ees f
       f4 ees d ees ees ees( d8.) ees16 ees2
       c2 bes2
       
       }
       
tenor = \transpose ees c \relative c' {
       
       \partial 4 g4 g aes bes bes g aes g
       bes4 c bes ees d c( c8.) bes16 bes4
       bes4 bes aes g bes bes bes c
       bes4 bes bes bes c bes( aes8.) g16 g2 aes2 g
       }
       
bass = \transpose ees c \relative c {

       \partial 4 ees4 g f ees bes c aes ees'\fermata
       d4 c d ees g ees( f8.) bes,16 bes4\fermata
       ees4 ees f g ees bes' g f\fermata
       d4 ees bes'8( aes) g4 aes bes( bes,8.) ees16 ees2\fermata
       aes, ees'
       }


verseA = \lyricmode {
  O sa -- lu -- ta -- ris Hos -- ti -- a,
  Quae cae -- li pan -- dis os -- ti -- um:
  Bel -- la pre -- munt hos -- ti -- li -- a,
  Da ro -- bur, fer aux -- i -- li -- um.
  }
verseB = \lyricmode {
  U -- ni tri -- no -- que Do -- mi -- num,
  Sit sem -- pi -- ter -- na glo -- ri -- a!
  Qui vi -- tam si -- ne ter -- mi -- no
  No -- bis do -- net in pa -- tri -- a.
  A -- men.
  }



\score {
  \new ChoirStaff <<
  \new Staff = "RH"
     <<
     \new Voice = "sopranos" {
     \voiceOne
     << \global \sop >>
     }
     \\
     \global \alto
     >>
  \new Lyrics = sopranos \lyricsto sopranos \verseA
  \new Lyrics = sopranos \lyricsto sopranos \verseB
  \new Staff = "LH"
  <<
     \clef bass
     \global \tenor
     \\
     \global \bass
  >>
 >>
 \layout {
    \context {
      \Staff
    }
  }				      
 \midi {
     \context {
       \Score
       tempoWholesPerMinute = #(ly:make-moment 88 4)
    }
}
}		       
