\version "2.24.0"
\include "gregorian.ly"

htitle=\markup \italic {"I Know a Flower"}
hcomposer=\markup \smallCaps{ "M. Praetorius"}

ss=\once \set suggestAccidentals = ##t
molle=^\markup{\musicglyph "accidentals.vaticanaM1"}

global = {
  \override Staff.BarLine.transparent = ##t
   \set Score.skipBars = ##t
   \override Voice.NoteHead.style = #'baroque
   \key g \dorian
   \time 2/2
   \repeat unfold 16 { \skip 1 \bar "" \skip 1}
  
% the final bar line is not interrupted
  \revert Staff.BarLine.transparent
%  \bar "|." \stopStaff
}



staffSoprano = 
	
	\relative c'' {
		
	
	\clef treble
	
\override NoteHead.style = #'baroque


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
d c c1
a bes
a2 g1
f e2
f\longa






	\bar "|."
	}


staffAlto = 
	
	\relative c'' { 
		
	\clef treble

\override NoteHead.style = #'baroque


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

\override NoteHead.style = #'baroque

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
	
\override NoteHead.style = #'baroque
	


	\bar "|."
	}
	
	


testoa = \lyricmode {
  
  \set stanza = "1."
  I know a flow'r it spring -- eth
  From earth a ten -- der shoot:
  As old -- en pro -- phet sing -- eth,
  From Jes -- se came the root
  That bore a blos -- som bright
  In depth of chil -- ly win -- ter
  A -- bout the dead of night.

 }
 
 testoaa = \lyricmode {
  
  \set stanza = "2."
  This plant with blos -- som la -- den
  As spake E -- sai of yore,
  Is Ma -- ry, spot -- less mai -- den,
  For us this flow' -- ret bore;
  By God's e -- ter -- nal will,
  A seem -- ly Babe she child -- eth,
  Yet maid re -- main -- eth still.
 

 }
 
 testoaaa = \lyricmode
{
  \set stanza = "3."
  Praise, ho -- nour to the Fa -- ther,
  The Son, the Spi -- rit blest;
  And Ma -- ry, God's own Mo -- ther,
  For help we make re -- quest:
  Be -- seech thy dear -- est Son
  That He would be our Re -- fuge
  And shrive us, ev -- ry -- one.

 }
 
 
 testob = \lyricmode {
   
   \set stanza = "1."
  I know a flow'r it spring -- eth
  From earth a ten -- der _ shoot:
  As old -- en pro -- phet sing -- eth,
  From Jes -- se came the _ root
  That bore a blos -- som bright _ _
  In depth of chil -- ly win -- ter
  A -- bout the _ dead _ of night.

 
 }
 
  testobb = \lyricmode {
   
   \set stanza = "2."
  This plant with blos -- som la -- den
  As spake E -- sai of yore,
  Is Ma -- ry, spot -- less mai -- den,
  For us this flow' -- ret bore;
  By God's e -- ter -- nal will,
  A seem -- ly Babe she child -- eth,
  Yet maid re -- main -- eth still.
   
 }
 
  testobbb = \lyricmode
{
  \set stanza = "3."
  Praise, ho -- nour to the Fa -- ther,
  The Son, the Spi -- rit blest;
  And Ma -- ry, God's own Mo -- ther,
  For help we make re -- quest:-
  Be -- seech thy dear -- est Son
  That He would be our Re -- fuge
  And shrive us, ev -- ry -- one.


}
 
 testoc = \lyricmode {
   
   \set stanza = "1."
   I know a flow'r it spring -- eth
  From earth a ten -- der shoot:
  As old -- en pro -- phet sing -- eth,
  From Jes -- se came the root
  That bore a blos -- som bright
  In depth of chil -- ly win -- ter
  A -- bout the dead of night.
 
 }
 
  testocc = \lyricmode {
   
   \set stanza = "2."
  This plant with blos -- som la -- den
  As spake E -- sai of yore,
  Is Ma -- ry, spot -- less mai -- den,
  For us this flow' -- ret bore;
  By God's e -- ter -- nal will,
  A seem -- ly Babe she child -- eth,
  Yet maid re -- main -- eth still.
  

 }
 
 
  testoccc = \lyricmode
  
