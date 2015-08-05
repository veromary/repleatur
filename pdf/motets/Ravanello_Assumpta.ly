\version "2.18.0"
\paper {
 system-count = #4
}
\header {
        composer = "Oreste Ravanello (1697 - 1760)"
        opus = "Op. 66 N. 29."
        meter = "Adagio"
	crossRefNumber = "1"
	footnotes = ""
	tagline = "Veronica Brandt 2015"
	title = "Assumpta est Maria"
}
wordsBVA = \lyricmode {
As -- súm -- pta est Ma -- rí -- a in coe -- lum:
gau -- dent An -- ge -- li,
gau -- dent An -- ge -- li,
col -- lau -- dan -- tes
be -- ne -- dic -- unt Dó -- mi -- num.
Al -- le -- lú -- ja.
}
voiceB =  \relative c'' {
\clef treble
\partial 4
c4\(\pp c4. c8 c4\) \breathe a4\( c2 c4\) c f2\( \melisma d \melismaEnd
e\) r2 e4 e g4. g8 e4 \breathe g2 f4
f\( \melisma e8[ d] \melismaEnd e2 f\) r2 c4-^ c-^ d8[( e f d])
e4 \breathe e2 e4 f( d e) f \breathe g4.\( \melisma f8 e4 d 
c d g, a g2. \melismaEnd c8[ bes] a2\) \breathe a4 c
f2( g2~ g4 f2 e4) <f c>1\fermata
 \bar "||"
}
voiceC =  \relative c'' {
\clef "treble"
a4\pp a4. a8 a4 \breathe f g2 a4 g a2( b)
c2 g4 g c4. c8 c4 c( c) bes a4. a8 
g2 g4-^ g-^ a8([ bes c a] d4 c~ c8[ bes a g] f[ g a b])
c4 \breathe c2 bes4 a4( bes2 a4) g \breathe c2 \melisma bes4~
bes8[ a g f] e4 f~ f e8[ d] \melismaEnd e2 f \breathe f4 a
a( d2 c4~ c2 bes~ bes4 a8[ g]) a2\fermata \bar "||"
}
voiceD = \relative c' {
\clef "treble"
f4\(\pp f4. f8 f4\) f4\( f \melisma e \melismaEnd f \) e d2\(( g) 
c,\) r2 c4 c e4. e8 c4 c2 c4 
c4. c8 c4 \breathe c8\f\( c8 f([ g a f] bes4 a~\) a8[ g f e] d2)
c4 \breathe c2 c4 d4 g2 \breathe f4~ ( f8[ e16 d e8 d] c4 d8[ e]
f4 bes, c2~ c2 ) c2 f2 \breathe f4. e8
d2( e4. f16[ g] c2 g4 c,) f1\fermata 
}
voicedefault =  {
 %  Time
 \time 4/4 %  Tempo
\tempo 4=76
 % %staves [(1 2) 3]
 %  Key 
 \key f \major %  Parentheses mean to tie the notes together
    \autoBeamOff
}

\score{
 \new ChoirStaff
    <<
     \new Staff = "troubles" <<
      \set Staff.midiInstrument = #"choir aahs"
        \new Voice = "sops" \with {
midiMinimumVolume = #0.7
midiMaximumVolume = #1.0
} {
	    \voicedefault
	    \voiceB 
	}
>>
\new Lyrics = "sops"
\new Staff = "altos" <<
      \set Staff.midiInstrument = #"choir aahs"
        \new Voice = "altos"  \with {
midiMinimumVolume = #0.7
midiMaximumVolume = #1.0
}{
	    \voicedefault
	    \voiceC 
	}
      >>
      \new Lyrics = "altos"
     \new Staff = "bottoms" <<
      \set Staff.midiInstrument = #"choir aahs"
       \new Voice = "deeps"  \with {
midiMinimumVolume = #0.7
midiMaximumVolume = #1.0
}{
	    \voicedefault
	    \voiceD  
	}
     >>
\new Lyrics = "deeps"
 \context Lyrics = "sops" \lyricsto "sops" \wordsBVA
  \context Lyrics = "altos" \lyricsto "altos" \wordsBVA
\context Lyrics = "deeps" \lyricsto "deeps" \wordsBVA
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
        }
}
