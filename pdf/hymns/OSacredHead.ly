%%%% 170.png
%%%% Hymn 102. Passion Chorale. "O sacred head, sore wounded"
%%%% Rev 1.

\version "2.10"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - PASSIONTIDE"

        \hspace #0.1 }} 

  title = "102"

  meter = \markup { \small {\column {  \line { \sans {"PASSION CHORALE. "} \hspace #1 \roman {"(7 6. 7 6. D.)" }}
                                       \line { \italic {Very slow and solemn} \fontsize #-5 \general-align #Y #DOWN \note #"2" #1 = 42.}
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
                            \line { \italic "Melody by " \smallCaps "H. L. Hassler, 1564-1612." }
                            \line { \italic "Adapted and harmonized by" \smallCaps "J. S. Bach." }
                } } }

  tagline =""

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% prints a repeat sign glyph comprising 4 dots. Used only to begin a repeat at the start of a piece where \bar ":" does not work      

fdstartrepeat =  {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                  \once \override Staff.BarLine #'text = \markup  { \line { \hspace #0 \override #'(baseline-skip . 1.0) 
                                                                    \raise #1.4 \column { \with-color #black { 
                                                                    \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                  } }   
                 \bar "|:"}
                 

%%% prints a repeat sign glyph comprising 4 dots and two thin bars

fdendrepeat = {\once \override Staff.BarLine #'stencil = #ly:text-interface::print 
                \once \override Staff.BarLine #'text = \markup  {  \line { \raise #1.4 \override #'(baseline-skip . 1.0)  \column { \with-color #black {  \fontsize #2 . \fontsize #2 . \fontsize #2 . \fontsize #2 .} }
                                                                   \hspace #-1 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
                                                                   \hspace #-0.9 \filled-box #'(0 . 0.15) #'(-2 . 2) #0
        } }     
        \bar "||"} 

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
        \override Score.RehearsalMark #'Y-offset = #'4.0
        \override Score.RehearsalMark #'X-offset = #'-0.5
        \mark \markup {\fontsize #4 ","}
}

%%% a quick macro to shorten a stem

shortenStem = \once \override Stem #'length = #4.5

%%% Push notecolumn a little to the right

push = { \once \override NoteColumn #'force-hshift = #0.4 }
              
%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

%%% SATB voices

global = {
  \time 8/4
  \key c \major
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
  \partial 2 e2 \bar "|" a g f e \bar "|" \once \override NoteColumn #'force-hshift = #2 d1 e2^\fermata \breathmark \bar "||" 
      b' \bar "|" c c b4(a) b2 \bar "|" a1.^\fermata \break 
    e2 \bar "|" a g f e \bar "|" \once \override NoteColumn #'force-hshift = #2 d1 e2^\fermata \breathmark \bar "||" 
      b' \bar "|" c c b4(a) b2 \bar "|" a1.^\fermata \break 
  
  c2 \bar "|" b4(a) g2 a b \bar "|" \push c1 c2^\fermata \breathmark \bar "||" 
      g \bar "|" a g f f \bar "|" e1.^\fermata \bar "||" \break
  
  c'2 \bar "|" b4(c) d2 c b \bar "|" \push a1 b2^\fermata \breathmark \bar "||" 
      e, \bar "|" f e d g \bar "|" e1.^\fermata \bar "||"  
}

alto = \relative c' { 
  \partial 2 c2 \bar "|" c c c4(d) d(c) \bar "|" c2(b) c \bar "||" 
      d \bar "|" c4(d) e2 e e4(d) \bar "|" c1. \break 
  c2 \bar "|" c c c4(d) d(c) \bar "|" c2(b) c \bar "||" 
      d \bar "|" c4(d) e2 e e4(d) \bar "|" c1. \break 
  
  a'4(g) \bar "|" f2 e4(d) c2 f \bar "|" f(e4 d) e2 \bar "||" 
      e \bar "|" f e e d \bar "|" cis1. \bar "||" \break
      
  d2 \bar "|" d d e d \bar "|" e(d) d \bar "||" 
      c \bar "|" c4(b) c2 c b \bar "|" c1. \bar "||" 
}

tenor = \relative c { \clef "treble_8"
  \partial 2 g'2 \bar "|" f g a4(g) g2 \bar "|" a2(g) g \bar "||" 
      gis \bar "|" e a a gis \bar "|" a1. \break 
   g2 \bar "|" f g a4(g) g2 \bar "|" a2(g) g \bar "||" 
      gis \bar "|" e a a gis \bar "|" a1. \break 
  
  e'2 \bar "|" d4(c) b2 a4(g) f(g) \bar "|" a2(g4 f) g2 \bar "||" 
      c \bar "|" c c4(b) a2 a \bar "|" \once \override NoteColumn #'force-hshift = #1 a1. \bar "||" \break
      
  a2 \bar "|" g g4(fis) g(a) b(g) \bar "|" e(a fis2) g \bar "||" 
      g f! g a d,4(g) \bar "|" g1. \bar "||" 
}

