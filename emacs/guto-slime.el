;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;; (setq inferior-lisp-program "/usr/local/bin/sbcl")
;; (require 'slime)
;; (slime-setup)

;; syntax highlighting on slime repl
(add-hook 'slime-repl-mode-hook
          (defun clojure-mode-slime-font-lock ()
            (require 'clojure-mode)
            (let (font-lock-mode)
              (clojure-mode-font-lock-setup))))
