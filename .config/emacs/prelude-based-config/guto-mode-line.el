;; ;; 24 hr
;; (setq display-time-day-and-date t
;;       display-time-24hr-format t)
;; ;; Mode line setup
;; (setq-default
;;  mode-line-format
;;  '(; Position, including warning for 80 columns
;;    (:propertize "%4l:" face mode-line-position-face)
;;    (:eval (propertize "%3c" 'face
;;                       (if (>= (current-column) 80)
;;                           'mode-line-80col-face
;;                         'mode-line-position-face)))
;;    ; emacsclient [default -- keep?]
;;    mode-line-client
;;    "  "
;;    ; read-only or modified status
;;    (:eval
;;     (cond (buffer-read-only
;;            (propertize " RO " 'face 'mode-line-read-only-face))
;;           ((buffer-modified-p)
;;            (propertize " ** " 'face 'mode-line-modified-face))
;;           (t "      ")))
;;    "    "
;;    ; directory and buffer/file name
;;    (:propertize (:eval (shorten-directory default-directory 30))
;;                 face mode-line-folder-face)
;;    (:propertize "%b"
;;                 face mode-line-filename-face)
;;    ; narrow [default -- keep?]
;;    " %n "
;;    ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
;;    (vc-mode vc-mode)
;;    "  %["
;;    (:propertize mode-name
;;                 face mode-line-mode-face)
;;    "%] "
;;    (:eval (propertize (format-mode-line minor-mode-alist)
;;                       'face 'mode-line-minor-mode-face))
;;    (:propertize mode-line-process
;;                 face mode-line-process-face)
;;    (global-mode-string global-mode-string)
;;    "    "
;;    ;; add the time, with the date and the emacs uptime in the tooltip
;;    (:eval (propertize (format-time-string "%H:%M")
;;                        'help-echo
;;                        (concat (format-time-string "%c; ")
;;                                (emacs-uptime "Uptime:%hh"))))
;;    ; nyan-mode uses nyan cat as an alternative to %p
;;    ;; (:eval (when nyan-mode (list (nyan-create))))
;;    ))

;; ;; Helper function
;; (defun shorten-directory (dir max-length)
;;   "Show up to `max-length' characters of a directory name `dir'."
;;   (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
;;         (output ""))
;;     (when (and path (equal "" (car path)))
;;       (setq path (cdr path)))
;;     (while (and path (< (length output) (- max-length 4)))
;;       (setq output (concat (car path) "/" output))
;;       (setq path (cdr path)))
;;     (when path
;;       (setq output (concat ".../" output)))
;;     output))

;; ;; Extra mode line faces
;; (make-face 'mode-line-read-only-face)
;; (make-face 'mode-line-modified-face)
;; (make-face 'mode-line-folder-face)
;; (make-face 'mode-line-filename-face)
;; (make-face 'mode-line-position-face)
;; (make-face 'mode-line-mode-face)
;; (make-face 'mode-line-minor-mode-face)
;; (make-face 'mode-line-process-face)
;; (make-face 'mode-line-80col-face)

;; (set-face-attribute 'mode-line nil
;;     :foreground "gray60" :background "gray20"
;;     :inverse-video nil
;;     :box '(:line-width 6 :color "gray20" :style nil))
;; (set-face-attribute 'mode-line-inactive nil
;;     :foreground "gray80" :background "gray40"
;;     :inverse-video nil
;;     :box '(:line-width 6 :color "gray40" :style nil))

;; (set-face-attribute 'mode-line-read-only-face nil
;;     :inherit 'mode-line-face
;;     :foreground "#4271ae"
;;     :box '(:line-width 2 :color "#4271ae"))
;; (set-face-attribute 'mode-line-modified-face nil
;;     :inherit 'mode-line-face
;;     :foreground "#c82829"
;;     :background "#ffffff"
;;     :box '(:line-width 2 :color "#c82829"))
;; (set-face-attribute 'mode-line-folder-face nil
;;     :inherit 'mode-line-face
;;     :foreground "gray60")
;; (set-face-attribute 'mode-line-filename-face nil
;;     :inherit 'mode-line-face
;;     :foreground "#eab700"
;;     :weight 'bold)
;; (set-face-attribute 'mode-line-position-face nil
;;     :inherit 'mode-line-face
;;     :family "Menlo" :height 100)
;; (set-face-attribute 'mode-line-mode-face nil
;;     :inherit 'mode-line-face
;;     :foreground "gray80")
;; (set-face-attribute 'mode-line-minor-mode-face nil
;;     :inherit 'mode-line-mode-face
;;     :foreground "gray40"
;;     :height 110)
;; (set-face-attribute 'mode-line-process-face nil
;;     :inherit 'mode-line-face
;;     :foreground "#718c00")
;; (set-face-attribute 'mode-line-80col-face nil
;;     :inherit 'mode-line-position-face
;;     :foreground "black" :background "#eab700")

;; ;; Add word count to mode line. Source: https://gist.github.com/jackrusher/6480848
;; (defvar wordcount-timer nil
;;   "Timer to kick off word count recomputation.")

;; (defvar wordcount-current-count 0
;;   "The result of the last word count.")

;; (defun wordcount-update-word-count ()
;;   "Recompute the word count."
;;   (setq wordcount-current-count (count-words (point-min) (point-max))))

;; (define-minor-mode wordcount-mode
;;   "Toggle wordcount mode.
;; With no argument, this command toggles the mode.
;; A non-null prefix argument turns the mode on.
;; A null prefix argument turns it off.

;; When enabled, the word count for the current buffer
;; is displayed in the mode-line."
;;   :init-value nil
;;   :lighter (:eval (format " [%d words]" wordcount-current-count))
;;   (if wordcount-mode
;;       (progn
;;         (set (make-local-variable 'wordcount-current-count)
;;              (count-words (point-min) (point-max)))
;;         (set (make-local-variable 'wordcount-timer)
;;               (run-with-idle-timer 3 't #'wordcount-update-word-count)))
;;     (cancel-timer wordcount-timer)))

;; (add-hook 'markdown-mode-hook (lambda () (wordcount-mode)))

;; (setq sml/theme 'dark)
;; (sml/setup)
