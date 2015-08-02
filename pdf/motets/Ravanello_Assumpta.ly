\version "2.18.0"
\paper {
 system-count = #5
}
\header {
        composer = "Oreste Ravanello (1697 - 1760)"
	crossRefNumber = "1"
	footnotes = ""
	tagline = "Veronica Brandt 2015"
	title = "Assumpta est Maria"
}
wordsBVA = \lyricmode {
As -- súm -- pta est Ma -- rí -- a in coe -- lum:
gau -- dent An -- ge -- li
lau -- dan -- tes
be -- ne -- dic -- unt
}
wordsBVB = \lyricmode {

}
voiceB =  \relative c' {
\clef treble
\partial 4
c4 c4. c8 c4 \breathe a4
 \bar "||"
}
voiceC =  {
\clef "treble"
a4 a4. a8 a4
}
voiceD =  {
\clef "treble"
f4 f4. f8 f4 
\fermata 
}
voicedefault =  {
\set Score.defaultBarType = ""

 %  Time
 \time 4/4 %  Tempo
 % %staves [(1 2) 3]
 %  Key 
 \key e \minor %  Parentheses mean to tie the notes together

}

\score{
\transpose g a
 \new ChoirStaff
    <<
     \new Staff = "troubles" <<
      \set Staff.midiInstrument = #"choir aahs"
        \new Voice = "sopranos" \with {
midiMinimumVolume = #0.7
midiMaximumVolume = #1.0
} {
            \voiceOne
	    \voicedefault
	    \voiceB 
	}
        \new Voice = "altos"  \with {
midiMinimumVolume = #0.7
midiMaximumVolume = #1.0
}{
            \voiceTwo
	    \voicedefault
	    \voiceC 
	}
      >>
      \new Lyrics = "altos"
      \new Lyrics = "nextverse"
     \new Staff = "bottoms" <<
      \set Staff.midiInstrument = #"choir aahs"
       \new Voice = "deeps"  \with {
midiMinimumVolume = #0.7
midiMaximumVolume = #1.0
}{
	    \voicedefault
\transpose c'' c {
	    \voiceD } 
	}
     >>
  \context Lyrics = "altos" \lyricsto "altos" \wordsBVA
  \context Lyrics = "nextverse" \lyricsto "altos" \wordsBVB
    >>
	\layout {
	}
	\midi {
         \context {
           \Staff
           \remove "Staff_performer"
         }
         \context {
           \Voice
           \consists "Staff_performer"
         }
        \tempo 4 = 80
        }
}
