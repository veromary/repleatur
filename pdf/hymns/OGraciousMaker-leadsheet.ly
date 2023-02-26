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
                            \line { \italic "Melody inspired by " \smallCaps "T. Campion, 1575-1619." }
                } } }

  tagline =""

}

melody = \relative c' {
  \clef treble
  \key f \major
  \time 3/2

 \partial 2 d2 f1 g2 a1 a2 g1 f2 e1 e2 f1 g2 a1 a2 g2 g1 f1 \bar "||"
a2 c1 a2 g2.( f4) e2 f1 g2 a1 a2 a1 g2 a2.( g4) f2 e e1 d1 \bar "||"
}

text = \lyricmode {
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

fourthVerse = \lyricmode {
\set stanza = "4. " Whilst sav -- ing fasts our flesh sub -- due,
May thy sweet grace our hearts re -- new,
That vice may thus un -- fed re -- main,
And we from sin and guilt ab -- stain.
}

lastVerse = \lyricmode {
\set stanza = "5. " Grant us, O sac -- red Tri -- ni -- ty,
Grant us, O per -- fect U -- ni -- ty,
That these our fasts may fruit -- ful prove
Of end -- less bliss, in realms a -- bove.}

harmonies = \chordmode {
d2:m d1.:m a1.:m g:m a:m
d1:m c2 a1.:m g:m f
f g:m f a:m f a:m a:m d:m
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Voice = "one" { \autoBeamOff \melody }
    \new Lyrics \lyricsto "one" \text
    \new Lyrics \lyricsto "one" \secondVerse
  >>
  \layout { }
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 90 2)}} 
}

\markup{ 
\column{
\null

\null

\null

}
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Voice = "one" { \autoBeamOff \melody }
    \new Lyrics \lyricsto "one" \thirdVerse
    \new Lyrics \lyricsto "one" \fourthVerse
    \new Lyrics \lyricsto "one" \lastVerse
  >>
\layout {
  indent = #0
}
}
