(add-hook 'LaTeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))
(add-hook 'TeX-mode-hook
          (lambda () (TeX-fold-mode 1)))
;; (C-c C-o C-b) to hide all foldable elements on the buffer
;;(add-hook 'find-file-hook 'TeX-fold-buffer t)

;; http://tex.stackexchange.com/questions/226097/best-way-to-use-multi-lingual-quotes-using-csquotes-package-in-auctex-emacs
;;(font-lock-add-keywords 'latex-mode (list (list "\\(«\\(.+?\\|\n\\)\\)\\(+?\\)\\(»\\)" '(1 'font-latex-string-face t) '(2 'font-latex-string-face t) '(3 'font-latex-string-face t))))

;; AUCTeX commands
;; C-c C-e - insert environments
;; C-c C-m - insert macros
;; C-c C-c - run commands
;; M-TAB - TeX-complete-symbol

;; http://tex.stackexchange.com/questions/36876/reftex-doesnt-turn-on-automatically-when-loading-auctex-after-upgrade-to-tex-li
;; Start RefTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (reftex-mode t)
            (flyspell-mode t)
            ))

;; pdf-tools

;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
          #'TeX-revert-document-buffer)


;; (setq TeX-view-program-selection
;;       '(((output-dvi style-pstricks) "dvips and gv")
;;         (output-dvi "xdvi")
;;         (output-pdf "PDF Tools")
;;         (output-html-open "xdg-open")))

;; From here: http://www.stefanom.org/setting-up-a-nice-auctex-environment-on-mac-os-x/
;; Sync LaTeX source with Skim
;; AucTeX
(setq TeX-parse-self t) ; Enable parse on load.
(setq TeX-auto-save t) ; Enable parse on save.
(setq-default TeX-master nil) ; Query for master file.
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -xelatex %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;; Custom functions

(defun guto-insert-ltr-footnote ()
  (interactive)
  (insert-char ?\u200e)
  (insert "\\LTRfootnote{}")
  (insert-char ?\u200e)
  (backward-char 2))

(defun guto-insert-ltr-mark ()
  "Insert LEFT-TO-RIGHT MARK into the buffer."
  (interactive)
  (insert-char ?\u200e))

(defun guto-TeX-doc ()
  "Search documentation with texdoc for symbol at point."
  (interactive)
  (call-process "texdoc" nil 0 nil "--view" (thing-at-point 'symbol)))

;; bind it to C-c ? if you want to replace standard TeX-doc
;; (eval-after-load "tex"
;;   '(progn
;;      (define-key TeX-mode-map (kbd "C-c ?") 'mg-TeX-doc)))

;; Add Biblatex shortcuts to RefTeX
(eval-after-load 'reftex-vars
  '(progn
     ;; (also some other reftex-related customizations)
     (setq reftex-cite-format
           '((?c . "\\cite[]{%l}")
             (?f . "\\footcite[][]{%l}")
             (?t . "\\textcite[]{%l}")
             (?p . "\\parencite[]{%l}")
             (?o . "\\citepr[]{%l}")
             (?n . "\\nocite{%l}")))))

;; Bible reference using
(defun guto-insert-bibleref (book chapter verse)
  "Insert Bible chapter and verse numbers"
  (interactive "sBook:
sChapter:
sVerse: ")
  (insert (format "\\bibleverse{\%s}(\%s:%s)" book chapter verse)))

;; So that RefTeX finds my bibliography
(setq reftex-default-bibliography '("/Users/guto/Documents/ba-dissertation/dissertation.bib"))

;; Query for master file.
(setq-default TeX-master nil)


(defun guto-latex-mode-bindings ()
  "Modify keymaps used by LaTeX mode."
  (local-set-key (kbd "C-c l f") 'guto-insert-ltr-footnote)
  (local-set-key (kbd "C-c l l") 'guto-insert-ltr-mark)
  (local-set-key (kbd "C-c l b") 'guto-insert-bibleref))

;; add to hook
(add-hook 'LaTeX-mode-hook 'guto-latex-mode-bindings)


;; From here: http://tex.stackexchange.com/questions/50827/a-simpletons-guide-to-tex-workflow-with-emacs
;; Fontification (remove unnecessary entries as you notice them) http://lists.gnu.org/archive/html/emacs-orgmode/2009-05/msg00236.html http://www.gnu.org/software/auctex/manual/auctex/Fontification-of-macros.html
(setq font-latex-match-reference-keywords
      '(
        ;; biblatex
        ("printbibliography" "[{")
        ("addbibresource" "[{")
        ;; Standard commands
        ;; ("cite" "[{")
        ("Cite" "[{")
        ("parencite" "[{")
        ("Parencite" "[{")
        ("footcite" "[{")
        ("footcitetext" "[{")
        ;; ;; Style-specific commands
        ("textcite" "[{")
        ("Textcite" "[{")
        ("smartcite" "[{")
        ("Smartcite" "[{")
        ("cite*" "[{")
        ("parencite*" "[{")
        ("supercite" "[{")
        ; Qualified citation lists
        ("cites" "[{")
        ("Cites" "[{")
        ("parencites" "[{")
        ("Parencites" "[{")
        ("footcites" "[{")
        ("footcitetexts" "[{")
        ("smartcites" "[{")
        ("Smartcites" "[{")
        ("textcites" "[{")
        ("Textcites" "[{")
        ("supercites" "[{")
        ;; Style-independent commands
        ("autocite" "[{")
        ("Autocite" "[{")
        ("autocite*" "[{")
        ("Autocite*" "[{")
        ("autocites" "[{")
        ("Autocites" "[{")
        ;; Text commands
        ("citeauthor" "[{")
        ("Citeauthor" "[{")
        ("citetitle" "[{")
        ("citetitle*" "[{")
        ("citeyear" "[{")
        ("citedate" "[{")
        ("citeurl" "[{")
        ;; Special commands
        ("fullcite" "[{")))

(setq font-latex-match-textual-keywords
      '(
        ;; biblatex brackets
        ("parentext" "{")
        ("brackettext" "{")
        ("hybridblockquote" "[{")
        ;; Auxiliary Commands
        ("textelp" "{")
        ("textelp*" "{")
        ("textins" "{")
        ("textins*" "{")
        ;; supcaption
        ("subcaption" "[{")))

(setq font-latex-match-variable-keywords
      '(
        ;; amsmath
        ("numberwithin" "{")
        ;; enumitem
        ("setlist" "[{")
        ("setlist*" "[{")
        ("newlist" "{")
        ("renewlist" "{")
        ("setlistdepth" "{")
        ("restartlist" "{")))
