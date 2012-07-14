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

;; shortcuts
;; (global-set-key (kbd "C-c r") 'org-capture)
;; (global-set-key (kbd "C-c a") 'org-agenda)
;; (global-set-key (kbd "C-c l") 'org-store-link)
;; (global-set-key (kbd "C-c L") 'org-insert-link-global)
;; (global-set-key (kbd "C-c O") 'org-open-at-point-global)
;; (require 'org)
;; (define-key org-mode-map (kbd "C-c v") 'org-show-todo-tree)
;; (define-key org-mode-map (kbd "C-c C-r") 'org-refile)
;; (define-key org-mode-map (kbd "C-c R") 'org-reveal)

(setq org-directory "~/org")
(setq org-default-notes-file "~/org/notes.org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/MobileOrg")
