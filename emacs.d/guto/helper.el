;; Word counting function
;;; First version; has bugs!
(defun count-words-region (beginning end)
  "Print number of words in the region.
Words are defined as at least one word-constituent
character followed by at least one character that
is not a word-constituent.  The buffer's syntax
table determines which characters these are."
  (interactive "r")
  (message "Counting words in region ... ")

;;; 1. Set up appropriate conditions.
  (save-excursion
    (goto-char beginning)
    (let ((count 0))

;;; 2. Run the while loop.
      (while (< (point) end)
        (re-search-forward "\\w+\\W*")
        (setq count (1+ count)))

;;; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))


;; Straight from https://sites.google.com/site/steveyegge2/my-dot-emacs-file

(defun rename-file-and-buffer (new-name)
 "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
 (let ((name (buffer-name))
        (filename (buffer-file-name)))
 (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
 (if (get-buffer new-name)
         (message "A buffer named '%s' already exists!" new-name)
   (progn
     (rename-file name new-name 1)
     (rename-buffer new-name)
     (set-visited-file-name new-name)
     (set-buffer-modified-p nil))))))

(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(defun insert-date (prefix)
    "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
    (interactive "P")
    (let ((format (cond
                   ((not prefix) "%d.%m.%Y")
                   ((equal prefix '(4)) "%Y-%m-%d")
                   ((equal prefix '(16)) "%A, %d. %B %Y")))
          (system-time-locale "de_DE"))
      (insert (format-time-string format))))

(defun insert-time ()
  (interactive)
  (insert (format-time-string "--%d/%m/%Y - %R--"))
  (insert "\n\n")
  )

(defun prelude-visit-term-buffer ()
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (ansi-term "/bin/zsh")
    (switch-to-buffer "*ansi-term*")))

(setq linum-last-pos 0)

;; (eval-after-load "linum"
;;   '(defun linum-update (buffer)
;;      "Update line numbers for all windows displaying BUFFER."
;;      ;; this is only change but couldn't find better way to do it, tried
;;      ;; linum-before-update-hook but it runs in an excursion so I couldn't get
;;      ;; current line number
;;      (setq linum-last-pos (line-number-at-pos))
;;      (with-current-buffer buffer
;;        (when linum-mode
;;          (setq linum-available linum-overlays)
;;          (setq linum-overlays nil)
;;          (save-excursion
;;            (mapc #'linum-update-window
;;                  (get-buffer-window-list buffer nil 'visible)))
;;          (mapc #'delete-overlay linum-available)
;;          (setq linum-available nil)))))

;; (defface linum-zero
;;   '((t :inherit linum :foreground "grey10" :background "magenta" :weight bold))
;;   "Face for displaying line number 0"
;;   :group 'linum)

;; (defface linum-top
;;   '((t :inherit linum :foreground "grey80" :background "grey30" :weight bold))
;;   "Face for displaying line number 0"
;;   :group 'linum)

;; (defun linum-relativenumber-format (line-number)
;;   (let ((diff (abs (- line-number linum-last-pos))))
;;     (propertize (format "%3d" diff)
;;                 'face (cond ((zerop diff) 'linum-zero)
;;                             ((eq 1 line-number) 'linum-top)
;;                             (t 'linum)))))

;; (setq linum-format 'linum-relativenumber-format)
;; Kills all them buffers except scratch
;; optained from http://www.chrislott.org/geek/emacs/dotemacs.html
(defun nuke-all-buffers ()
  "kill all buffers, leaving *scratch* only"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x))
          (buffer-list))
  (delete-other-windows))

  ;;; Personal functions

  ;; For loading libraries from the vendor directory
  ;; Modified from defunkt's original version to support autoloading.
  ;; http://github.com/defunkt/emacs/blob/master/defunkt/defuns.el
  (defun vendor (library &rest autoload-functions)
    (let* ((file (symbol-name library))
           (normal (concat "~/.emacs.d/vendor/" file))
           (suffix (concat normal ".el"))
           (personal (concat "~/.emacs.d/rmm5t/" file))
     (found nil))
      (cond
       ((file-directory-p normal) (add-to-list 'load-path normal) (set 'found t))
       ((file-directory-p suffix) (add-to-list 'load-path suffix) (set 'found t))
       ((file-exists-p suffix)  (set 'found t)))
      (when found
        (if autoload-functions
            (dolist (autoload-function autoload-functions)
              (autoload autoload-function (symbol-name library) nil t))
          (require library)))
      (when (file-exists-p (concat personal ".el"))
        (load personal))))

  ;; Arrows are common, especially in ruby
  (defun insert-arrow ()
    (interactive)
    (delete-horizontal-space)
    (insert " => "))

  ;; Quickly jump back and forth between matching parens/brackets
  (defun match-paren (arg)
    "Go to the matching parenthesis if on parenthesis."
    (interactive "p")
    (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
          ((looking-at "\\s\)") (forward-char 1) (backward-list 1))))

  ;; Make the whole buffer pretty and consistent
  (defun iwb()
    "Indent Whole Buffer"
    (interactive)
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max)))

  (defun delete-window-replacement (&optional p)
    "Kill current window.  If called with PREFIX, kill the buffer too."
    (interactive "P")
    (if p
        (kill-buffer nil))
    (delete-window))

  (defun delete-other-windows-replacement (&optional p)
    "Make the selected window fill its frame.  If called with PREFIX,
  kill all other visible buffers."
    (interactive "P")
    (if p
        (dolist (window (window-list))
          (unless (equal (window-buffer window) (current-buffer))
            (kill-buffer (window-buffer window)))))
    (delete-other-windows))

  (defun lorem ()
    (interactive)
    (insert "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent libero orci, auctor sed, faucibus vestibulum, gravida vitae, arcu. Nunc posuere. Suspendisse potenti. Praesent in arcu ac nisl ultricies ultricies. Fusce eros. Sed pulvinar vehicula ante. Maecenas urna dolor, egestas vel, tristique et, porta eu, leo. Curabitur vitae sem eget arcu laoreet vulputate. Cras orci neque, faucibus et, rhoncus ac, venenatis ac, magna. Aenean eu lacus. Aliquam luctus facilisis augue. Nullam fringilla consectetuer sapien. Aenean neque augue, bibendum a, feugiat id, lobortis vel, nunc. Suspendisse in nibh quis erat condimentum pretium. Vestibulum tempor odio et leo. Sed sodales vestibulum justo. Cras convallis pellentesque augue. In eu magna. In pede turpis, feugiat pulvinar, sodales eget, bibendum consectetuer, magna. Pellentesque vitae augue."))

  ;; ;; Use the text around point as a cue what it is that we want from the
  ;; ;; editor. Allowance has to be made for the case that point is at the
  ;; ;; edge of a buffer.
  ;; (defun indent-or-expand (arg)
  ;;   "Either indent according to mode, or expand the word preceding
  ;; point."
  ;;   (interactive "*P")
  ;;   (if (and
  ;;        (or (bobp) (= ?w (char-syntax (char-before))))
  ;;        (or (eobp) (not (= ?w (char-syntax (char-after))))))
  ;;       (dabbrev-expand arg)
  ;;     (indent-according-to-mode)))

  ;; This override for transpose-words fixes what I consider to be a flaw with the
  ;; default implementation in simple.el. To traspose chars or lines, you always
  ;; put the point on the second char or line to transpose with the previous char
  ;; or line.  The default transpose-words implementation does the opposite by
  ;; flipping the current word with the next word instead of the previous word.
  ;; The new implementation below instead makes transpose-words more consistent
  ;; with how transpose-chars and trasponse-lines behave.
  (defun transpose-words (arg)
    "[Override for default transpose-words in simple.el]
  Interchange words around point, leaving point at end of
  them. With prefix arg ARG, effect is to take word before or
  around point and drag it backward past ARG other words (forward
  if ARG negative).  If ARG is zero, the words around or after
  point and around or after mark are interchanged."
    (interactive "*p")
    (if (eolp) (forward-char -1))
    (transpose-subr 'backward-word arg)
    (forward-word (+ arg 1)))

  ;; Borrowed from https://gist.github.com/1415844
  ;; Also see http://emacsworld.blogspot.com/2011/12/moving-buffers-between-windows.html
  (require 'cl)
  (defun rotate-left (l)
    (append  (cdr l) (list (car l))))
  (defun rotate-windows ()
    (interactive)
    (let ((start-positions (rotate-left (mapcar 'window-start (window-list))))
    (buffers (rotate-left (mapcar 'window-buffer (window-list)))))
      (mapcar* (lambda (window  buffer pos)
           (set-window-buffer window buffer)
           (set-window-start window pos))
         (window-list)
         buffers
         start-positions)))

(defun insert-pound ()
  "Inserts a pound sign into the buffer"
  (interactive)
  (insert "£"))

(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))

(defun my-find-file-check-make-large-file-read-only-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 10 1024 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)
    ; (message "Buffer is set to read-only because it is large.  Undo also disabled.")
    ))

;; my-find-file-check-make-large-file-read-only-hook

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))
