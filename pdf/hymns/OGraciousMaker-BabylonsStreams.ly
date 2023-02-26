\version "2.18"

\header {

  dedication = \markup { \center-align { "THE CHRISTIAN YEAR - LENT"

        \hspace #0.1 }} 

  title = "33"

  meter = \markup { \small {\column {  \line { \sans {"BABYLON'S STREAMS. "} \hspace #1 \roman {"(L. M.)" }}
                                       \line { \italic {Moderately slow, solemn} }
                                  }
                  }}
 
  arranger =  \markup { \small {\center-align {
                            \line { \italic "Melody by " \smallCaps "T. Campion, 1575-1619." }
                } } }

  tagline =""

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros

%%% generates the breathmarks

breathmark = { \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
        \override Score.RehearsalMark #'Y-offset = #'4.0
        \override Score.RehearsalMark #'X-offset = #'-0.5
        \mark \markup {\fontsize #4 ","}
}

%%% a quick macro to shorten a stem

shortenStem = \once \override Stem #'length = #4.5

%%%  Used to pull a note left. Used when a slurred note pair straddles a longer note above when notecolumn force-hshift does not work            
straddle =  { \once \override Score.SeparationItem #'padding = #2
              \once \override NoteHead #'X-offset = #-3.0
              \once \override Stem #'X-offset = #-3.0 }

%%% Push notecolumn a little to the right

push = { \once \override NoteColumn #'force-hshift = #0.4 }
              
%%%%%%%%%%%%%%%%%%%%%%%%% end of macro definitions

%%% SATB voices

global = {
  \time 2/2
  \key e \minor
  \set Staff.midiInstrument = "church organ"
}

soprano = \relative c' { 
\partial 2 e2 g a2 b1~ b2 b2 a g2 s1 \bar "" s2 \bar "||"
fis2 g a2 b2. b4 a2 a2 s1 \bar "" s2 \bar "||"
b2 d2 b2 a2 fis2 g a2 b2. \bar "||"
\breathmark b4 b2. b4 b2 a4( g) fis2 fis s1 \bar "" s2 \bar "||"
}

alto = \relative c' { 
b2 e e dis1~ dis2 e e e <fis dis>1.
dis2 e fis g2. g4 g2 fis <g g>1.
g2 g g fis fis e e dis2.
dis4 e2 fis e e e dis <e e>1.
}

tenor = \relative c' { 
\clef bass g2 b e, fis1~ fis2 g2 c b b1.
b2 b d d2. d4 e2 d4( c) b1.
d2 b g a b b e, fis2.
fis4 g2 fis g c fis, b g1.
}

bass = \relative c { 
e2 e c b1~ b2 e a, e' b1.
b2 e d g2. b,4 c2 d g1.
g2 g g d d e c b2.
b4 e2 dis e a, b b e1.
}

firstVerse = \lyricmode {
\set stanza = "1. " O gra -- cious Ma -- ker bend thine ears
Un -- to our prayers and bit -- ter tears;
May we this fast in truth now keep,
Whilst thus we pray and hum -- bly weep.
}

secondVerse = \lyricmode {
\set stanza = "2. " Thy pier -- cing eye our hearts doth scan,
And mea -- sure all the woes of man;
Whilst now, we sorrow -- ing turn to thee,
From sin’s foul bur -- den set us free.
}

thirdVerse = \lyricmode {
\set stanza = "3. " Much have we sinned, and to ex -- cess,
But spare us, Lord, who thus con -- fess;
And for the glo -- ry of thy name,
Thy sav -- ing mer -- cy now pro -- claim.}



\paper {
  #(set-paper-size "a4")
%  annotate-spacing = ##t
  print-page-number = ##f
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  line-width = 150
}

\book {

\score{
\new ChoirStaff 
<<
  \context Staff = upper << 
        \context Voice = sopranos { \voiceOne \global \soprano }
        \context Voice = altos    { \voiceTwo \global \alto }
                              >>
    \new Lyrics \lyricsto "altos" \firstVerse
    \new Lyrics \lyricsto "altos" \secondVerse
    \new Lyrics \lyricsto "altos" \thirdVerse
  \context Staff = lower <<
        \context Voice = tenors { \voiceOne \global \tenor }
        \context Voice = basses { \voiceTwo \global \bass }
                              >>
>>
\layout {
        indent=0
        \context { \Score \remove "Bar_number_engraver" }
        \context { \Staff \remove "Time_signature_engraver" }
        \context { \Score \remove "Mark_engraver"  }
        \context { \Staff \consists "Mark_engraver"  }
        } %% close layout

} %%% end score bracket

%%% A separate score block to unfold repeats and generate Hymn Midi     

\score{
\new ChoirStaff 
<<
  \context Staff = upper << 
        \context Voice = sopranos { \voiceOne \global \keepWithTag #'repeatpart \soprano \soprano }
        \context Voice = altos    { \voiceTwo \global \keepWithTag #'repeatpart \alto \alto }
                              >>
  \context Staff = lower <<
        \context Voice = tenors { \voiceOne \global \keepWithTag #'repeatpart \tenor \tenor }
        \context Voice = basses { \voiceTwo \global \keepWithTag #'repeatpart \bass \bass }
                              >>
>>

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 69 2)}} 

} %%% end Hymn midi Score 


%% Amen score block

\score{
  \new ChoirStaff
   <<
        \context Staff = upper \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                              << 
        \context Voice = "sopranos" { \relative c' { \clef treble \global \voiceOne e1 e  \bar "||" }}
        \context Voice = "altos"    { \relative c' { \clef treble \global \voiceTwo c1 b \bar "||" }}
                              >>

	\context Lyrics \lyricsto "altos" {\override LyricText #'font-size = #-1  A -- men. }

        \context Staff = lower \with { fontSize = #-3  \override StaffSymbol #'staff-space = #(magstep -2) }  
                               << 
        \context Voice = "tenors" { \relative c { \clef bass \global \voiceThree a'1 gis \bar "||" }}
        \context Voice = "basses" { \relative c { \clef bass \global \voiceFour  a1 e' \bar "||" }}
                                >> 
  >>                          

\header { breakbefore = ##f piece = " " opus = " " }

\layout { 

   \context { 
        \Score timing = ##f }
        ragged-right = ##t
        indent = 10\cm
   \context { \Staff \remove Time_signature_engraver }

       } %% close layout

%%%%%%%%%%%%%% Amen Midi

\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 42 2) }} 
}

} %%% book bracket
