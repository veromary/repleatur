\version "2.22.1"

\header {
  title = "Immaculate Mary"
  poet = "Lourdes"
  composer = "arr. Renato Calcaterra"
  tagline =""
}


%%% SATB Voices

global = {
  \time 3/4
  \key f \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 1 c4 | f f a f f a g g a8( g) f2 
   c4 | f f a \break f f a g g a8( g) f2
   f4^\markup { \italic like the ringing of bells } bes2 bes4 a2 a4 g4 g g \break c2 a4 bes2 bes4 a2 a4 g g a8( g) f2  \bar "||"
}

alto = \relative c' { 
   c4 c c c c c f e d c c2
   c4 c c c c c f e d c c
   c4 f f g e f f d e e e a8( g) f4 e4~ e d4 d~ d d4 d e d c c2 
}

tenor = \relative c' { \clef "treble_8"
 g4 a f f a f f bes g g a2 
 g4 a f f a f f bes g g a2 
 a4~ a g4 g~ g f4 f g g bes f a a g g g f f f bes bes2 a2 
}

bass = \relative c { \clef bass
 e4 c f f f f c c g' d8( e) f2 
 e4 c f f f f c c g' d8( e) f2.
 d2. c c c c4 g2 d' bes4 c g' d8( e) f2
}

firstSopWords = \lyricmode
{
   \set stanza = "1. "
Im -- ma -- cu -- late Ma -- ry 
Thy prais -- es we sing,
Who reign -- est in splen -- dour with 	
Je -- sus our King.
A -- ve, a -- ve, a -- ve Ma -- ri -- a.
A -- ve, a -- ve, a -- ve Ma -- ri -- a.
}
firstAltWords = \lyricmode
{
   \set stanza = "1. "
Im -- ma -- cu -- late Ma -- ry 
Thy prais -- es we sing,
Who reign -- est in splen -- dour with 	
Je -- sus our King.
A -- ve, a -- ve, a -- ve, a -- ve, a -- ve Ma -- ri -- a.
A -- ve, a -- ve, a -- ve Ma -- ri -- a.
}
firstTenWords = \lyricmode
{
   \set stanza = "1. "
Im -- ma -- cu -- late Ma -- ry 
Thy prais -- es we sing,
Who reign -- est in splen -- dour with 	
Je -- sus our King.
A -- ve, a -- ve, a -- ve Ma -- ri -- a.
A -- ve, a -- ve, a -- ve, a -- ve Ma -- ri -- a.
}
firstBasWords = \lyricmode
{
   \set stanza = "1. "
Im -- ma -- cu -- late Ma -- ry 
Thy prais -- es we sing,
Who reign -- est in splen -- dour with 	
Je -- sus our King.
A -- ve, a -- ve Ma -- ri -- a.
A -- ve, Ma -- ri -- a.
}
secondWords = \lyricmode
{
    \set stanza = "2. "
In hea -- ven the bles -- sed thy glo -- ry pro -- claim
On earth we thy chil -- dren ex -- tol thy sweet name
}
thirdWords = \lyricmode
{
\set stanza = "3. " 
Thy name is our pow -- er thy vir -- tues our light,
Thy love is our com -- fort, thy plead -- ing our might.
}
	
fourthWords = \lyricmode
{
\set stanza = "4. "
We pray for our Mo -- ther the Church u -- pon earth,
And bless, dear -- est La -- dy the land of our birth.
}
	
#(ly:set-option 'point-and-click #f)

\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}


\book {

%%% Score block	
	
\score{
\new ChoirStaff	
<<
	\context Staff = upper << 
	\context Voice = sopranos { \global \soprano }
	\context Lyrics = sopranos \lyricsto sopranos \firstSopWords
%	\context Lyrics = sopranosTwo \lyricsto sopranos \secondWords
			>>
        \context Staff = subupper <<
	\context Voice = altos    { \global \alto }
	\context Lyrics = altos \lyricsto altos \firstAltWords
%	\context Lyrics = altosTwo \lyricsto altos \secondWords
	                      >>
	\context Staff = lower <<
	\context Voice = tenors { \global \tenor }
	\context Lyrics = tenors \lyricsto tenors \firstTenWords
%	\context Lyrics = tenorsTwo \lyricsto tenors \secondWords
        			>>
	\context Staff = sublower <<    
	\context Voice = basses { \global \bass }
	\context Lyrics = basses \lyricsto basses \firstBasWords
%	\context Lyrics = bassesTwo \lyricsto basses \secondWords
			        >>
>>
\layout {
      #(layout-set-staff-size 22)
		indent=0
		\context { \Score \remove "Bar_number_engraver" }
		\context { \Staff \remove "Time_signature_engraver" }
		\context { \Score \remove "Mark_engraver"  }
                \context { \Staff \consists "Mark_engraver"  }
	} %%% close layout

%%% Hymn Midi	

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 60 2)}} 

} %%% Score bracket

%%% Lyrics, in 2 columns with separator line, 3 verses per column

\markup {

\hspace#4
\column{ \line { "2. In heaven the blessed"}
\line { "thy glory proclaim" }
\line { "On earth we, thy children," }
\line { "invoke they fair name." }
}
\hspace#4
\column{ \line { "3. Thy name is our power," }
\line { "thy virtues our light" }
\line { "Thy love is our comfort," }
\line { "thy pleading our might." }
}
\hspace#4
\column{ \line { "4. We pray for our Mother" }
\line { "the Church upon earth" }
\line { "and bless, dearest Lady," }
\line { "the land of our birth." }
}

}

} %%% book bracket
