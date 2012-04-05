;; Loading extra themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/guto/themes")
(load-theme 'zenburn t)

;; Loading path
(add-to-list 'load-path "~/.emacs.d/guto/")

;; Gmail setup
(setq user-full-name "Filipe Moreira")
(setq user-mail-address "famoreira@gmail.com")

(require 'smtpmail)
(require 'starttls)
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials (expand-file-name "~/.authinfo")
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

;; Emacs custom setings go to separate file
(setq custom-file "~/.emacs.d/guto/custom.el")
(load custom-file 'noerror)

;; Load my own settings
;;(require 'guto/bindings)
;; (load "guto/helper")
;; (require 'guto/misc)

(require 'simplenote)
(setq simplenote-email "famoreira@gmail.com")
(setq simplenote-password "mgnt6wgSLezq5MQi")
(simplenote-setup)
