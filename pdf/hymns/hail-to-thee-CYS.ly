\version "2.24.0"

#(set-global-staff-size 20)

title = "Hail to Thee True Body Sprung"
composer = "CYS"
arranger = "CYS (musica sacra forum)"
poet = "Edward Caswall"
piece = "Ave Verum"

world = {
  \key f \major
  \time 4/4
}

melody = \relative c' {
  \world
f4 a g f bes g a2
g4 f e f g g f2 \break \bar "||"
f4 a g f bes g a2
g4 f e f g g f2 \break \bar "||"
a4 c d c bes g a2
bes4 g a f g g f2 \break \bar "||"
a4 c d c bes g a2
bes4 g a f g g f2 \break \bar "||"
f4 a g f bes g a2
f4 g a bes g g f2
\bar "|."
}


alto = \relative c' {
  \world
c4 f e d d e c2
e4 d cis d8( f) f4 e c2
d4 f e f d e e2
e4 d e d8( f) f4 e c2
c4 f d e d d d( cis)
d d d d d e e( d)
e e d8( e) f4 f e c( f)
f e f f f e c2
f4 f e d d e e2
d4 e c f f e c2
}

tenor = \relative c' {
  \world
a4 c c a d c c2
c4 a a a c c a2
a4 d cis d d d d( cis)
cis d cis a c c a2
f4 f f a a g g8( f e4)
g4 bes bes a bes bes a2
a4 a a a g c c2
d4 c c c c c a2
f4 c' c a d c cis?2
a4 c c bes c c a2
}

bass = \relative c {
  \world
f4 f c d g, c f2
c4 d a d c c f2
d4 d a a g bes a2
a4 a a d c c f2
f4 a, a a a bes a2
g4 g d' d d d d2
c4 a' f f c c f2
bes,4 bes a a c c f2
f4 f c d g, c a2
d4 c f d c c f2
}

verseOne = \lyricmode {
Hail to Thee, True Bo -- dy sprung
of the Vir -- gin Ma -- ry's womb,
same that on the cross was hung,
bore for man the bit -- ter doom:
Thou whose side was pierced and flowed
both with wa -- ter and with blood,
suf -- fer us to taste of Thee
in our life's last a -- go -- ny.
Son of Ma -- ry, Je -- sus blest,
sweet -- est gentl -- est ho -- li -- est!
}



\markup {
  \column {
    \fill-line { \large \bold \title } % title
    \fill-line { \caps \piece               % piece
	         \caps \composer      % composer
	  }
    \fill-line { 7.7.7.7          % meter
	         \arranger           % arranger
	  }
   }
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Voice =
         altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenor >> }
      \context Voice =
        basses { \voiceTwo << \bass >> }
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
      \override LyricSpace.minimum-distance = #0.6
      % **** Makes the text of lyrics a little smaller
      %\override LyricText.font-size = #-1
      % **** Moves lines of lyrics closer together
      \override VerticalAxisGroup.minimum-Y-extent = #'(-1 . 1)
    }
  }
 \midi { }
}



\markup {
  \fill-line {
    " "
    \column {
      \small \caps \poet % poet
    }
  }
}

%{
  Per the _Hymnal 1940 _
  Change log:
  3-24-06 Moved to 2.8, current formatting
%}


