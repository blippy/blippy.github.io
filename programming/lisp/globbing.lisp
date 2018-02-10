(defvar *descend-subdirectories* nil)

(defun process-command-line-args (args) args)

(defun flatten (list)
  (let ((new-list '()))
    (dolist (x list (nreverse new-list))
      (if (atom x)
	  (push x new-list)
	(dolist (y (flatten x))
	  (push y new-list))))))

(defun expand-wildcards (files)
  (let ((new-files '()))
    (dolist (file files (nreverse new-files))
      (if (or (find #\? file) (find #\* file))
	  (let ((expanded (flatten (directory file :recurse 
					      *descend-subdirectories*))))
	    (dolist (x expanded)
	      (push x new-files)))
	(push file new-files)))))

(defun main ()	
  (let ((args (ccl:get-command-line-args)))
    (print (expand-wildcards (process-command-line-args args))))    
  (force-output)
  (win:exitprocess 0))

(defun make () 
    (save-application "/globbing.exe" #'main :console t :static t))

;;;; --- end file globbing.lisp