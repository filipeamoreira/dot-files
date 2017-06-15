(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(TeX-command-list
   (quote
    (("Biber" "biber %s.bcf" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %(extraopts) %`%S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t t :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil t :help "Convert DVI file to PostScript")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil t :help "Convert PostScript file to PDF")
     ("Index" "makeindex %s" TeX-run-index nil t :help "Run makeindex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/savefile/bookmarks")
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "f89e21c3aef10d2825f2f079962c2237cd9a45f4dc1958091be8a6f5b69bb70c" default)))
 '(fci-rule-character-color "#202020")
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style (quote chamfer))
 '(org-agenda-files (quote ("~/Dropbox/sync/notes/research.org")))
 '(org-highlight-latex-and-related (quote (latex script entities)))
 '(org-pretty-entities t)
 '(package-selected-packages
   (quote
    (go-mode company dockerfile-mode yaml-mode helm key-chord syntatic-close define-word projectile-rails inf-ruby dracula-theme flycheck-ledger hledger-mode swap-buffers highlight-symbol rainbow-identifiers command-log-mode writegood-mode lua-mode hackernews csv-mode helm-flyspell langtool adaptive-wrap yard-mode helm-mt multi-term golden-ratio-scroll-screen ledger bug-hunter flycheck-typescript-tslint tss tidy persp-mode persp-projectile perspective org-ac org-elisp-help org-pomodoro org-projectile org-trello hlinum feature-mode synosaurus synonymous crux edit-server elfeed-org elfeed sx speed-type sicp-info leerzeichen general-close flycheck-tip direx direx-el comment-dwim-2 centered-cursor-mode enh-ruby-mode aggressive-indent auto-complete ace-jump-mode tldr smooth-scroll icicles zop-to-char yari wc-goal-mode volatile-highlights vkill undo-tree smex smartrep smart-tab scss-mode scala-mode2 ruby-tools ruby-block rinari rbenv rainbow-mode rainbow-delimiters projectile-speedbar projectile-sift projectile-codesearch ov org-pdfview org-journal operate-on-number minitest lorem-ipsum json-mode ido-vertical-mode helm-zhihu-daily helm-xcdoc helm-words helm-wordnet helm-w3m helm-w32-launcher helm-unicode helm-descbinds helm-bibtexkey helm-ag haskell-mode haml-mode guru-mode gscholar-bibtex grizzl gotest god-mode go-projectile gitignore-mode gitconfig-mode git-timemachine gist geiser flycheck-ocaml flx-ido expand-region exec-path-from-shell erlang enclose empos elisp-slime-nav ebib easy-kill discover-my-major discover diminish diff-hl deft company-go company-auctex company-anaconda coffee-mode cider cdlatex bundler browse-kill-ring blank-mode bibtex-utils bibretrieve auto-complete-auctex auctex-lua anzu alchemist ag ace-jump-buffer)))
 '(paradox-automatically-star t)
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(safe-local-variable-values
   (quote
    ((TeX-master . dissertation)
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
