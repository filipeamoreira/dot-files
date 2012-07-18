;; Using marmalade to install old slime version
;; (add-to-list 'package-archives
;;              '("marmalade" .
;;                "http://marmalade-repo.org/packages/"))
;; (package-initialize)

;; Default packages
(defvar guto-default-packages
  '(switch-window ace-jump-mode auto-complete autopair clojure-mode coffee-mode
                  full-ack go-mode haml-mode org prelude-c prelude-clojure
                  prelude-coffee prelude-css prelude-js prelude-ruby prelude-python
                  prelude-scheme prelude-scss rinari ruby-end ruby-interpolation
                  ruby-tools sass-mode smart-tab undo-tree))

(defun guto-install-packages ()
  (message "%s" "Installing default packages")
  (dolist (p guto-default-packages)
    (unless (package-installed-p p)
      (package-install p))))

(guto-install-packages)
