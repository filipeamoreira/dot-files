;; Fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(toggle-fullscreen)

;; This will be loaded before prelude
(setq prelude-theme 'solarized-dark)

;; Evaluates on each new frame
(setq default-frame-alist '((font . "Source Code Pro-21")))
(set-default-font "Source Code Pro-21")
(set-face-attribute 'default nil :font "Source Code Pro-19")
;; (set-face-attribute 'hebrew "SBL Hebrew")
;; (set-face-attribute 'greek "SBL Greek")
