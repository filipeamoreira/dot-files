;; It's all about the project.
(global-set-key (kbd "C-c f") 'find-file-in-project)

;; You know, like Readline.
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "M-/") 'hippie-expand)

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

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'esk-eval-and-replace)

;; So good!
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-x g") 'magit-status)

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

(global-set-key "\C-c#" 'comment-or-uncomment-region)
(global-set-key "\C-c/" 'comment-or-uncomment-region)

;; Fullscreen mode
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)

;; Resize window
(global-set-key (kbd "<M-S-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<M-S-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "<M-S-down>") 'shrink-window)
(global-set-key (kbd "<M-S-up>") 'enlarge-window)

;; ;; ace jump mode
;; ;; C-u C-c SPC => ace-jump-char-mode
;; ;; C-u C-u C-c SPC => ace-jump-line-mode
;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; (global-set-key "\C-x\C-m" 'execute-extended-command)
;; (global-set-key "\C-c\C-m" 'execute-extended-command)

;; Map Mac cmd as meta
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
;;(setq mac-option-key-is-meta t)
;;(setq mac-command-key-is-meta t)
;;(setq mac-option-modifier 'meta)
;; (setq mac-command-modifier 'super)
;; (setq mac-option-modifier 'meta)


;; org-mode bindings

(global-set-key (kbd "C-c o a") 'org-agenda-list)
(global-set-key (kbd "C-c o t") 'org-todo-list)
(global-set-key (kbd "C-c o p") 'org-insert-property-drawer)
(global-set-key (kbd "C-c o d") 'org-date)
(global-set-key (kbd "C-c o j") 'org-journal-entry)
(global-set-key (kbd "C-c r") 'org-remember)
(global-set-key (kbd "C-c a") 'org-agenda)


;; Defining some aliases
(defalias 'afm 'auto-fill-mode)
(defalias 'mm 'markdown-mode)
(defalias 'wc 'word-count)
(defalias 'wcr 'word-count-region)
(defalias 'qrr 'query-replace-regexp)
(defalias 'fs 'flyspell-mode)
(defalias 'oa 'org-agenda)
(defalias 'uf 'unfill-region)
(defalias 'eb 'eval-buffer)

;; Extra bindings for dired

(global-set-key (kbd "C-x C-d") 'ido-dired)

;; Overrides the proced command
(global-set-key (kbd "C-x p")  'previous-multiframe-window)

(provide 'guto-bindings)
