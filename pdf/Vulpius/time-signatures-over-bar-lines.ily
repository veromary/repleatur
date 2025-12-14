cTime =
#(define-music-function (parser location time) (fraction?)
   #{ \once \override Staff.BarLine #'stencil =
      #(lambda (grob)
         (ly:grob-set-property! grob 'bar-extent '(-2 . -1))
         (ly:stencil-add
          (ly:bar-line::print grob)
          (ly:stencil-translate-axis (ly:bar-line::print grob) 3 Y)))
      \time $time #})

move-time-sig-into-bar-line =
\override Staff.BarLine.before-line-breaking =
#(lambda (grob)
   (let* (
           (b-a-g (ly:grob-parent grob X))
           (b-a (ly:grob-parent b-a-g X))
           (elts (ly:grob-array->list (ly:grob-object b-a 'elements)))
           (break-align-groups
            (filter
             (lambda (g)
               (grob::has-interface g 'break-aligned-interface))
             elts))
           (b-a-g-elts
            (apply append
              (map
               (lambda (g)
                 (ly:grob-array->list (ly:grob-object g 'elements)))
               break-align-groups)))
           (time-sig
            (filter
             (lambda (g)
               (grob::has-interface g 'time-signature-interface))
             b-a-g-elts))
           (bar-line
            (filter
             (lambda (g)
               (grob::has-interface g 'bar-line-interface))
             b-a-g-elts)))
     (if (and (not (null? time-sig)) (not (null? bar-line)))
         ;; TODO:
         ;; only the first entry of time-sig and bar-line are affected
         ;; may cause problems in cases where a StaffGroup contains Staffs with
         ;; different settings for TimeSignature and/or BarLine
         (let* ((time-sig-length
                 (interval-length
                  (ly:grob-extent (car time-sig) (car time-sig) X)))
                (bar-line-length
                 (interval-length
                  (ly:grob-extent (car bar-line) (car bar-line) X))))
           (ly:grob-set-property! grob 'space-alist
             `((time-signature extra-space
                 .
                 ,(/ (+ time-sig-length bar-line-length) -2))
               (custos minimum-space . 2.0)
               (clef minimum-space . 1.0)
               (key-signature extra-space . 1.0)
               (key-cancellation extra-space . 1.0)
               (first-note fixed-space . 0.3)
               (next-note semi-fixed-space . 0.9)
               (right-edge extra-space . 0.0)))
           (if (= (ly:item-break-dir grob) LEFT)
               (ly:grob-set-property! (car time-sig) 'X-extent '(0 . 0)))
           (if (= (ly:item-break-dir grob) LEFT)
               (ly:grob-set-property! grob 'space-alist
                 `((time-signature extra-space
                     .
                     ,(/ (+ time-sig-length bar-line-length) -2))
                   (custos minimum-space . 2.0)
                   (clef minimum-space . 1.0)
                   (key-signature extra-space . 1.0)
                   (key-cancellation extra-space . 1.0)
                   (first-note fixed-space . 0.3)
                   (next-note semi-fixed-space . 0.9)
                   (right-edge extra-space . 0.0))))
           ))))


time-sig-space-at-line-end = {
  \override Staff.TimeSignature.before-line-breaking =
  #(lambda (grob)
     (let* (
             (b-a-g (ly:grob-parent grob X))
             (b-a (ly:grob-parent b-a-g X))
             (elts (ly:grob-array->list (ly:grob-object b-a 'elements)))
             (break-align-groups
              (filter
               (lambda (g)
                 (grob::has-interface g 'break-aligned-interface))
               elts))
             (b-a-g-elts
              (apply append
                (map
                 (lambda (g)
                   (ly:grob-array->list (ly:grob-object g 'elements)))
                 break-align-groups)))
             (time-sig
              (filter
               (lambda (g)
                 (grob::has-interface g 'time-signature-interface))
               b-a-g-elts))
             (bar-line
              (filter
               (lambda (g)
                 (grob::has-interface g 'bar-line-interface))
               b-a-g-elts))
             )
       (if (= (ly:item-break-dir grob) LEFT)
           (let* ((time-sig-length
                   (interval-length
                    (ly:grob-extent grob grob X)))
                  (bar-line-length
                   (interval-length
                    (ly:grob-extent (car bar-line) (car bar-line) X))))

             (ly:grob-set-property! grob 'space-alist
               `((right-edge fixed-space
                   .
                   ,(/ (- time-sig-length bar-line-length) -2))))))
       ))
  \override Staff.TimeSignature.space-alist =
  #'((cue-clef extra-space . 1.5)
     (first-note fixed-space . 2.0)
     ;; not sure how it should look, for now hardcoded
     (right-edge fixed-space . 0)
     (staff-bar extra-space . 1.0))
}

\layout {
  \context {
    \Staff
    \move-time-sig-into-bar-line
    \time-sig-space-at-line-end
    \override TimeSignature.style = #'single-digit
  }
}