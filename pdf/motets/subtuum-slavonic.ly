\version "2.24.2"
\paper {
  top-system-spacing.basic-distance = #10
  score-system-spacing.basic-distance = #20
  system-system-spacing.basic-distance = #20
  last-bottom-spacing.basic-distance = #10
}

\header {
  title = "Sub Tuum"
  composer = "Slavonic"
}

global = {
  \key bes \major
  \set Score.timing = ##f
}

sopMusic = \relative {
  bes'1 a2 bes c d4 ees d1  | 
  d2 c bes1 a1  |  
  bes2 c d1( c2) bes a a bes1 \break \bar "|" 
  bes2. bes4 bes2 a bes c d4( ees) d1  | 
  d2 c bes2. bes4 a1 |
  bes2 c d1( c2) bes a a bes1 \break \bar "|"
  c2 c c d2. d4 c2 ees2( d) c | bes d c bes a1 bes \break \bar "|"
  c2. c4 d2. d4 c2( ees d) c | bes d( c) bes a1 bes \bar "||"
}
sopWords = \lyricmode {
}

altoMusic = \relative {
  g'1 fis2 g a bes4 c bes1
  bes2 a g1 fis
  g2 a bes1( a2) g fis fis g1
  g2. g4 g2 fis g a bes4( c) bes1
  bes2 a g2. g4 fis1
  g2 a bes1( a2) g2 fis fis g1
  a2 a a bes2. bes4 a2 c2( bes) a g bes a g fis1 g
  a2. a4 bes2. bes4 a2( c bes) a g bes a g fis1 g1
}
altoWords = \lyricmode {
  Sub tu -- um prae -- si -- di -- um
  con -- fu -- gi -- mus
  San -- cta De -- i Ge -- ni -- trix
  no -- stras de -- pre -- ca -- ti -- o -- nes ne de -- spi -- ci -- as
  in ne -- ces -- si -- ta -- ti -- bus:
  sed a per -- i -- cu -- lis cun -- ctis li -- be -- ra nos sem -- per.
  Vir -- go glo -- ri -- o -- sa, et be -- ne -- di -- cta.
}

tenorMusic = \relative {
  g1 d2 g f f4 f bes,1
  bes2 f'2 g1 d
  g2 f bes1( f2) g2 d2 d g1
  g2. g4 g2 d g f f bes,1
  bes2 f' g2. g4 d1
  g2 f bes1( f2) g2 d d g1
  f2 f f bes2. bes4 f2 f1 fis2 g g fis g d1 g |
  f2. f4 bes2. bes4 f1. fis2 g g fis g d1 <d g,> |
}
tenorWords = \lyricmode {
}

bassMusic = \relative {
}
bassWords = \lyricmode {
}

\score {
  \new ChoirStaff <<
    \new Lyrics = "sopranos" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
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
    \new Lyrics = "tenors" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
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
    \new Lyrics = "basses"
    \context Lyrics = "sopranos" \lyricsto "sopranos" \sopWords
    \context Lyrics = "altos" \lyricsto "altos" \altoWords
    \context Lyrics = "tenors" \lyricsto "tenors" \tenorWords
    \context Lyrics = "basses" \lyricsto "basses" \bassWords
  >>
  \layout { }
  \midi { 
    \tempo 2 = 100
  }
}



