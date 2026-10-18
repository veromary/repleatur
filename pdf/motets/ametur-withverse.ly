\version "2.24.4"

\paper {
  system-count = #3
}

\header {
  title = "Ametur"
  composer = "Fr Luby MSC"
}

global = {
  \key g \major
  \time 4/4
  \dynamicUp
}
sopranonotes = \relative c'' {
  r1 b2( c) b4.( a8) g4 a b( g a2) b2.
  b4 b2 c4 d e2 d4 d c2.( b4) a1
  b2( c) b4.( a8) g2 c4 a b cis d1
  r1 b2 c b4.( a8) g4 a b( g a2) b1
}
sopranowords = \lyricmode { A -- me -- tur, a -- me -- tur 
u -- bi -- que ter -- ra  -- rum, ter -- ra -- rum 
Cor Je -- su Sa -- cra -- tis -- si -- mum
in ae -- ter -- num, ae -- ter -- num. }
altonotes = \relative c' {
  d2( e) g e4 fis g4.( fis8 e4 fis) g4 g g( fis) g2.
  g4 g2 a4 b c2 b4 b a2( g) fis1
  g2( a) g4.( fis8) g2 g4 a b a8( g) fis1
  d2 e g e4 fis g4.( fis8 e4 fis) g4 g g( fis) g1
}
altowords = \lyricmode { A -- me -- tur, a -- me -- tur, a -- me -- tur 
u -- bi -- que ter -- ra  -- rum, ter -- ra -- rum 
Cor Je -- su Sa -- cra -- tis -- si -- mum
in ae -- ter -- num, ae -- ter -- num, ae -- ter -- num. }
bassnotes = \relative c {
  \clef bass
d2( d4 c) d2 a4 a g( d') e d g,( b d2) g,2.
g'4 g( fis) e g c,( e) g g8( fis) e4( d2.) d1
g2( e4 fis) g4.( d8) e2 c4 fis g e d1
d2 d4( c) d2 a4 a g( d') e d g,( b d2) g,1
}
basswords = \lyricmode { A -- me -- tur, a -- me -- tur, a -- me -- tur 
u -- bi -- que ter -- ra  -- rum, ter -- ra -- rum 
Cor Je -- su Sa -- cra -- tis -- si -- mum
in ae -- ter -- num, ae -- ter -- num, ae -- ter -- num. }

\score {
  \new ChoirStaff <<
    \new Staff <<
      \new Voice = "soprano" <<
        \global
        \sopranonotes
      >>
      \new Lyrics \lyricsto "soprano" \sopranowords
    >>
    \new Staff <<
      \new Voice = "alto" <<
        \global
        \altonotes
      >>
      \new Lyrics \lyricsto "alto" \altowords
    >>
    \new Staff <<
      \new Voice = "bass" <<
        \global
        \bassnotes
      >>
      \new Lyrics \lyricsto "bass" \basswords
    >>
  >>
 \layout {
    indent = 1\cm
 }
 }

SoloNotes = \relative g' {
  \clef "treble"
\cadenzaOn
\hide Staff.Stem g4 a( b) b b b b b b b b b b a \bar "'"
b b c b a b \bar ","
b b b b b b b b b g a( b) a g4. \bar "||"
g4 a( b) b b b b c b b a b \bar ","
b b b b b b b b g a( b) a g4. \bar "||"
}

SoloLyrics = \lyricmode {
Mi -- se -- ré -- re mei, 
quó -- niam ad te clamávi tota di -- e:
lætífica ánimam ser -- vi tu -- i, 
quó -- niam ad te, Dó -- mine, án -- imam me -- am le -- vá -- vi.
Quó -- ni -- am tu, Dómine, su -- á -- vis et mi -- tis: 
et multæ miseri -- córdiæ ómni -- bus in -- vo -- cán -- ti -- bus te.
}

\markup {
\line{ " " }
\line{ "Psalm 85:3-5" }
}

\score{
<<
    \new Voice = "SoloVoice" << \global 
       \SoloNotes >>
    \new Lyrics \lyricsto "SoloVoice" \SoloLyrics
>>
\layout {
    indent = 1\cm
    \context {
      \Staff
      \remove Caesura_engraver
      \consists Divisio_engraver
      \EnableGregorianDivisiones
      caesuraType = #'((breath . chantquarterbar))
      measureBarType = #'()
      forbidBreakBetweenBarLines = ##f
    }
  }
}
