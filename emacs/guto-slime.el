;; (add-to-list 'load-path "~/scm/git/slime/")  ; your SLIME directory
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(setq common-lisp-hyperspec-root "file://Users/guto/.emacs.d/personal/vendor/HyperSpec/")
(require 'slime)
(slime-setup)

;; syntax highlighting on slime repl
(add-hook 'slime-repl-mode-hook
          (defun clojure-mode-slime-font-lock ()
            (require 'clojure-mode)
            (let (font-lock-mode)
              (clojure-mode-font-lock-setup))))
