;; Loads extra repositories to emacs 24 package
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives 
			 '("tromey" . "http://tromey.com/elpa/") t)

(package-initialize)

;; Adding vendor/themes to themes path
(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/themes/")

;; Loading default theme
(load-theme 'zenburn t)
;;(load-theme 'solarized-dark t)

