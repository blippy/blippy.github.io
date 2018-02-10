;; really naff jottings about macros in plt
;; 15-jul-2006 started


(define-syntax twice
  (syntax-rules ()
      ((twice a n  body ...)
       (let ((a (* 2 n)))
         body ...))))

(twice b 3
       (print b)
       (newline))

