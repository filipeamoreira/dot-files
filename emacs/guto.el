;; Add vendor to load-path
;; FIXME: Refactor this
(let ((base "~/.emacs.d/personal/vendor"))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

;; Disabling auto-fill-mode
(auto-fill-mode -1)

;; Enables line numbering in all modes
(global-linum-mode)

;; Adding textmate mode
;; (add-to-list 'load-path "~/.emacs.d/personal/vendor/textmate")
(require 'textmate)
(textmate-mode)

;; Adding cucumber/feature mode
;; (add-to-list 'load-path "~/.emacs.d/personal/vendor/cucumber")
(require 'feature-mode)

;; Disabling annoying auto compile for scss mode
(setq scss-compile-at-save nil)

(when (and (require 'edit-server nil t) (daemonp))
  (edit-server-start))

;; org mode settings

;; Adding org files to Agenda files
(setq org-agenda-files (list "~/Dropbox/sync/org/"
                             "~/Dropbox/sync/org/freelance/"))

;; Tracks when a certain TODO was finished
(setq org-log-done 'time)
;; and allows the insertion of notes
;;(setq org-log-done 'note)

;; Switch entry to DONE when all subentries are done, to TODO otherwise.
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; Clocking work time
;; Shotcuts to clocking log
;; C-c C-x C-i - Start the clock at current TODO item
;; C-c C-x C-o - Stop the clock at current TODO item
;; C-c C-x C-x - Cancel the clock at current TODO item
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; Resolving idle time
;; If computer is idle for more then n minutes it asks to resolve idle time
;; in context of clocking in and out
(setq org-clock-idle-time 10)

;; Countdown timer (useful for Pomodoro technique)
;; <C-c C-x ;> (org-timer-set-timer)


;; Mac Specific Configuration for Copy and Paste
;; (defun copy-from-osx ()
;;   (shell-command-to-string “pbpaste”))

;; (defun paste-to-osx (text &optional push)
;;   (let ((process-connection-type nil))
;;     (let ((proc (start-process “pbcopy” “*Messages*” “pbcopy”)))
;;       (process-send-string proc text)
;;       (process-send-eof proc))))

;; ;; Override defaults to use the mac copy and paste
;; (setq interprogram-cut-function ‘paste-to-osx)
;; (setq interprogram-paste-function ‘copy-from-osx)

;; (add-to-list 'load-path "~/.emacs.d/personal/vendor/")
;; (require 'pbcopy)
;; (turn-on-pbcopy)


(setq deactivate-mark nil)

;; Load auto-revert-tail-mode after opening .log file
(add-to-list 'auto-mode-alist
             '("\\.log\\'" . (lambda ()
                               (auto-revert-tail-mode))))

;; Call whitespace-cleanup

;; make whitespace-mode use “¶” for newline and “▷” for tab.
;; together with the rest of its defaults
(setq whitespace-display-mappings
      '(
        (space-mark 32 [183] [46]) ; normal space, ·
        (space-mark 160 [164] [95])
        (space-mark 2208 [2212] [95])
        (space-mark 2336 [2340] [95])
        (space-mark 3616 [3620] [95])
        (space-mark 3872 [3876] [95])
        (newline-mark 10 [182 10]) ; newlne, ¶
        (tab-mark 9 [9655 9] [92 9]) ; tab, ▷
        ))

;; Confirm emacs closing
(setq confirm-kill-emacs 'y-or-n-p)

;; Defines default date format
'(calendar-date-style (quote european))

;; Enable tip of the day
(require 'cl)
(defun totd ()
  (interactive)
  (with-output-to-temp-buffer "*Tip of the day*"
    (let* ((commands (loop for s being the symbols
                           when (commandp s) collect s))
           (command (nth (random (length commands)) commands)))
      (princ
       (concat "Your tip for the day is:\n========================\n\n"
               (describe-function command)
               "\n\nInvoke with:\n\n"
               (with-temp-buffer
                 (where-is command t)
                 (buffer-string)))))))

;; Disable system bell
(setq visible-bell 1)

;; Full screen mode
(ns-toggle-fullscreen)

;; Visual window switching
(require 'switch-window)

;; Starts emacs server
(require 'server)
(when (and (functionp 'server-running-p) (not (server-running-p)))
  (server-start))

(setq saved-server-window server-window)
(setq server-window
      (lambda (buffer)
        (let ((window
               (if window-system
                   saved-server-window
                 (frame-selected-window))))
          (set-window-buffer window buffer)
          (select-window window))))

;; ido-mode configuration
;; recently-opened files first
(ido-mode 1)
;; (setq ido-default-buffer-method 'selected-window)
;;                                         ; sort ido filelist by mtime instead of alphabetically
;; (add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
;; (add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)
;; (defun ido-sort-mtime ()
;;   (setq ido-temp-list
;;         (sort ido-temp-list
;;               (lambda (a b)
;;                 (time-less-p
;;                  (sixth (file-attributes (concat ido-current-directory b)))
;;                  (sixth (file-attributes (concat ido-current-directory a)))))))
;;   (ido-to-end  ;; move . files to end (again)
;;    (delq nil (mapcar
;;               (lambda (x) (and (string-match-p "^\\.." x) x))
;;               ido-temp-list))))
;; (add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
;; (add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)
;; (defun ido-sort-mtime ()
;;   (setq ido-temp-list
;;         (sort ido-temp-list
;;               (lambda (a b)
;;                 (let ((ta (nth 5 (file-attributes (concat ido-current-directory a))))
;;                       (tb (nth 5 (file-attributes (concat ido-current-directory b)))))
;;                   (if (= (nth 0 ta) (nth 0 tb))
;;                       (> (nth 1 ta) (nth 1 tb))
;;                     (> (nth 0 ta) (nth 0 tb)))))))
;;   (ido-to-end  ;; move . files to end (again)
;;    (delq nil (mapcar
;;               ;; (lambda (x) (if (string-equal (substring x 0 1) ".") x))
;;               (lambda (x) (and (string-match-p "^\\.." x) x))
;;               ido-temp-list))))

;; Better undo
(global-undo-tree-mode)

;; Replace region with yank
(delete-selection-mode 1)

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

;; set default bookmark location
(setq bookmark-default-file ( concat user-emacs-directory "personal/bookmarks"))

;; Cleaning up white-space before saving the buffer
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Enable C-j
(eval-after-load "paredit"
  #'(define-key paredit-mode-map (kbd "C-j") 'eval-last-sexp))

(setq search-highlight t            ;; highlight when searching...
      query-replace-highlight t)    ;; ...and replacing

;; Disable transient mark mode
;; Use C-<SPC> C-<SPC> to temporally activate it.
(setq transient-mark-mode nil)


(add-to-list 'hippie-expand-try-functions-list
             'yas/hippie-try-expand) ;put yasnippet in hippie-expansion list

(setq smart-tab-using-hippie-expand t)
(require 'smart-tab)
(global-smart-tab-mode 1)

(set-default 'indicate-empty-lines t)

;; FIXME: Configure a permanent log
;; (add-to-list 'load-path "~/.emacs.d/personal/vendor/command-log-mode")
;; (require 'command-log-mode)

;; FIXME: Disable ruby-tools # binding


(require 'simplenote)
(setq simplenote-email "famoreira@gmail.com")
;; (setq simplenote-password "yourpassword")
(simplenote-setup)

;; eldoc mode
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
