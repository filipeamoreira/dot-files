;; Adding new repo
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives 
			 '("tromey" . "http://tromey.com/elpa/") t)
			 
(package-initialize)

;; Default packages to be installed
(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-ruby starter-kit-js
                        starter-kit-eshell ssh-config-mode textmate windresize ruby-mode
			clojure-mode clojure-test-mode markdown-mode yaml-mode
			magit idle-require coffee-mode gist haml-mode magithub
                        rainbow-mode windsize dart-mode dired+ ace-jump-mode
                        dired-details dired-details+ dired-single elixir-mode
                        feature-mode flymake flymake-coffee flymake-css flymake-haml
                        flymake-jshint flymake-ruby go-mode google-translate hexrgb
                        json keyfreq keywiz lua-mode nginx-mode org org-magit
                        org-table-comment php-mode quack rainbow-delimiters redo+
                        rinari rspec-mode ruby-block ruby-end ruby-test-mode
                        sass-mode undo-tree)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("edb0e9dce76acf08243762d30683293812c838773f0e9f41b7e6baf904776d6c" "40eba70ee07212464f2c979fffbaea7d05720aefc4f5795276dc69f83c257469" "54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" default)))
 '(global-linum-mode t)
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
