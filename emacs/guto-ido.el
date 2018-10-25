;; ;; Interactively Do Things
;; (require 'ido)
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (setq ido-create-new-buffer 'always)
;; (setq ido-file-extensions-order '(".org" ".rb" ".py" ".emacs" ".el"))

;; (setq ido-create-new-buffer 'always)
;; ;;(setq ido-ignore-extensions t)

;; ;; Enable ido ubiquitous mode
;; ;; (ido-ubiquitous-mode t)

;; ;; Enable ido-vertical-mode
;; (ido-vertical-mode +1)

;; ;; Use ~ to jump to home directly or emacs init directory in ido-find-file
;; (add-hook 'ido-setup-hook
;;           (lambda ()
;;             ;; Go straight home
;;             (dolist (map (list ido-file-completion-map ido-file-dir-completion-map))
;;               (define-key map (kbd "~") (lambda ()
;;                                           (interactive)
;;                                           (if (looking-back "~/")
;;                                               (insert ".emacs.d/")
;;                                             (if (looking-back "/")
;;                                                 (insert "~/")
;;                                               (call-interactively 'self-insert-command))))))))

;; ;; Use ido for completion in org-mode
;; (setq org-completion-use-ido t)

;; ;; (defun ido-my-keys()
;; ;;   ;; keys used in file and dir environment
;; ;;   (when (memq ido-cur-item '(file dir))
;; ;;     ;; (define-key ido-mode-map  "C-w" 'ido-delete-backward-updir)
;; ;;     (define-key ido-mode-map (kbd "C-w") 'ido-delete-backward-updir)
;; ;;     ))

;; ;; Custom bindings

;; ;; (add-hook 'ido-define-mode-map-hook 'ido-my-keys)

;; (add-hook 'ido-setup-hook #'guto-ido-keys)

;; (defun guto-ido-keys ()
;;   "Set up the keymap for `ido'."

;;   ;; common keys
;;   (define-key ido-completion-map "\C-e" 'ido-edit-input)
;;   (define-key ido-completion-map "\t" 'ido-complete) ;; complete partial
;;   (define-key ido-completion-map "\C-j" 'ido-select-text)
;;   (define-key ido-completion-map "\C-m" 'ido-exit-minibuffer)
;;   (define-key ido-completion-map "?" 'ido-completion-help) ;; list completions
;;   (define-key ido-completion-map [(control ? )] 'ido-restrict-to-matches)
;;   (define-key ido-completion-map [(control ?@)] 'ido-restrict-to-matches)

;;   ;; cycle through matches
;;   (define-key ido-completion-map "\C-r" 'ido-prev-match)
;;   (define-key ido-completion-map "\C-s" 'ido-next-match)
;;   (define-key ido-completion-map [right] 'ido-next-match)
;;   (define-key ido-completion-map [left] 'ido-prev-match)

;;   ;; toggles
;;   (define-key ido-completion-map "\C-t" 'ido-toggle-regexp) ;; same as in isearch
;;   (define-key ido-completion-map "\C-p" 'ido-toggle-prefix)
;;   (define-key ido-completion-map "\C-c" 'ido-toggle-case)
;;   (define-key ido-completion-map "\C-a" 'ido-toggle-ignore)

;;   ;; keys used in file and dir environment
;;   (when (memq ido-cur-item '(file dir))
;;     (define-key ido-completion-map "\C-b" 'ido-enter-switch-buffer)
;;     (define-key ido-completion-map "\C-d" 'ido-enter-dired)
;;     (define-key ido-completion-map "\C-f" 'ido-fallback-command)

;;     ;; cycle among directories
;;     ;; use [left] and [right] for matching files
;;     (define-key ido-completion-map [down] 'ido-next-match-dir)
;;     (define-key ido-completion-map [up]   'ido-prev-match-dir)

;;     ;; backspace functions
;;     (define-key ido-completion-map [backspace] 'ido-delete-backward-updir)
;;     (define-key ido-completion-map "\C-w" 'ido-delete-backward-updir)
;;     (define-key ido-completion-map "\d"        'ido-delete-backward-updir)
;;     (define-key ido-completion-map [(meta backspace)] 'ido-delete-backward-word-updir)
;;     (define-key ido-completion-map [(control backspace)] 'ido-up-directory)

;;     ;; I can't understand this
;;     (define-key ido-completion-map [(meta ?d)] 'ido-wide-find-dir)
;;     (define-key ido-completion-map [(meta ?f)] 'ido-wide-find-file)
;;     (define-key ido-completion-map [(meta ?k)] 'ido-forget-work-directory)
;;     (define-key ido-completion-map [(meta ?m)] 'ido-make-directory)

;;     (define-key ido-completion-map [(meta down)] 'ido-next-work-directory)
;;     (define-key ido-completion-map [(meta up)] 'ido-prev-work-directory)
;;     (define-key ido-completion-map [(meta left)] 'ido-prev-work-file)
;;     (define-key ido-completion-map [(meta right)] 'ido-next-work-file)

;;     ;; search in the directories
;;     ;; use C-_ to undo this
;;     (define-key ido-completion-map [(meta ?s)] 'ido-merge-work-directories)
;;     (define-key ido-completion-map [(control ?\_)] 'ido-undo-merge-work-directory)
;;     )

;;   (when (eq ido-cur-item 'file)
;;     (define-key ido-completion-map "\C-k" 'ido-delete-file-at-head)
;;     (define-key ido-completion-map "\C-l" 'ido-toggle-literal)
;;     (define-key ido-completion-map "\C-o" 'ido-copy-current-word)
;;     (define-key ido-completion-map "\C-v" 'ido-toggle-vc)
;;     (define-key ido-completion-map "\C-w" 'ido-copy-current-file-name)
;;     )

;;   (when (eq ido-cur-item 'buffer)
;;     (define-key ido-completion-map "\C-b" 'ido-fallback-command)
;;     (define-key ido-completion-map "\C-f" 'ido-enter-find-file)
;;     (define-key ido-completion-map "\C-k" 'ido-kill-buffer-at-head)
;;     ))

;; ;; Allows persistence of buffer names
;; (setq ido-use-virtual-buffers 1)

;; (use-package ido-completing-read+)

;; (ido-mode t)