{
  \set stanza = "3."
  Praise, ho -- nour to the Fa -- ther,
  The Son, the Spi -- rit blest;
  And Ma -- ry, God's own Mo -- ther,
  For help we make re -- quest:
  Be -- seech thy dear -- est Son
  That He would be our Re -- fuge
  And shrive us, ev -- ry -- one.

}



\book {

 \paper{
%	evenHeaderMarkup=\markup  \fill-line { \hcomposer \htitle \fromproperty #'page:page-number-string   }
%	oddHeaderMarkup= \markup  \fill-line { \unless \on-first-page \fromproperty #'page:page-number-string \unless \on-first-page \htitle \unless \on-first-page \hcomposer   }
	
%	system-system-spacing =
%	#'((basic-distance . 10) (minimum-distance . 0) (padding . 3))
	
  }

	
\header {
	title = \markup \smallCaps "Es ist ein Ros entsprungen"
	composer = \markup \center-column { "Anonimo, XVI sec." "arm. Michael Prætorius (1571 -1621)" }
	copyright = \markup \teeny { \vspace #5  "© 2016 by CPDL. Typesetting by Francesco Spiga. Munged by V Brandt c2023"}
	poet = \markup \left-column { \line { \smallCaps {M. Praetorius,}\italic {Musæ Sioniæ,} } \line { 6. Theil, 1605, Regensburg } \line { "   " } }
}



\score { 
	<<
	\new StaffGroup = choirStaff 	<<
	  
		  \new Voice = "cantus" <<
		          \global
		           \set Staff.instrumentName =  #"[Cantus]  "
		           \staffSoprano
		            >>
		               
		           \new Lyrics \lyricsto "cantus" { \testoa } 
		           \new Lyrics \lyricsto "cantus" { \testoaa } 
		           \new Lyrics \lyricsto "cantus" { \testoaaa } 
		        
		     
		  \new Voice = "cantusII" <<
		          \global
		           \set Staff.instrumentName =  #"[Altus]    "
		           \staffAlto
		            >>
		               
		           \new Lyrics \lyricsto "cantusII" { \testob }
		           \new Lyrics \lyricsto "cantusII" { \testobb }
		           \new Lyrics \lyricsto "cantusII" { \testobbb }
		           
		  
		   \new Voice = "altus" <<
		          \global
		           \set Staff.instrumentName =  #"[Tenor]   "
		           \staffTenor
		            >>
		               
		           \new Lyrics \lyricsto "altus" { \testoc }
		           \new Lyrics \lyricsto "altus" { \testocc }
		           \new Lyrics \lyricsto "altus" { \testoccc }
		          
		
		  \new Voice = "tenor" <<
		          \global
		           \set Staff.instrumentName = #"[Bassus]  "
		           \staffBass
		            >>
		               
		           \new Lyrics \lyricsto "tenor" {\testoa }
		           \new Lyrics \lyricsto "tenor" { \testoaa } 
		           \new Lyrics \lyricsto "tenor" { \testoaaa } 
		           
		  
		
	>>
         >>
 
  
  \midi { \tempo 1 = 48
	}
  
  \layout { % indent = 2.5\cm
            %  incipit-width = 1\cm
              ragged-last=##f

	
	
 
  	  
  	  \context {
         \Score
         \remove "Bar_number_engraver"
         
       }
 \context {
      \Staff
      \consists Custos_engraver
      \override Custos.style = #'mensural
    
    }
    \context {
      \Lyrics
      % **** Prevents lyrics from running too close together
      \override LyricSpace.minimum-distance = #0.6
      % **** Makes the text of lyrics a little smaller
%      \override LyricText.font-size = #-1
      % **** Moves lines of lyrics closer together
      \override VerticalAxisGroup.minimum-Y-extent = #'(-1 . 1)
    }
  }
}



}
