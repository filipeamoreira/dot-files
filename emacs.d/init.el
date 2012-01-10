;; Loads extra repositories to emacs 24 package
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)

(package-initialize)

;; Install starter-kit and others packages if they are not installed
(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-js starter-kit-lisp
                                  starter-kit-eshell starter-kit-ruby rinari windsize yasnippet
                                  ruby-block ruby-electric ruby-end rvm rspec-mode javascript
                                  js2-mode sass-mode mode-compile flymake flymake-coffee flymake-css
                                  flymake-cursor flymake-jshint flymake-jslint flymake-php flymake-ruby
                                  flymake-sass flymake-shell ace-jump-mode autopair auto-indent-mode
                                  coffee-mode multi-term haml-mode scss-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Installing/Loading el-get

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
                (lambda (s)
                  (let (el-get-master-branch)
                    (end-of-buffer) (eval-print-last-sexp)))) )

(require 'el-get)

;; Sets default packages to be installed

(setq el-get-sources
      '((:name css-mode
               :type elpa)
        (:name expresso-mode
               :type http
               :url "http://download-mirror.savannah.gnu.org/releases/espresso/espresso.el")
        (:name autopair
               :after (lambda ()
                        (autopair-global-mode t)
                        (setq autopair-autowrap t)))))
(el-get 'sync)

;; Adding vendor/themes to themes path
(add-to-list 'custom-theme-load-path "~/.emacs.d/vendor/themes/")

;; Loading default theme
(load-theme 'zenburn t)
;;(load-theme 'solarized-dark t)

