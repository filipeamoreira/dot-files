;; https://simao.io/blog/2013/12/19/emacs-and-rbenv

(setenv "PATH"
        (concat "/usr/local/var/rbenv/shims:"
                "/usr/local/var/rbenv/bin:" (getenv "PATH")))
(setq exec-path
      (cons (concat "/usr/local/var/rbenv/shims")
            (cons (concat "/usr/local/var/rbenv/bin") exec-path)))

(global-rbenv-mode)
