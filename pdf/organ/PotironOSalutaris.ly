\version "2.12"

\header {
        title = \markup "O salutaris Hostia"
	composer = "Henri Potiron"
	poet = ""
	instrument = "organ"
	copyright = \markup { \fill-line { 
	                   \line {File may be freely copied and distributed. } 
	                            \line { \italic brandt.id.au } } }
	tagline = \markup { \fill-line { 
	                       \line { VB 2010 } 
			       \line { \italic brandt.id.au } } }
}

\include "gregorian.ly"

chant = \relative c'{
%  \set Score.timing = ##f
  \clef treble
   \key g \minor
   \stemUp
   \autoBeamOff
   \cadenzaOn
   f8 f[ g] bes[ a g] f[ ees] g[ f] g[ a g] \bar ""
f ees f4 \divisioMaior
\bar ""
   f8 a bes \bar "" c bes[ a] \bar "" g[ f] g bes4 \divisioMaxima
%\bar ""
   r8 \bar "" bes g bes f f[ g] g[ f] ees f4 \divisioMaior
%\bar ""
   ees8 g[ f] g[ bes] bes[ a] g[ f] d ees f4 r8 \bar "||"
   f8 f[ g] bes[ a g] \bar "" f[ ees] g[ f] g[ a g] f ees f4 \divisioMaior
%\bar ""
   f8 a bes c bes[ a] \bar "" g[ f] g bes4 \divisioMaxima
%\bar ""
   r8 \bar "" bes g bes f f[ g] g[ f] ees f4 \divisioMaior
%\bar ""
   ees8 g[ f] g[ bes] bes[ a] g[ f] d ees f4 r8 \bar "||"
   f8[ g f] ees4( f) \bar "||"
}
   
harm = \relative c'{
%  \set Score.timing = ##f
  \clef treble
  \key g \minor
  \stemDown
  \cadenzaOn
r8 d4 ~ d4. c4 d ~ d4. \parenthesize bes4 c4
f8~ f4. d4 ees4. d2~
d4. f4 ees4. d4 r8 d2 f4 d bes c4.
r8 d4 ~ d4. c4 d ~ d4. \parenthesize bes4 c4
f8~ f4. d4 ees4. d2~
d4. f4 ees4. d4 r8 d2 f4 d bes c4.
d4. c2
}

ten = \relative c'{
   \clef bass
   \key g \minor
   \stemUp
   \cadenzaOn
    r8 bes4~ << bes4. g4.~ >> g4 bes ~ bes4. ~ bes4 a4.
    c4 a8 bes4 c4. bes2~ bes4.~ bes4~ bes4.~ bes4.~ bes2~ bes2~ \parenthesize bes4 a4.
    r8 bes4~ << bes4. g4.~ >> g4 bes ~ bes4. ~ bes4 a4.
    c4 a8 bes4 c4. bes2~ bes4.~ bes4~ bes4.~ bes4.~ bes2~ bes2~
\parenthesize bes4 a4.
    bes4.~ bes4 a
}

bass = \relative c'{
   \clef bass
   \key g \minor
   \stemDown
   \cadenzaOn
    r8 bes4 g4.  c,4 bes bes'4. g4 a4. f4. g4~ g4.~ g2~
    g4. d4 ees4. bes4.~ bes2 d4 bes g f4.
    r8 bes'4 g4.  c,4 bes bes'4. g4 a4. f4. g4~ g4.~ g2~
    g4. d4 ees4. bes4.~ bes2 d4 bes g f4.~
    f4.~ f2
}

verba = \lyricmode {
  O sa -- _ lu -- ta -- ris hos -- ti -- a,
  quae cae -- li pan -- dis os -- ti -- um
  bel -- la pre -- munt hos -- ti -- li -- a
  da ro -- bur fer aux -- i -- li -- um.
  U -- ni _ tri -- no -- que Do -- mi -- num,
  sit sem -- pi -- ter -- na glo -- ri -- a
  qui vi -- tam si -- ne ter -- mi -- no
  no -- bis do -- net in pa -- tri -- a.
  A -- men.
  }



\score {
  \new PianoStaff <<
  \new Staff = "RH" <<
     \new Voice = "melody" \chant
     \new Lyrics \with { alignAboveContext = "RH" } \lyricsto melody \verba
     \\
     \harm
     >>
 \new Staff = "LH" <<
     \ten
     \\
     \bass
     >>
 >>
 \layout {
    \context {
      \Staff
      \remove "Time_signature_engraver"
%      \remove "Bar_engraver"
    }
    \context {
      \Score
      \override SpacingSpanner
%            #'base-shortest-duration = #(ly:make-moment 1 4)
             #'packed-spacing = ##f
%      barAlways = ##t
    }
  }				      
 \midi {
     \context {
       \Score
       tempoWholesPerMinute = #(ly:make-moment 72 4)
    }
}
}		       
