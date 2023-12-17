\version "2.11.51"
\include "gregorian.ly"

htitle=\markup \italic {"Flos de Radíce (Es ist ein Ros)"}
hcomposer=\markup \smallCaps{ "M. Praetorius"}

ss=\once \set suggestAccidentals = ##t
molle=^\markup{\musicglyph #"accidentals.vaticanaM1"}

incipit =
#(define-music-function (parser location incipit-music) (ly:music?)
#{
\once \override Staff.InstrumentName.self-alignment-X = #RIGHT
\once \override Staff.InstrumentName.self-alignment-Y = ##f
\once \override Staff.InstrumentName.padding = #0.3
\once \override Staff.InstrumentName.stencil =
#(lambda (grob)
(let* ((instrument-name (ly:grob-property grob 'long-text)))
(set! (ly:grob-property grob 'long-text)
#{ \markup
\score
{
{ \context MensuralStaff \with {
instrumentName = #instrument-name
\remove "Time_signature_engraver"
} $incipit-music
}

\layout { $(ly:grob-layout grob)
line-width = \indent
indent =
% primitive-eval is probably easiest for
% escaping lexical closure and evaluating
% everything respective to (current-module).
#(primitive-eval
'(or (false-if-exception (- indent incipit-width))
(* 0.5 indent)))
ragged-right = ##f
ragged-last = ##f
system-count = #1 }
}
#})
(system-start-text::print grob)))
#}) 

global = {
  \override Staff.BarLine #'transparent = ##t
   \set Score.skipBars = ##t
   \override Voice.NoteHead.style = #'baroque
   \key g \dorian
   \time 2/2
   \repeat unfold 16 { \skip 1 \bar "" \skip 1}
  
 
  % the final bar line is not interrupted
  \revert Staff.BarLine #'transparent
%  \bar "|." \stopStaff
}



staffSoprano = 
	
	\relative c'' {
		
	
	\clef treble
	
\override NoteHead #'style = #'baroque


c1 c2 c
d c c1
a bes
a2 g1
f e2
f1 \break
c'1 c2 c
d c c1
a bes
a2 g1
f e2
f1 \break
r2 a g e 
f d c1
r2 c'2 c2 c 
d c c1 \break
a bes
a2 g1
f e2
f\longa






	\bar "|."
	}


staffAlto = 
	
	\relative c'' { 
		
	\clef treble

\override NoteHead #'style = #'baroque


a1 a2 f
f f e1
d d
c2 c d2. a4
c1 c
a'1 a2 f
f f e1
d d
c2 c d2. a4
c1 c
r2 f2 d c
c2 b c4 d e2
r2 e g f
f f e1
d d
f2 d e f
g c, c\longa



	\bar "|."
	}


staffTenor = 
	
	\relative c' { 	
		
	
	\clef "G_8"

\override NoteHead #'style = #'baroque

c1 c2 a
bes a g1
f f
a2 c bes a1
g2 a1
c1 c2 a
bes a g1
f f
a2 c bes a1
g2 a1
r2 c bes a
a g g1
r2 g g a
bes a g1
fis g
c2 bes a1
g1 a\longa

 
	\bar "|."
	}


staffBass = 
	
	\relative c {
		
\clef bass

f1 f2 f
bes f c1
d bes
f'2 e d1
c f,
f'1 f2 f
bes f c1
d bes
f'2 e d1
c f,
r2 f' g a
f g c,1
r2 c e f
bes, f' c1
d g,
a2 bes c1
c1 f,\longa


	
	\clef bass
	
\override NoteHead #'style = #'baroque
	


	\bar "|."
	}
	
	
incipitcantus=\new MensuralVoice = "incipitcantus" <<

{ \relative c'' {

\clef "petrucci-c1"
\key f \major
s2
  }
}
>>

incipitaltus=\new MensuralVoice = "incipitcantusII" <<


{ \relative c' {
\clef "petrucci-c3"
\key  f \major
s2
  }
}
>>

incipittenor=\new MensuralVoice = "incipitaltus" <<


{ \relative c' {
\clef "petrucci-c4"
\key  f \major
s2

  }
}
>>

incipitbassus=\new MensuralVoice = "incipitbassus" <<


{ \relative c {
\clef "petrucci-f"
\key  f \major
s2
  }
}
>>




testoa = \lyricmode {
  
  \set stanza = "1."

Flos de Ra -- dí -- ce Jes -- se
Est na -- tus hó -- di -- e;
Quem no -- bis jam ad -- és -- se,
Lae -- tá -- mur ú -- ni -- ce.
Flos il -- le Je -- sus est,
Ma -- rí -- a vir -- go ra -- dix,
De qua flos or -- tus est.

 }
 
 testoaa = \lyricmode {
  
  \set stanza = "2."
  
Hunc Is -- a -- í -- as flo -- rem
Prae -- sá -- gus cé -- ci -- nit;
Ad e -- jus nos a -- mó -- rem,
Na -- scén -- tes ál -- li -- cit.
Flos vir -- gam sú -- per -- at,
Caé -- li ter -- raé -- que ci -- ves,
Flos Il -- le ré -- cre -- at.

 }
 
 testoaaa = \lyricmode
{
  \set stanza = "3."

Hic su -- o flos o -- dó -- re
Fi -- dé -- lis át -- tra -- hit;
Di -- ví -- no mox a -- mó -- re,
At -- trá -- ctos ím -- bu -- it.
O flos, O grá -- ti -- a!
Ad te, ad te su -- spí -- ro:
De te me sá -- ti -- a.

 }
 
 
 testob = \lyricmode {
   
   \set stanza = "1."
 
Flos de Ra -- dí -- ce Jes -- se
Est na -- tus hó -- di _ -- e;
Quem no -- bis jam ad -- és -- se,
Lae -- tá -- mur ú -- ni _ -- ce.
Flos il -- le Je -- sus est, _ _
Ma -- rí -- a vir -- go ra -- dix,
De qua _ flos _ or -- tus est.

 }
 
  testobb = \lyricmode {
   
   \set stanza = "2."
  
Hunc Is -- a -- í -- as flo -- rem
Prae -- sá -- gus cé -- ci _ -- nit;
Ad e -- jus nos a -- mó -- rem,
Na -- scén -- tes ál -- li _ -- cit.
Flos vir -- gam sú -- per -- at, _ _
Caé -- li ter -- raé -- que ci -- ves,
Flos Il -- _ le _ ré -- cre -- at.

}
 
  testobbb = \lyricmode
{
  \set stanza = "3."

Hic su -- o flos o -- dó -- re
Fi -- dé -- lis át -- tra _ -- hit;
Di -- ví -- no mox a -- mó -- re,
At -- trá -- ctos ím -- bu _ -- it.
O flos, O grá -- ti -- a! _ _
Ad te, ad te su -- spí -- ro:
De te _ me _ sá -- ti -- a.

}
 
 testoc = \lyricmode {
   
   \set stanza = "1."
 
Flos de Ra -- dí -- ce Jes -- se
Est na -- tus hó -- _ di -- e;
Quem no -- bis jam ad -- és -- se,
Lae -- tá -- mur ú -- _ ni -- ce.
Flos il -- le Je -- sus est,
Ma -- rí -- a vir -- go ra -- dix,
De qua flos or -- tus est.

 }
 
  testocc = \lyricmode {
   
   \set stanza = "2."
   
Hunc Is -- a -- í -- as flo -- rem
Prae -- sá -- gus cé -- _ ci -- nit;
Ad e -- jus nos a -- mó -- rem,
Na -- scén -- tes ál -- _ li -- cit.
Flos vir -- gam sú -- per -- at,
Caé -- li ter -- raé -- que ci -- ves,
Flos Il -- le ré -- cre -- at.

 }
 
 
  testoccc = \lyricmode
  
{
  \set stanza = "3."

Hic su -- o flos o -- dó -- re
Fi -- dé -- lis át -- _ tra -- hit;
Di -- ví -- no mox a -- mó -- re,
At -- trá -- ctos ím -- _ bu -- it.
O flos, O grá -- ti -- a!
Ad te, ad te su -- spí -- ro:
De te me sá -- ti -- a.

}



\book {

 \paper{
%	evenHeaderMarkup=\markup  \fill-line { \hcomposer \htitle \fromproperty #'page:page-number-string   }
%	oddHeaderMarkup= \markup  \fill-line { \on-the-fly #not-first-page \fromproperty #'page:page-number-string \on-the-fly #not-first-page \htitle \on-the-fly #not-first-page \hcomposer   }
	
%	system-system-spacing =
%	#'((basic-distance . 10) (minimum-distance . 0) (padding . 3))
	
  }

	
\header {
	title = \markup \smallCaps "Es ist ein Ros entsprungen"
	composer = \markup \center-column { "Anonimo, XVI sec." "arm. Michael Prætorius (1571 -1621)" }
	copyright = \markup \teeny { \vspace #5  "© 2016 by CPDL. Munged by V Brandt c2023. Typesetting originally by Francesco Spiga."}
	poet = \markup \left-column { \line { \smallCaps {M. Praetorius,}\italic {Musæ Sioniæ,} } \line { 6. Theil, 1605, Regensburg } \line { "   " } }
}



\score { 
	<<
	\new StaffGroup = choirStaff 	<<
	  
		  \new Voice = "cantus" <<
		          \global
		           \set Staff.instrumentName =  #"[Cantus]  "
		           \incipit \incipitcantus
		           \staffSoprano
		            >>
		               
		           \new Lyrics \lyricsto "cantus" { \testoa } 
		           \new Lyrics \lyricsto "cantus" { \testoaa } 
		           \new Lyrics \lyricsto "cantus" { \testoaaa } 
		        
		     
		  \new Voice = "cantusII" <<
		          \global
		           \set Staff.instrumentName =  #"[Altus]    "
		           \incipit \incipitaltus
		           \staffAlto
		            >>
		               
		           \new Lyrics \lyricsto "cantusII" { \testob }
		           \new Lyrics \lyricsto "cantusII" { \testobb }
		           \new Lyrics \lyricsto "cantusII" { \testobbb }
		           
		  
		   \new Voice = "altus" <<
		          \global
		           \set Staff.instrumentName =  #"[Tenor]   "
		           \incipit \incipittenor
		           \staffTenor
		            >>
		               
		           \new Lyrics \lyricsto "altus" { \testoc }
		           \new Lyrics \lyricsto "altus" { \testocc }
		           \new Lyrics \lyricsto "altus" { \testoccc }
		          
		
		  \new Voice = "tenor" <<
		          \global
		           \set Staff.instrumentName = #"[Bassus]  "
		           \incipit \incipitbassus
		           \staffBass
		            >>
		               
		           \new Lyrics \lyricsto "tenor" {\testoa }
		           \new Lyrics \lyricsto "tenor" { \testoaa } 
		           \new Lyrics \lyricsto "tenor" { \testoaaa } 
		           
		  
		
	>>
         >>
 
  
  \midi { \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 48 1)
    }
	}
  
  \layout {  indent = 2.5\cm
      %    incipit-width = 1\cm
              ragged-last=##f
    \context {
         \Score
         \remove "Bar_number_engraver"
       }
 \context {
      \Staff
      \consists Custos_engraver
      \override Custos #'style = #'mensural
    }
    \context {
      \Lyrics
      % **** Prevents lyrics from running too close together
      \override LyricSpace #'minimum-distance = #0.6
      % **** Makes the text of lyrics a little smaller
%      \override LyricText #'font-size = #-1
      % **** Moves lines of lyrics closer together
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
    }
  }
}



}

