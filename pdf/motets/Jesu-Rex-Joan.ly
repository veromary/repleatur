\version "2.18.0"
\include "deutsch.ly"
#(define (tie::tab-clear-tied-fret-numbers grob)
   (let* ((tied-fret-nr (ly:spanner-bound grob RIGHT)))
     (ly:grob-set-property! tied-fret-nr 'transparent #t)))

ficta = \once \set suggestAccidentals =##t
\header {
  title = \markup {
    \center-column {
      "Jesu Rex admirabilis"
      %      "Wann er zu nacht"
      %      \vspace #0.5
    }
  }
  composer = "Giovanni Pierluigi da Palestrina"
  arranger = "ed. Andreas Stenberg"
  poet = "Text: Anonymous c.1200; "
  meter ="from: Dulcis Iesu memoria (stanzas 33 - 40)"
  copyright = \markup {"Copyright " \char ##x00A9   2018 " by Andreas Stenberg then simplified by Veronica Brandt 2023 secundum CPDL" }
  tagline =""
}
global = {
  \key f \major
}

sopMusic = \relative c'' {
  \set Score.tempoHideNote = ##t
  \tempo 2 = 86
  \time 2/2
  \set Timing.measureLength = #(ly:make-moment 4/2)
\partial 2
    d2 d4 c4 f4 e4 d4. d8
    d4 b4 a4 d4 c4 b4 a4. a8
    a2 \break r2 
    d2 e2
    e2 f4 d4 c4. c8 c2~
    c2 r4 f4 f4 e4 d4. d8
    d4 c4 b4 b4 b4 a4 g4. g8
    g4 \ficta fis4 g1
  \bar "||"
}
sopWords = \lyricmode {
\set stanza = "1. "  Je -- su Rex ad -- mi -- ra -- bi -- lis
  Et tri -- um -- fa -- tor no -- bi -- lis
  Dul -- ce -- do in ef -- fa -- bi -- lis
  To -- tus de -- si -- de -- ra -- bi -- lis.
  To -- tus de -- si -- de -- ra -- bi -- lis.
}
sopWordsII = \lyricmode {
  Ma -- ne  no -- bis -- cum, Do -- mi -- ne,
  Et nos il -- lus -- tra lu -- mi -- ne
  Pul -- sa men -- tis ca -- li -- gi -- ne
  Mun -- dum re -- plens dul -- ce -- di -- ne.
  Mun -- dum re -- plens dul -- ce -- di -- ne.
}
verseThree = \lyricmode {
\set stanza = "3. " Te sae -- cu -- lo -- rum Prin -- ci -- pem,
Te, Chri -- ste, re -- gem gen -- ti -- um,
Te men -- ti -- um, Te cor -- di -- um
u -- num fa -- te -- mur ar -- bi -- trum
u -- num fa -- te -- mur ar -- bi -- trum.
}
verseFive = \lyricmode {
\set stanza = "5. " Quo -- cum -- que lo -- co fu -- e -- ro
sem -- per Je -- sum de -- si -- de -- ro
a -- mo -- re Je -- sus lan -- gue -- o
et cor -- de to -- tus ar -- de -- o,
et cor -- de to -- tus ar -- de -- o.
}

altoMusic = \relative c' {
    b'2 a4 g4  a4 a4 b4. b8
    b4 d4 c4 b4 a4 g4 fis4. fis8
    \ficta fis2 r2
    a2 cis2
    cis2 d4 b4 a4. a8 a4 a4
    a4 g4 a4. a8 a4 a4 b2
    r2 d2 d4 c4 b4. b8
    b4 a4 g1
}
altoWords = \lyricmode {
  Je -- su Rex ad -- mi -- ra -- bi -- lis
  Et tri -- um -- fa -- tor no -- bi -- lis
  Dul -- ce -- do in ef -- fa -- bi -- lis
  To -- tus de -- si -- de -- ra -- bi -- lis.
  To -- tus de -- si -- de -- ra -- bi -- lis.
}
altoWordsII = \lyricmode {
  Ma -- ne  no -- bis -- cum, Do -- mi -- ne,
  Et nos il -- lus -- tra lu -- mi -- ne
  Pul -- sa men -- tis ca -- li -- gi -- ne
  Mun -- dum re -- plens dul -- ce -- di -- ne.
  Mun -- dum re -- plens dul -- ce -- di -- ne.
}
bassMusic = \relative c' {
    g'2 f4 e4 d4 c4 b4. b8
    b4 b4 f'4 b,4 c4 c4 d4. d8
    d2 r2
    d2 a2
    a2 d4 d4 f4. f,8 f4 f'4
    f4 e4 d4. d8 d4 b4 b4 b4
    b4 a4 g2 f2 g8\melisma a8 b8 c8
    d4.\melismaEnd d8 g,1
}
bassWords = \lyricmode {
  Je -- su Rex ad -- mi -- ra -- bi -- lis
  Et tri -- um -- fa -- tor no -- bi -- lis
  Dul -- ce -- do in ef -- fa -- bi -- lis
  To -- tus de -- si -- de -- ra -- bi -- lis.
  To -- tus de -- si -- de -- ra -- bi -- lis.
}
bassWordsII = \lyricmode {
  Ma -- ne  no -- bis -- cum, Do -- mi -- ne,
  Et nos il -- lus -- tra lu -- mi -- ne
  Pul -- sa men -- tis ca -- li -- gi -- ne
  Mun -- dum re -- plens dul -- ce -- di -- ne.
  Mun -- dum re -- plens dul -- ce -- di -- ne.
}



%% Scoreblock for Voicescore transposed for
\score {
  <<
    \transpose f c
    \new StaffGroup \with {
      \override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 12))
    } <<
      \new Staff = treble <<
        \new Voice = "sopranos" {
          \set  Staff.midiInstrument ="choir aahs"
          %	\voiceOne
          << \global \sopMusic >>
        }
      >>
      \new Lyrics = sopranos { s1 }
      \new Lyrics = sopranosII { s1 }
      \new Lyrics = sopranosIII { s1 }

      \new Staff = "medius" <<

        \new Voice = "altos" {
          %	\voiceTwo
          \set  Staff.midiInstrument ="choir aahs"
          << \global \altoMusic >>
        }
      >>

      \new Lyrics = "altos" { s1 }
      \new Lyrics = "altosII" { s1 }
      \new Lyrics = "altosIII" { s1 }
      \new Staff ="basses" {

        \new Voice = "basses" {
          \set  Staff.midiInstrument ="choir aahs"
          \clef "G_8"
          %	\voiceTwo
          << \global \bassMusic >>
        }
      }
    >>
    \new Lyrics = basses { s1 }
    \new Lyrics = bassesII { s1 }
    \new Lyrics = bassesIII { s1 }

    \context Lyrics = sopranos \lyricsto sopranos \sopWords
    \context Lyrics = sopranosII \lyricsto sopranos \verseThree
    \context Lyrics = sopranosIII \lyricsto sopranos \verseFive
    \context Lyrics = altos \lyricsto altos \sopWords
    \context Lyrics = altosII \lyricsto altos \verseThree
    \context Lyrics = altosIII \lyricsto altos \verseFive
    \context Lyrics = basses \lyricsto basses \sopWords
    \context Lyrics = bassesII \lyricsto basses \verseThree
    \context Lyrics = bassesIII \lyricsto basses \verseFive
  >>
  \layout {
    \context {
      \Score
      % no bars in staves
      %      \override BarLine.transparent = ##t

    }
    % the next three instructions keep the lyrics between the bar lines
    \context {
      %\Lyrics
      %\consists "Bar_engraver"
      %\override BarLine.transparent = ##t
    }
    \context {
      %\StaffGroup
      %\consists "Separating_line_group_engraver"
    }
    \context {
      \Voice
      % no slurs
      \override Slur.transparent = ##t
      % Comment in the below "\remove" command to allow line
      % breaking also at those barlines where a note overlaps
      % into the next bar.  The command is commented out in this
      % short example score, but especially for large scores, you
      % will typically yield better line breaking and thus improve
      % overall spacing if you comment in the following command.
      %\remove "Forbid_line_break_engraver"
    }
  }
}


\paper {
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  ragged-last = ##t
  print-all-headers = ##f
  print-page-number = ##f
  page-breaking = #ly:minimal-breaking
 #(define fonts
    (make-pango-font-tree "Calluna"
                          "Nimbus Sans"
                          "Luxi Mono"
                          (/ staff-height pt 22)))
}

%{
convert-ly.py (GNU LilyPond) 2.18.2  convert-ly.py: Processing `'...
Applying conversion: 2.15.7, 2.15.9, 2.15.10, 2.15.16, 2.15.17,
2.15.18, 2.15.19, 2.15.20, 2.15.25, 2.15.32, 2.15.39, 2.15.40,
2.15.42, 2.15.43, 2.16.0, 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11,
2.17.14, 2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27,
2.17.29, 2.17.97, 2.18.0
%}
