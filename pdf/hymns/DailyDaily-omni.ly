\header {
  title = "Daily, daily sing to Mary"
poet = "Bernard of Cluny"
meter = "tr. Henry Bittleston (1854)"
arranger = "arr. William Smith Rockstro 1823-95"
composer = "Melody from David Gregor Corner's 'Gesangbuch', Nüremburg, 1631"
}

Timeline = {
  \time 3/2
%  \tempo 4=96
  \partial 2
  s2 | s1 s2 | s1 \breathe s2 | s1 s2 | s1 \caesura
  s2 | s1 s2 | s1 \breathe s2 | s1 s2 | s1 \fine
}

SopranoMusic = \relative g' {
f4 f g2 f a4 c bes2 a f4 g
a4 c c2 b c1 c4 c d2 c bes4 a
g2 a f4 g a bes g2. f4 f1
}

AltoMusic = \relative c' {
c4 d e2 f f4 f f( e) f2 c4 e
f g f2 f e1 f4 g f2 f f4 f 
e4( d) cis2 d4 e f f f2 e f1
}

TenorMusic = \relative a {
a4 a c2 a c4 a bes2 c a4 c 
c c a( g) f2 g1 a4 g a2 a d4 c 
c( d) e2 a,4 c c d c2 c a1
}

BassMusic =  \relative g {
f4 d c2 f f4 f g2 f f4 c 
f e f( e) d2 c1 f4 e d2 f bes,4 f'4 c4( bes) a2 d4 c f bes, c2 c f,1
}

firstWords = \lyricmode {
Dai -- ly, dai -- ly sing to Ma -- ry,
Sing my soul, her praise -- s due;
All her feasts, her ac -- tions wor -- ship,
With the heart's de -- vo -- tion true.
}

secondWords = \lyricmode {
Lost in wondr -- ing con -- tem -- pla -- tion
Be her ma -- jes -- ty con -- fessed;
Call her Moth -- er, call her Vir -- gin,
Hap -- py moth -- er, Vir -- gin blest.
}



global = {
 \key f \major
}

harmonies = \chordmode {
f4 d:m c2 f f g:m7 f f4 c4 f4 c/e f2 g:7/d c1
f4 c/e d2:m f bes4 f c4 g:m/bes a2 d4:m c f bes c1 f
}

\score {  % Start score
  <<
    \new PianoStaff <<  % Start pianostaff
  \new ChordNames {
    \set chordChanges = ##t
    \harmonies
  }
      \new Staff <<  % Start Staff = RH
        \global
        \clef "treble"
        \new Voice = "Soprano" <<  % Start Voice = "Soprano"
          \Timeline
          \voiceOne
          \SopranoMusic
        >>  % End Voice = "Soprano"
        \new Voice = "Alto" <<  % Start Voice = "Alto"
          \Timeline
          \voiceTwo
          \AltoMusic
        >>  % End Voice = "Alto"
	\context Lyrics = altos \lyricsto Alto \firstWords
	\context Lyrics = altostwo \lyricsto Alto \secondWords
      >>  % End Staff = RH
      \new Staff <<  % Start Staff = LH
        \global
        \clef "bass"
        \new Voice = "Tenor" <<  % Start Voice = "Tenor"
          \Timeline
          \voiceOne
          \TenorMusic
        >>  % End Voice = "Tenor"
        \new Voice = "Bass" <<  % Start Voice = "Bass"
          \Timeline
          \voiceTwo
          \BassMusic
        >>  % End Voice = "Bass"
      >>  % End Staff = LH
    >>  % End pianostaff
  >>
}  % End score



\layout {
  \context {
    \Score
    caesuraType = #'((bar-line . "||"))
    fineBarType = "||"
  }
}

\paper {  % Start paper block
  indent = 0     % don't indent first system
%  line-width = 130   % shorten line length to suit music
}  % End paper block

