(defun levenshtein-distance (str1 str2)
  "Return the edit distance between strings STR1 and STR2."
  ;; FIXME: interactive call not working
  ;; (interactive "sString One:\nsString Two:")

  (if (not (stringp str1))
      (error "Argument was not a string: %s" str1))
  (if (not (stringp str2))
      (error "Argument was not a string: %s" str2))
  (let* ((make-table (function (lambda (columns rows init)
                                 (make-vector rows (make-vector columns init)))))
         (tref (function (lambda (table x y)
                           (aref (aref table y) x))))
         (tset (function (lambda (table x y object)
                           (let ((row (copy-sequence (aref table y))))
                             (aset row x object)
                             (aset table y row) object))))
         (length-str1 (length str1))
         (length-str2 (length str2))
         (d (funcall make-table (1+ length-str1) (1+ length-str2) 0)))
    (let ((i 0) (j 0))
      (while (<= i length-str1)
        (funcall tset d i 0 i)
        (setq i (1+ i)))
      (while (<= j length-str2)
        (funcall tset d 0 j j)
        (setq j (1+ j))))
    (let ((i 1))
      (while (<= i length-str1)
        (let ((j 1))
          (while (<= j length-str2)
            (let* ((cost (if (equal (aref str1 (1- i)) (aref str2 (1- j)))
                             0
                           1))
                   (deletion (1+ (funcall tref d (1- i) j)))
                   (insertion (1+ (funcall tref d i (1- j))))
                   (substitution (+ (funcall tref d (1- i) (1- j)) cost)))
              (funcall tset d i j (min insertion deletion substitution)))
            (setq j (1+ j))))
        (setq i (1+ i))))
    (message (funcall tref d length-str1 length-str2))))


;; (defun foo3 (n)             ; foo3 takes one argument,
;;   (interactive "nCount:") ;   which is read with the Minibuffer.
;;   (forward-word (* 2 n)))
;; ⇒ foo3

;; (defun three-b (b1 b2 b3)
;;   "Select three existing buffers.
;;      Put them into three windows, selecting the last one."
;;   (interactive "bBuffer1:\nbBuffer2:\nbBuffer3:")
;;   (delete-other-windows)
;;   (split-window (selected-window) 8)
;;   (switch-to-buffer b1)
;;   (other-window 1)
;;   (split-window (selected-window) 8)
;;   (switch-to-buffer b2)
;;   (other-window 1)
;;   (switch-to-buffer b3))
;; ⇒ three-b
;; (three-b "*scratch*" "declarations.texi" "*mail*")
;; ⇒ nil


(defun create-scratch-buffer ()
  "Create a new scratch buffer."
  (interactive)
  (progn
    (switch-to-buffer (get-buffer-create (generate-new-buffer-name "*scratch*")))
    (insert
";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.\n\n")
    (emacs-lisp-mode)))

(defun org-find-dangling-clock ()
  "Find a dangling clock entry in an org-mode buffer"
  (interactive)
  (re-search-forward "CLOCK: \\[[^]]*\\] *$"))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer 
        (delq (current-buffer) 
              (remove-if-not 'buffer-file-name (buffer-list)))))


(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
