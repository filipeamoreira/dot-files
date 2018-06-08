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
(require 'reftex)
(setq reftex-plug-into-AUCTeX t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

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
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
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
           '(
             (?a . "\\autocite[]{%l}")
             (?c . "\\cite[]{%l}")
             (?f . "\\footcite[][]{%l}")
             (?t . "\\textcite[]{%l}")
             (?p . "\\parencite[]{%l}")
             (?o . "\\citepr[]{%l}")
             (?n . "\\nocite{%l}")))))

;; Bible reference using
(defun guto-insert-bibleref (reference)
  "Insert Bible chapter and verse numbers"
  (interactive "sBible reference:")
  (insert (format "\\pbibleverse{\%s}" reference)))


;; Query for master file.
(setq-default TeX-master nil)


(global-set-key (kbd "C-c l") nil)

(defun guto-latex-mode-bindings ()
  "Modify keymaps used by LaTeX mode."
  (global-set-key (kbd "C-c l f") 'guto-insert-ltr-footnote)
  (global-set-key (kbd "C-c l l") 'guto-insert-ltr-mark)
  (global-set-key (kbd "C-c l b") 'guto-insert-bibleref))

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

;; Pick which latex font configuration to use

(require 'ox-latex)
(setq org-latex-listings t)

;; ;; Originally taken from Bruno Tavernier: http://thread.gmane.org/gmane.emacs.orgmode/31150/focus=31432
;; ;; but adapted to use latexmk 4.20 or higher.
;; (defun guto-auto-tex-cmd ()
;;   "When exporting from .org with latex, automatically run latex,
;;      pdflatex, or xelatex as appropriate, using latexmk."
;;   (let ((texcmd)))
;;   ;; default command: oldstyle latex via dvi
;;   (setq texcmd "latexmk -dvi -pdfps -quiet %f")
;;   ;; pdflatex -> .pdf
;;   (if (string-match "LATEX_CMD: pdflatex" (buffer-string))
;;       (setq texcmd "latexmk -pdf -quiet %f"))
;;   ;; xelatex -> .pdf
;;   (if (string-match "LATEX_CMD: xelatex" (buffer-string))
;;       (setq texcmd "latexmk -pdflatex=xelatex -pdf -quiet %f"))
;;   ;; LaTeX compilation command
;;   (setq org-latex-to-pdf-process (list texcmd)))

;; (add-hook 'org-export-latex-after-initial-vars-hook 'guto-auto-tex-cmd)

;; ;; Specify default packages to be included in every tex file, whether pdflatex or xelatex
;; (setq org-latex-packages-alist
;;       '(("" "graphicx" t)
;;             ("" "longtable" nil)
;;             ("" "float" nil)))

;; (defun guto-auto-tex-parameters ()
;;       "Automatically select the tex packages to include."
;;       ;; default packages for ordinary latex or pdflatex export
;;       (setq org-latex-default-packages-alist
;;             '(("AUTO" "inputenc" t)
;;               ("T1"   "fontenc"   t)
;;               (""     "fixltx2e"  nil)
;;               (""     "wrapfig"   nil)
;;               (""     "soul"      t)
;;               (""     "textcomp"  t)
;;               (""     "marvosym"  t)
;;               (""     "wasysym"   t)
;;               (""     "latexsym"  t)
;;               (""     "amssymb"   t)
;;               (""     "hyperref"  nil)))

;;       ;; Packages to include when xelatex is used
;;       (if (string-match "LATEX_CMD: xelatex" (buffer-string))
;;           (setq org-latex-default-packages-alist
;;                 '(("" "fontspec" t)
;;                   ("" "xunicode" t)
;;                   ("" "url" t)
;;                   ("" "rotating" t)
;;                   ("american" "babel" t)
;;                   ("babel" "csquotes" t)
;;                   ("" "soul" t)
;;                   ("xetex" "hyperref" nil)
;;                   )))

;;       (if (string-match "LATEX_CMD: xelatex" (buffer-string))
;;           (setq org-latex-classes
;;                 (cons '("article"
;;                         "\\documentclass[11pt,article,oneside]{memoir}"
;;                         ("\\section{%s}" . "\\section*{%s}")
;;                         ("\\subsection{%s}" . "\\subsection*{%s}")
;;                         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                         ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
;;                       org-latex-classes))))

;; ;; (latex :variables
;; ;;        latex-build-command "LatexMk"
;; ;;        latex-enable-auto-fill t)

;; ;; Default packages included in every tex file, pdflatex or xelatex
;; (setq org-latex-packages-alist
;;       '(("" "graphicx" t)
;;         ("" "longtable" nil)
;;         ("" "float" nil)))

;; ;; source: https://lists.gnu.org/archive/html/emacs-orgmode/2013-06/msg00240.html
;; (defun guto-auto-tex-cmd (backend)
;;   "When exporting from .org with latex,
;;   automatically run latex, pdflatex, or xelatex as appropriate,
;;   using latexmk."
;;   (let ((texcmd))
;;     (setq texcmd "latexmk -pdf %f")
;;     (if (string-match "LATEX_CMD: pdflatex" (buffer-string))
;;         (progn
;;           (setq texcmd "latexmk -pdf -pdflatex='pdflatex -file-line-error --shell-escape -synctex=1' %f")
;;           (setq org-latex-default-packages-alist
;;                 '(("AUTO" "inputenc" t)
;;                   ("T1"   "fontenc"   t)
;;                   (""     "fixltx2e"  nil)
;;                   (""     "wrapfig"   nil)
;;                   (""     "soul"      t)
;;                   (""     "textcomp"  t)
;;                   (""     "marvosym"  t)
;;                   (""     "wasysym"   t)
;;                   (""     "latexsym"  t)
;;                   (""     "amssymb"   t)
;;                   (""     "hyperref"  nil)))))
;;     (if (string-match "LATEX_CMD: xelatex" (buffer-string))
;;         (progn
;;           (setq texcmd "latexmk -pdflatex='xelatex -file-line-error --shell-escape -synctex=1' -pdf %f")
;;           (setq org-latex-default-packages-alist
;;                 '(("" "fontspec" t)
;;                   ("" "xunicode" t)
;;                   ("" "url" t)
;;                   ;; ("" "rotating" t)
;;                   ;; ("" "memoir-article-styles" t)
;;                   ;; ("american" "babel" t)
;;                   ;; ("babel" "csquotes" t)
;;                   ;; ("" "listings" nil)
;;                   ("svgnames" "xcolor" t)
;;                   ("" "soul" t)
;;                   ("xetex, colorlinks=true, urlcolor=FireBrick, plainpages=false, pdfpagelabels, bookmarksnumbered" "hyperref" nil)
;;                   ))
;;           (setq org-latex-classes
;;                 (cons '("memarticle"
;;                         "\\documentclass[11pt,oneside,article]{memoir}"
;;                         ("\\section{%s}" . "\\section*{%s}")
;;                         ("\\subsection{%s}" . "\\subsection*{%s}")
;;                         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                         ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
;;                       org-latex-classes))))

;;     (setq org-latex-pdf-process (list texcmd))))
;; (add-hook 'org-export-before-parsing-hook 'guto-auto-tex-cmd)


