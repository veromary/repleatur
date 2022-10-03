\version "2.22.1"
\paper {
 system-count = #3
}
\header {
        composer = "Oreste Ravanello (1697 - 1760)"
	footnotes = ""
	tagline = "Transcribed by Luke's Dad"
	title = "O Salutaris"
}
wordsBVA = \lyricmode {
O sa -- lu -- ta -- ris Hos -- ti -- a,
quae cae -- li pan -- dis os -- ti -- um,
bel -- la pre -- munt hos -- ti -- li -- a,
da ro -- bur fer au -- xi -- li -- um.
}
wordsVerse = \lyricmode {
U -- ni tri -- no -- que Do -- mi -- no,
sit sem -- pi -- ter -- na glo -- ri -- a,
qui vi -- tam si -- ne ter -- mi -- no,
no -- bis do -- net in pa -- tri -- a.
A -- men. A -- men.
}
voiceB =  \relative c' {
\clef treble
d2 e4 fis a2 g4( fis) e2 g fis1
a2 b4 cis d2 cis b b cis1
cis2 cis4 e d2. a4 b2 cis d1
d2 cis4 b a2 b e, a4( g) fis1
 \bar ":|."
}
amenB = \relative c'' {
r1 r1 a2( b4 cis d2 b) a1~ a1
\bar "||"
}
voiceC =  \relative c' {
\clef "treble"
d2 e4 fis a2 g4( fis) e2 g fis1
fis2 fis4 fis fis4( gis) a2 a gis a1
a2 a4 a a( g) fis2 g2 g fis1
fis2 fis4 g fis2 e d cis d1
 \bar ":|."
}
amenC = \relative c' {
d2( e4 fis a2 g) fis1 g( g2 fis4 e) fis1
\bar "||"
}
voiceD = \relative c' {
\clef "treble"
d2 e4 fis a2 g4( fis) e2 g fis1
d2 d4 cis b2 cis4( d) e2 e a,1
a'2 a4 g fis( e) d2 g e b1
d2 a4 g d'2 g,2 a a d1
\bar ":|."
}
amenD = \relative c' {
r1 a2( b4 cis d2. cis4 b2 g) d'1~ d1
\bar "||"
}
voicedefault =  {
 %  Time
 \time 4/4 %  Tempo
%\tempo 4=76
 % %staves [(1 2) 3]
 %  Key 
 \key d \major %  Parentheses mean to tie the notes together
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
            \amenB
	}
>>
\new Lyrics = "sops" \lyricsto "sops" \wordsBVA
\new Lyrics = "sopsTwo" \lyricsto "sops" \wordsVerse
\new Staff = "altos" <<
      \set Staff.midiInstrument = #"choir aahs"
        \new Voice = "altoVoice"  \with {
midiMinimumVolume = #0.7
midiMaximumVolume = #1.0
}{
	    \voicedefault
	    \voiceC  
            \amenC

	}
      >>
      \new Lyrics = "altos" \lyricsto "altoVoice" \wordsBVA
      \new Lyrics = "altosTwo" \lyricsto "altoVoice" \wordsVerse
     \new Staff = "bottoms" <<
      \set Staff.midiInstrument = #"choir aahs"
       \new Voice = "deeps"  \with {
midiMinimumVolume = #0.7
midiMaximumVolume = #1.0
}{
	    \voicedefault
	    \voiceD   
            \amenD
\addlyrics { A -- men. }

	}
     >>
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
