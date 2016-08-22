;;; guto-ruby.el --- Emacs Prelude: A nice setup for Ruby (and Rails) devs.
;;
;; Copyright © 2011-2016 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; Modified: Filipe Moreira <famoreira@gmail.com>
;; URL: https://github.com/filipeamoreira/prelude
;; Version: 1.0.0
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Some basic configuration for Ruby and Rails development.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'prelude-programming)

(prelude-require-packages '(enh-ruby-mode inf-ruby yari projectile-rails))

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)

;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rb\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.cap\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rabl\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Podfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.podspec\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile\\'" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Appraisals\\'" . enh-ruby-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

(define-key 'help-command (kbd "R") 'yari)

;; For Ruby files, enable projectile and projectile-rails
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(add-hook 'enh-ruby-mode-hook 'global-rbenv-mode)
(add-hook 'enh-ruby-mode-hook 'rbenv-use-corresponding)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'yard-mode)

;; Prevent ruby-mode from adding magic encoding comments to the top of files
(setq ruby-insert-encoding-magic-comment nil)

;; ;; Use enhance ruby mode
;; (require 'seeing-is-believing)
;; (add-hook 'enh-ruby-mode-hook 'seeing-is-believing)

(eval-after-load 'enh-ruby-mode
  '(progn
     (defun prelude-ruby-mode-defaults ()
       (inf-ruby-minor-mode +1)
       ;;(ruby-tools-mode +1)
       ;; CamelCase aware editing operations
       (subword-mode +1)
       (global-unset-key "\C-c /")
       (define-key global-map (kbd "\C-c /)") nil)
       (global-set-key "\C-c /" 'comment-or-uncomment-region-or-line)
       (electric-pair-mode -1));; This is creating issues with single and double quotes

     (setq prelude-ruby-mode-hook 'prelude-ruby-mode-defaults)

     (add-hook 'ruby-mode-hook (lambda ()
                                 (run-hooks 'prelude-ruby-mode-hook)))))

(defvar enh-ruby-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "{"             'enh-ruby-electric-brace)
    (define-key map "}"             'enh-ruby-electric-brace)
    (define-key map (kbd "M-C-a")   'enh-ruby-beginning-of-defun)
    (define-key map (kbd "M-C-e")   'enh-ruby-end-of-defun)
    (define-key map (kbd "M-C-b")   'enh-ruby-backward-sexp)
    (define-key map (kbd "M-C-f")   'enh-ruby-forward-sexp)
    (define-key map (kbd "M-C-p")   'enh-ruby-beginning-of-block)
    (define-key map (kbd "M-C-n")   'enh-ruby-end-of-block)
    (define-key map (kbd "M-C-h")   'enh-ruby-mark-defun)
    (define-key map (kbd "M-C-q")   'enh-ruby-indent-exp)
    (define-key map (kbd "C-c C-e") 'enh-ruby-find-error)
    (define-key map (kbd "C-c C-f") 'enh-ruby-insert-end)
    ;;(define-key map (kbd "C-c /")   'enh-ruby-insert-end)
    (define-key map (kbd "M-C-u")   'enh-ruby-up-sexp)
    (define-key map (kbd "C-j")     'reindent-then-newline-and-indent)
    map)
  "Syntax table in use in enh-ruby-mode buffers.")


(provide 'guto-ruby)
;;; guto-ruby.el ends here