;; (add-hook 'org-export-latex-after-initial-vars-hook 'guto-auto-tex-parameters)


(defun guto-insert-footnote ()
  "Insert \\footnote{} in the text"
  (interactive "*")
  (TeX-insert-macro "footnote"))

(add-hook 'Tex-latex-mode
          (lambda()
            (local-unset-key (kbd "C-c f"))))

;;(eval-after-load "TeX-latex-mode"
  ;;(unbind-key "C-c f" prelude-mode-map))

(eval-after-load "TeX-latex-mode"
  '(define-key prelude-mode-map (kbd "C-c f") 'guto-insert-footnote))

;;(eval-after-load "TeX-latex-mode"
  ;;(unbind-key "C-c f" prelude-mode-map))

;; helm-bibtex configuration
(autoload 'helm-bibtex "helm-bibtex" "" t)
;; Bibliography files
(setq bibtex-completion-bibliography
      '("~/Documents/school/master-theology-newbold/modules/dissertation/biblio.bib"))

;; So that RefTeX finds my bibliography
(setq reftex-default-bibliography '("~/Documents/school/master-theology-newbold/modules/dissertation/biblio.bib"))

(setq bibtex-completion-notes-path "~/Dropbox/sync/notes/bibliography")

(auto-fill-mode t) ;;

(add-hook 'latex-mode-hook 'wc-mode)
