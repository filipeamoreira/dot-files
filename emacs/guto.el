;; (load-theme 'soothe nil)

(set-face-attribute 'default nil :font "Source Code Pro-16")

(toggle-fullscreen)

(server-mode)

;; Confirm emacs closing
(setq confirm-kill-emacs 'y-or-n-p)

;; Enables line numbering in all modes
(global-linum-mode)

;; Disable system bell
(setq visible-bell 1)

;; Replace region with yank
(delete-selection-mode 1)

;; Disable transient mark mode
;; Use C-<SPC> C-<SPC> to temporally activate it.
(setq transient-mark-mode nil)

;; Load auto-revert-tail-mode after opening .log file
(add-to-list 'auto-mode-alist
             '("\\.log\\'" . (lambda ()
                               (auto-revert-tail-mode))))

;; setting for auto-close brackets for electric-pair-mode regardless of current major mode syntax table
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\{ . ?\})
                            (?\' . ?\')
                            (?\[ . ?\])
                            ) )
;; Enabling eletric-pair-mode globally
(add-hook 'text-mode-hook
          (lambda () (set (make-local-variable 'electric-pair-mode) t)))

;; Adjust electric-pair-pairs on lisp modes
(add-hook 'lisp-mode-hook
          (lambda ()
            (setq electric-pair-pairs '(
                                        (?\" . ?\")
                                        (?\{ . ?\})
                                        (?\[ . ?\])
                                        ))))
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq electric-pair-pairs '(
                                        (?\" . ?\")
                                        (?\{ . ?\})
                                        (?\[ . ?\])
                                        ))))
(setq search-highlight t            ;; highlight when searching...
      query-replace-highlight t)    ;; ...and replacing

(add-to-list 'hippie-expand-try-functions-list
             'yas/hippie-try-expand) ;put yasnippet in hippie-expansion list

(setq smart-tab-using-hippie-expand t)
(require 'smart-tab)
(global-smart-tab-mode 1)


(setq scss-compile-at-save nil)


;; Rinari
;; C-c ; f c	rinari-find-controller
;; C-c ; f e	rinari-find-environment
;; C-c ; f f	rinari-find-file-in-project
;; C-c ; f h	rinari-find-helper
;; C-c ; f i	rinari-find-migration
;; C-c ; f j	rinari-find-javascript
;; C-c ; f l	rinari-find-plugin
;; C-c ; f m	rinari-find-model
;; C-c ; f n	rinari-find-configuration
;; C-c ; f o	rinari-find-log
;; C-c ; f p	rinari-find-public
;; C-c ; f s	rinari-find-script
;; C-c ; f t	rinari-find-test
;; C-c ; f v	rinari-find-view
;; C-c ; f w	rinari-find-worker
;; C-c ; f x	rinari-find-fixture
;; C-c ; f y	rinari-find-stylesheet
(require 'rinari)
(global-rinari-mode)


;; Rectangle mark
(require 'guto-rect-mark)
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x")   'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w")   'rm-kill-region)
(global-set-key (kbd "C-x r M-w")   'rm-kill-ring-save)


;; (global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
;; (global-set-key (kbd "C-w")
;;                 '(lambda(b e) (interactive "r")
;;                    (if rm-mark-active
;;                        (rm-kill-region b e) (kill-region b e))))
;; (global-set-key (kbd "M-w")
;;                 '(lambda(b e) (interactive "r")
;;                    (if rm-mark-active
;;                        (rm-kill-ring-save b e) (kill-ring-save b e))))
;; (global-set-key (kbd "C-x C-x")
;;                 '(lambda(&optional p) (interactive "p")
;;                    (if rm-mark-active
;;                        (rm-exchange-point-and-mark p) (exchange-point-and-mark p))))


(setq dired-use-ls-dired nil)

(require 'ruby-end)
(require 'enclose)
(enclose-mode t)


(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

;; Adds vendor to loadpath
(add-to-list 'load-path "~/.emacs.d/personal/vendor/")
(require 'rcodetools)
(define-key ruby-mode-map (kbd "C-c C-c") 'xmp)

(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en_GB.UTF-8")
(prefer-coding-system 'utf-8)

;; Display date and time on status bar
;; (setq display-time-day-and-date t
;;       display-time-24hr-format t)
;; (display-time)

;; nuke whitespaces when writing to a file
(add-hook 'before-save-hook 'whitespace-cleanup)

;;(global-rbenv-mode)

;; Visual window switching
(global-set-key (kbd "C-x o") 'switch-window)
(require 'switch-window)
