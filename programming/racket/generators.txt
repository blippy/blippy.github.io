;; generators
;; 15-jul-2006 started

(require (planet "generator.ss" ("dyoo" "generator.plt" 2 0)))
(require (lib "file.ss"  ))

(define-generator (for-each-file-generator path)
  (let ((yieldp (lambda (path kind acc) (yield (cons path kind)))))
    (fold-files yieldp 0 path)))

;;(generator-for-each display (for-file-generator "c:/temp"))

(define-syntax for-each-file
  (syntax-rules ()
      ((for-each-file pathstr path kind body ...)
       (let ((path #f) (kind #f))
         (generator-for-each
          (lambda (x)
            (set! path (car x))
            (set! kind (cdr x))
            body ...)
          (for-each-file-generator pathstr))))))

(for-each-file "c:/temp" thepath kind
               (display thepath)
               (newline)
               (display kind)
               (newline))

