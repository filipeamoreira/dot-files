;; sample use of emacs abbreviation feature

(define-abbrev-table
  'global-abbrev-table '(
                         ;; emacs regex
                         ("8d" "\\([0-9]+?\\)")
                         ("8str" "\\([^\"]+?\\)\"")
                         ;; shell commands
                         ("8ditto" "ditto -ck --sequesterRsrc --keepParent src dest")
                         ("8im" "convert -quality 85% ")
                         ))

;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

(setq abbrev-file-name             ;; tell emacs where to read abbrev
      "~/.emacs.d/personal/abbrev_defs")

;; turn on abbrev mode globally
(setq-default abbrev-mode t)
