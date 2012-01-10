;; Lifted from emacs-prelude

;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

; TODO fix ruby-end and package ruby-block for marmalade

(require 'ruby-end)
(require 'ruby-block)

(defun prelude-ruby-mode-hook ()
  (inf-ruby-keys)
  ;; turn off the annoying input echo in irb
  (setq comint-process-echoes t)
  (ruby-block-mode t)
  (local-set-key (kbd "C-h r") 'yari))

(add-hook 'ruby-mode-hook 'prelude-ruby-mode-hook)

;; (require 'haml-mode)
;; (require 'scss-mode)

(defun prelude-scss-mode-hook ()
  ;; indent like in Ruby
  (setq css-indent-offset 2)
  ;; turn off annoying auto-compile on save
  (setq scss-compile-at-save nil))

(add-hook 'scss-mode-hook 'prelude-scss-mode-hook)

;; cucumber support
;; (require 'feature-mode)
;; (add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; load bundle snippets
;;(yas/load-directory  (concat prelude-vendor-dir "feature-mode/snippets"))


