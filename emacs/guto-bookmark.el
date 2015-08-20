(require 'bookmark)

(defvar guto-minibuffer-map (copy-keymap minibuffer-local-must-match-map)
  "Keymap for `bookmark-do-quick-jump'")

(define-key guto-minibuffer-map
  [remap self-insert-command] 'guto-self-insert-complete-and-exit)
(define-key guto-minibuffer-map " " "-")

(defvar guto-display-function nil)

(defun guto-self-insert-complete-and-exit (n)
  (interactive "p")
  (self-insert-command n)
  (ignore-errors
    (completion--do-completion nil 'expect-exact))
  (let ((candidates (completion-all-sorted-completions)))
    (cond
      ((null candidates)
       (backward-delete-char-untabify 1)
       (minibuffer-complete))
      ((eq 1 (safe-length candidates))
       (minibuffer-complete-and-exit)))))

;;;###autoload
(defun guto-bookmark-jump (bookmark)
  "Jump to specified bookmark with auto-completion and auto-acceptance."
  (interactive
   (list
    (if (window-minibuffer-p)
        (error "Already in minibuffer")
     (let ((minibuffer-local-must-match-map guto-minibuffer-map))
       (completing-read "Jump to bookmark: " bookmark-alist nil t)))))
  (ignore-errors
    (bookmark-jump bookmark guto-display-function)))

(global-set-key (kbd "M-m") 'guto-bookmark-jump)
