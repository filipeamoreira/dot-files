(setq package-user-dir
      (concat
       default-directory
       "elpa"))
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


;; Using marmalade to install old slime version
;; (add-to-list 'package-archives
;;              '("marmalade" .
;;                "http://marmalade-repo.org/packages/"))
;; (package-initialize)

;; Default packages
(defvar guto-default-packages
  '(switch-window ace-jump-mode auto-complete autopair paredit clojure-mode coffee-mode
                  full-ack go-mode haml-mode org prelude-c prelude-clojure
                  prelude-coffee prelude-css prelude-js prelude-ruby prelude-python
                  prelude-scheme prelude-scss rinari ruby-end ruby-interpolation
                  sass-mode smart-tab undo-tree))

(defun guto-install-packages ()
  (message "%s" "Installing default packages")
  (dolist (p guto-default-packages)
    (unless (package-installed-p p)
      (package-install p))))

(guto-install-packages)
