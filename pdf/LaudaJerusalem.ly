\version "2.24.2"

\paper {
  top-system-spacing.basic-distance = #10
  score-system-spacing.basic-distance = #20
  system-system-spacing.basic-distance = #20
  last-bottom-spacing.basic-distance = #10
}

\header {
  title = "Lauda Jerusalem"
  composer = "Anon"
  poet = "King David"
}

emphasize = {
  \override Lyrics.LyricText.font-series = #'bold
}

incipitize = {
  \override Lyrics.LyricText.font-shape = #'italic
}

normal = {
  \revert Lyrics.LyricText.font-shape
  \revert Lyrics.LyricText.font-series
}

global = {
  \key ees \major
  \time 8/4
}

sopMusic = \relative c'' {
  g2 g4. aes8 bes4. bes8 bes2 ees2( c4.) c8 bes1
  aes2 aes2 g4 g ees g bes2.( g4) f1
  g2 g4.( f8) ees1 bes'2 bes4.( aes8) g1
  ees'2 d4( c) bes aes g f g2( f) ees1
}

altoMusic = \relative c' {
  ees2 ees4. f8 g4. g8 g2 ees2( ees4.) f8 g1
  f2 f ees4 ees ees ees ees1 d1
  ees2 ees4.( d8) ees1 g2 g4.( f8) ees1
  g2 bes4( aes) g f ees ees ees2( d) ees1
}
altoWords = \lyricmode {
  Lau -- da Je -- ru -- sa -- lem, Do -- mi -- num;
  Lau -- da Je -- ru -- sa -- lem, Si -- on.
  Ho -- san -- na,
  Ho -- san -- na,
  Ho -- san -- na Fi -- li -- o Da -- vid!
}

tenorMusic = \relative {
  bes2 bes4. aes8 g4. g8 g2 c2( aes4.) aes8 g1
  c2 bes bes4 bes bes bes bes2( c) d1
  bes2 bes4.( aes8) bes1 bes2 d ees1
  c2 bes4( c) des c bes c bes2( bes4 aes4) g1
}

bassMusic = \relative {
  ees2 ees4. ees8 ees4. ees8 ees2 aes,2( c4.) d8 ees1
  ees2 d ees4 ees g ees g2( aes4 a4) bes1
  ees,2 ees4.( d8) ees1 g2 g4.( f8) ees1
  c2 d4( ees) e f g aes bes2( bes,) ees1
}

\score {
  \new ChoirStaff <<
    \new Staff = "women" <<
      \new Voice = "sopranos" {
        \voiceOne
        << \global \sopMusic >>
      }
      \new Voice = "altos" {
        \voiceTwo
        << \global \altoMusic >>
      }
    >>
    \new Lyrics = "altos"
    \new Staff = "men" <<
      \clef bass
      \new Voice = "tenors" {
        \voiceOne
        << \global \tenorMusic >>
      }
      \new Voice = "basses" {
        \voiceTwo << \global \bassMusic >>
      }
    >>
    \context Lyrics = "altos" \lyricsto "altos" \altoWords
  >>
\layout {
   indent = #0
}

  \midi { }
}

chant = \relative c' {
  \clef "treble"
  ees4 g bes\breve c4 bes1 \bar "|"
  bes\breve c4 a bes g1 \bar "||"
}

verba = \lyricmode {
\set stanza = "2. "
\incipitize Quo -- ni -- \normal
  \once \override LyricText.self-alignment-X = #-1
  "am confortávit seras portárum tu" -- \once \emphasize á -- rum:*
  \once \override LyricText.self-alignment-X = #-1
  "benedíxit fíliis"  \once \emphasize tu -- is  \once \emphasize in te.
}

\score {
  \new GregorianTranscriptionStaff <<
  \key ees \major
    \new GregorianTranscriptionVoice = "melody" {
      \chant
    }
    \new GregorianTranscriptionLyrics = "one" {
      \lyricsto "melody" \verba
    }
  >>
\layout {
 indent = #0
 ragged-last = ##f 
}
}

\markup \fill-line {
\column {
\line \fontsize #1 { \bold 3. \italic "Quo pó-" suit fines tuos \bold pa- cem: * }
\line \fontsize #1 { \bold 4. \italic "Quo e-" míttit elóquium suum \bold ter- rae: * }
\line \fontsize #1 { \bold 5. \italic "Glóri-" a Patri et \bold Fí- lio, * }
\line \fontsize #1 { \bold 6. \italic "Sicut" erat in princípio, et nunc, et \bold sem- per, * }
}
\hspace #2
\column {
\line \fontsize #1 { et ádipe fruménti \bold sá- ti- \bold at te. }
\line \fontsize #1 { velóciter currit\bold ser- mo \bold e- jus. }
\line \fontsize #1 { et Spi- \bold rí- tui \bold San- cto. }
\line \fontsize #1 { et in saécula saecu- \bold ló- rum. \bold A- men. }
}
}

