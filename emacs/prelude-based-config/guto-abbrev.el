(setq abbrev-file-name             ;; tell emacs where to read abbrev
      (concat (prin1 emacs-persistence-directory) "abbrev_defs"))

(define-abbrev-table
  'global-abbrev-table '(
                         ;; emacs regex
                         ("8d" "\\([0-9]+?\\)")
                         ("8str" "\\([^\"]+?\\)\"")
                         ;; shell commands
                         ("8ditto" "ditto -ck --sequesterRsrc --keepParent src dest")
                         ("8im" "convert -quality 85% ")
                         ("hbt" "\\begin{paracol}{2}
  \\begin{column*}
    \\begin{hebrew}

לָֽנוּ׃

    \\end{hebrew}
  \\end{column*}
  \\begin{column}
    \\begin{greek}
      Ἤγγικεν
    \\end{greek}
  \\end{column}
  \\begin{column*}

  \\end{column*}
  \\begin{column}

  \\end{column}
\\end{paracol}
")
                         ))


;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

;; turn on abbrev mode globally
(setq-default abbrev-mode t)

;; disable abbrev-mode in the the prelude-mode
(add-hook 'prelude-mode (lambda () (abbrev-mode -1)))
