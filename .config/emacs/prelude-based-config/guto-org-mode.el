;; (use-package org-mode
;;   :config
;;   ;; org-mode modules
;;   (setq org-modules '(org-bbdb
;;                       org-gnus
;;                       org-info
;;                       org-jsinfo
;;                       org-habit
;;                       org-irc
;;                       org-mouse
;;                       org-annotate-file
;;                       org-eval
;;                       org-expiry
;;                       org-interactive-query
;;                       org-man
;;                       org-panel
;;                       org-screen
;;                       org-toc))
;;   ;; ido style completion
;;   (setq org-completion-use-ido t)

;;   :bind (("C-c c" . org-capture)
;;          ("C-c a" . org-agenda))
;;   )

;; bindings
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)
;; (global-set-key (kbd "C-c L") 'org-insert-link-global)
;; (global-set-key (kbd "C-c O") 'org-open-at-point-global)
;; (require 'org)
;; (define-key org-mode-map (kbd "C-c v") 'org-show-todo-tree)
;; (define-key org-mode-map (kbd "C-c C-r") 'org-refile)
;; (define-key org-mode-map (kbd "C-c R") 'org-reveal)

(setq org-directory "~/Dropbox/sync/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
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

;; Enable syntax highlighting on code blocks
(setq org-src-fontify-natively t)

(setq font-lock-add-keywords nil)
(setq font-lock-maximum-decoration nil)

;; Shows everything pretty on-screen
(setq org-startup-indented nil)

;; Allow use of alphabetical characters as bullets
(setq org-list-allow-alphabetical t)

;; Set mode of other extensions to org-mode
;;(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\TODO\\'" . org-mode))

;; Write the thesis in org-mode

;; My custom LaTeX class for Org-mode export. require is needed for it to work.
;;(require 'org-latex)
;;(require 'ox-bibtex)

(setq org-latex-to-pdf-process (list "latexmk %f"))

;;(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))

(add-hook 'org-mode-hook 'wc-mode)

(add-to-list 'org-latex-classes
             '("org-article"
               "\\documentclass[a4paper,12pt]{article}

\\usepackage[utf8]{inputenc}
\\usepackage{lmodern}
\\usepackage[T1]{fontenc}

\\usepackage{fixltx2e}

\\newcommand\\foo{bar}
               [NO-DEFAULT-PACKAGES]
               [NO-PACKAGES]
               [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; TODO: Merge configuration into use-package format
(use-package org
  :config
  (require 'ox-md nil t)
  (setq org-hierarchical-todo-statistics nil)
  (setq org-checkbox-hierarchical-statistics nil)
  (setq org-export-dispatch-use-expert-ui t)
  org-babel-load-languages '((xxx . t)
                             (ledger . t)
                             ...
                             (yyy . t)))
