\header {
  title = "Michael, Prince of Highest Heaven"
  composer = "Jules Brazil"
tagline = " "
}

\footer {
}

#(set-global-staff-size 18) \paper{ #(define fonts (make-pango-font-tree "Calluna" "Calluna" "Calluna" (/ 18 20))) }

melody = \relative c'' {
  \clef treble
  \key g \major
  \time 4/4
g4 g g g g8( fis) e( fis) g2
c4 d b g8( fis) e4 a d,2
g4. f8 e4 e a4. g8 fis4 fis
g4 a b c a a d2
d4 d d8( c) g( a) b4 a g2
}

versetune = \relative c'' {
b4 b b a c c c b d d d b a g fis2
a4 a a a a b8( cis) d4 a d a cis8( b) a( g) fis4 e d2
}

text = \lyricmode {
Mi -- chael, Prince of high -- est heav'n,
No -- blest of ce -- les -- tial ranks,
Low -- ly sing -- ing in thine hon -- our,
Bring we now our meed of thanks,
Bring we now our meed of thanks.
}

verseone = \lyricmode {
\set stanza = "1." Might -- y vic -- tor all re -- splen -- dent,
Next to Ma -- ry thou dost reign;
Come and bless us with thy pres -- ence,
Bring with thee thy heav'n -- ly train.
}

versetwo = \lyricmode {
\set stanza = "2." Ga -- briel sil -- ver tongued and glo -- rious,
Ra -- phael, heal -- er of our woes,
Bless -- ed an -- gels, gen -- tle guard -- ians,
Be our aid, re -- pel our foes.
}

versethree = \lyricmode {
\set stanza = "3." Breathe in -- to our hearts your sweet -- ness,
Fill our souls with love di -- vine,
May your gra -- cious pres -- ence ev -- er
Round your charge pro -- tect -- ing shine.
}

\score{
 \header {
    piece = "Chorus"
  }  <<
    \new Voice = "one" {
      \autoBeamOff
      \melody
    }
    \new Lyrics \lyricsto "one" \text
  >>
  \layout { }
  \midi { }
}

Verses

\score{
 \header {
    piece = "Verses"
  }  <<
    \new Voice = "one" {
      \autoBeamOff
      \versetune
    }
    \new Lyrics \lyricsto "one" \verseone
    \new Lyrics \lyricsto "one" \versetwo
    \new Lyrics \lyricsto "one" \versethree
  >>
  \layout { }
  \midi { }
}


