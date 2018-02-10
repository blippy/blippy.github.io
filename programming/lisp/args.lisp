;;;; processing command line arguments


(defun quit () (win:exitprocess 0))

(defun main () 
  (let ((args (ccl:get-command-line-args)))
    (print args)
    (terpri)
    (force-output)
    (quit)))

(defun make () 
  (let ((exe-name (cat (namestring (current-directory)) "hello.exe")))
    (save-application exe-name #'main :console t :static t)))

;;;; --- end file args.lisp