bass = \relative c { 
  \partial 2 \clef bass c2 \bar "|" f e a,4(b) c2 \bar "|"f,(g) c_\fermata \bar "||" 
      b \bar "|" a4(b) c(d) e2 e
     \bar "|" a,1._\fermata \break 
   c2 \bar "|" f e a,4(b) c2 \bar "|"f,(g) c_\fermata \bar "||" 
      b \bar "|" a4(b) c(d) e2 e
     \bar "|" a,1._\fermata \break 
          
  a'2 \bar "|" d, e f4(e) d2 \bar "|" \push c1 c2_\fermata \bar "||" 
      c \bar "|" f c d4(e) f(g) \bar "|" a1._\fermata \bar "||" \break
      
  fis2 \bar "|" g b, e4(fis!) g2 \bar "|" c,( d) g,_\fermata \bar "||" 
      c4(b) \bar "|" a2 g f g \bar "|" c1._\fermata \bar "||" 
}

#(ly:set-option 'point-and-click #f)


\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
}

firstWords = \lyricmode
{
    \override Score . LyricText #'font-size = #-0.5
    \override Score . LyricHyphen #'minimum-distance = #1
    \override Score . LyricSpace #'minimum-distance = #0.8
    % \override Score . LyricText #'font-name = #"Gentium"
    % \override Score . LyricText #'self-alignment-X = #-1
    \set stanza = "1. "
    %\set vocalName = "Men/Women/Unison/SATB"
O Sa -- cred Head, sur -- round -- ed
By crown of pierc -- ing thorn!
O bleed -- ing head, so wound -- ed,
Re -- viled and put to scorn!
Death's pal -- lid hue comes o'er Thee,
The glow of life de -- cays,
Yet hosts of heaven a -- dore Thee
And trem -- ble as they gaze.
	}

secondWords = \lyricmode
{
\set stanza = "2. "
I see Thy strength and vi -- gour,
All fad -- ing in the strife,
And death with cru -- el ri -- gour,
Be -- reav -- ing Thee of life;
O a -- go -- ny and dy -- ing!
O love to sin -- ners free!
Je -- sus, all grace sup -- ply -- ing,
Turn Thou Thy face on me.
}

thirdWords = \lyricmode
{
\set stanza = "3. "
What lan -- guage shall I bor -- row
To thank Thee, dear -- est Friend,
For this Thy dy -- ing sor -- row,
Thy pi -- ty with -- out end?
O make me Thine for -- ev -- er,
And should I faint -- ing be,
Lord, let me ne -- ver, ne -- ver
Out -- live my love to Thee.
}


\book {

\score{
\new ChoirStaff 
<<
  \context Staff = upper << 
        \context Voice = sopranos { \global \soprano }
	\context Lyrics = sopranos \lyricsto sopranos \firstWords
	\context Lyrics = sopranosTwo \lyricsto sopranos \secondWords
	\context Lyrics = sopranosThree \lyricsto sopranos \thirdWords
		>>
  \context Staff = subupper <<
        \context Voice = altos    { \global \alto }
	\context Lyrics = altos \lyricsto altos \firstWords
	\context Lyrics = altosTwo \lyricsto altos \secondWords
	\context Lyrics = altosThree \lyricsto altos \thirdWords
              >>
  \context Staff = lower <<
        \context Voice = tenors { \global \tenor }
	\context Lyrics = tenors \lyricsto tenors \firstWords
	\context Lyrics = tenorsTwo \lyricsto tenors \secondWords
	\context Lyrics = tenorsThree \lyricsto tenors \thirdWords
			>>
  \context Staff = sublower <<
        \context Voice = basses { \global \bass }
	\context Lyrics = basses \lyricsto basses \firstWords
	\context Lyrics = bassesTwo \lyricsto basses \secondWords
	\context Lyrics = bassesThree \lyricsto basses \thirdWords
	                       >>
>>
\layout {
        indent=0
        \context { \Score \remove "Bar_number_engraver" }
        \context { \Staff \remove "Time_signature_engraver" }
        \context { \Score \remove "Mark_engraver"  }
        \context { \Staff \consists "Mark_engraver"  }
        } %% close layout

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2)}} 

} %%% end score bracket

%%% Lyric attribution

\markup { \hspace #3 \column { \line {" "}}}

\markup { \small { \line { \italic "P. Gerhardt, 1607-76, based on" "Salve caput cruentatum" } }}
\markup { \small { \line { "(" \italic "ascribed to St. Bernard" ")."} }}
\markup { \small { \line{ \italic " Tr. Henry Williams Baker, 1821-77 and James Waddel Alexander, 1804-1859 " }}
}

%%% Note: In order to generate the Fraktur title below, a Fraktur font is needed.
%%% HumboldtFraktur and GF Gesetz are examples of Fraktur fonts which resemble the original
%%% image and are free and downloadable from the internet.   
%%% HumboldtFraktur works well on Windows and Linux 
%%% but has been reported to give problems when compiling
%%% on Macintosh installations, thus GF Gesetz has been used below
%%% If you use another Fraktur font, simply put the name into the font-name override below.

\markup { \line { { \hspace #8 \override #'(font-name . "UnifrakturMaguntia") {"O Haupt voll Blut und Wunden." }}}}

%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                              << 
        \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne f1 e  \bar "||" }}
        \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 c \bar "||" }}
                              >>

	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }

        \context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                               << 
        \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 g \bar "||" }}
        \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  f1 c \bar "||" }}
                                >> 
  >>                          

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 

   \context { 
        \Score timing = ##f }
        ragged-right = ##t
        indent = 15\cm
   \context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%%%%%%%%%%%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2) }} 
}

} %%% book bracket
