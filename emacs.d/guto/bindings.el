;; It's all about the project.
(global-set-key (kbd "C-c f") 'find-file-in-project)

;; You know, like Readline.
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "M-/") 'hippie-expand)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'esk-cleanup-buffer)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "C-M-%") 'query-replace)

;; Jump to a definition in the current file. (Protip: this is awesome.)
(global-set-key (kbd "C-x C-i") 'imenu)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)

;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

;; Help should search more than just commands
(define-key 'help-command "a" 'apropos)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'esk-eval-and-replace)

;; M-S-6 is awkward
(global-set-key (kbd "C-c q") 'join-line)

;; So good!
(global-set-key (kbd "C-c g") 'magit-status)

;; Maps Ctrl-z to undo
(global-set-key (kbd "C-z") 'undo)

;; Maps Ctrl-x-m to M-x
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Maps Ctrl-w to kill backward word
(global-set-key "\C-w" 'backward-kill-word)

;; Maps Ctrl-c Ctrl-k to kill-region
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-cs" 'ansi-term)

(global-set-key "\C-c#" 'comment-or-uncomment-region)
(global-set-key "\C-c/" 'comment-or-uncomment-region)

;; Maps do C-cr
(global-set-key (kbd "C-c r") 'rename-file-and-buffer)

;; Fullscreen mode
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)

;; Map Mac cmd as meta
;(setq mac-option-key-is-meta t)
;(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
;(setq mac-option-modifier 'meta)

;; Keymap for insert time
(global-set-key (kbd "C-c d") 'insert-time)

(setq mac-option-modifier 'meta)

;; open an ansi-term buffer
(global-set-key (kbd "C-x t") 'prelude-visit-term-buffer)

;; Resize window
(global-set-key (kbd "C-x [") 'shrink-window-horizontally)
(global-set-key (kbd "C-x ]") 'enlarge-window-horizontally)
(global-set-key (kbd "C-x -") 'shrink-window)
(global-set-key (kbd "C-x +") 'enlarge-window)

;; Window manipulation
(global-set-key [(control kp-6)] 'enlarge-window-horizontally)
(global-set-key [(control kp-4)] 'shrink-window-horizontally)
(global-set-key [(control kp-8)] 'enlarge-window)
(global-set-key [(control kp-2)] 'shrink-window)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-j") nil)))

;; ace jump mode
;; C-u C-c SPC => ace-jump-char-mode
;; C-u C-u C-c SPC => ace-jump-line-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key (kbd "S-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(provide 'guto/bindings)
