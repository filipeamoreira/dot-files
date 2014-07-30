;; org-mode modules
(setq org-modules '(org-bbdb
                    org-gnus
                    org-info
                    org-jsinfo
                    org-habit
                    org-irc
                    org-mouse
                    org-annotate-file
                    org-eval
                    org-expiry
                    org-interactive-query
                    org-man
                    org-panel
                    org-screen
                    org-toc))

;; ido style completion
(setq org-completion-use-ido t)

;; bindings
(global-set-key (kbd "C-c c") 'org-capture)
;; (global-set-key (kbd "C-c a") 'org-agenda)
;; (global-set-key (kbd "C-c l") 'org-store-link)
;; (global-set-key (kbd "C-c L") 'org-insert-link-global)
;; (global-set-key (kbd "C-c O") 'org-open-at-point-global)
;; (require 'org)
;; (define-key org-mode-map (kbd "C-c v") 'org-show-todo-tree)
;; (define-key org-mode-map (kbd "C-c C-r") 'org-refile)
;; (define-key org-mode-map (kbd "C-c R") 'org-reveal)

(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-default-notes-file "~/org/notes.org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
;; org-mode variables
;; Hide the (nth - 1) star
(setq org-hide-leading-stars t)
;; Default to overview mode
(setq org-startup-folded t)
;; Align tables on file visit
(setq org-startup-align-all-tables t)
;; Add timestamp to TODO completion
(setq org-log-done t)
;; TODO states
(setq org-todo-keywords
      '((sequence "TODO(t!)" "STARTED(s!)" "WAITING(w!)" "DONE(d!)" "|" "CANCELLED(c!) DEFERRED(f!)")))
;; Fast selection of TODO states
(setq org-use-fast-todo-selection t)

;; Clock mode

;; bindings
;; C-c C-x C-i     (org-clock-in)
;; C-c C-x C-o     (org-clock-out)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Pomodoro/countdown timer
;; C-c C-x ; (org-timer-set-timer)
;; C-x n s org-narrow-to-subtree
;; C-x n b org-narrow-to-block
;; C-x n w widen

(setq org-todo-keyword-faces
      '(
        ("TODO"  . (:foreground "firebrick2" :weight bold))
        ("WAITING"  . (:foreground "olivedrab" :weight bold))
        ("LATER"  . (:foreground "sienna" :weight bold))
        ("PROJECT"  . (:foreground "steelblue" :weight bold))
        ("DONE"  . (:foreground "forestgreen" :weight bold))
        ("MAYBE"  . (:foreground "dimgrey" :weight bold))
        ("CANCELED"  . shadow)
        ))

;; FIXME Only load on org-mode
;;(setq ispell-dictionary "es")
