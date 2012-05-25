;; Disabling aut0-fill-mode
(auto-fill-mode -1)

;; Enables line numbering in all modes
(global-linum-mode)

;; Adding textmate mode
(add-to-list 'load-path "~/.emacs.d/personal/vendor/textmate")
(require 'textmate)
(textmate-mode)

;; Adding cucumber/feature mode
(add-to-list 'load-path "~/.emacs.d/personal/vendor/cucumber")
(require 'feature-mode)

;; Disabling annoying auto compile for scss mode
(setq scss-compile-at-save nil)

(when (and (require 'edit-server nil t) (daemonp))
  (edit-server-start))

;; org mode settings

;; Adding org files to Agenda files
;;(setq org-agenda-files "~/Dropbox/sync/org/")

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

;; Starts emacs server
(server-start)

;; Confirm emacs closing
(setq confirm-kill-emacs 'y-or-n-p)
