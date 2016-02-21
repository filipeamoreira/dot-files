;; Fonts
(setq default-frame-alist '((font . "Source Code Pro-22")))
(set-default-font "Source Code Pro-22")
(set-face-attribute 'default nil :font "Source Code Pro-22")

(set-face-attribute 'fixed-pitch nil :font "Source Code Pro-22")

(set-face-attribute 'variable-pitch nil :font "Source Sans Pro-24")

(set-face-attribute 'hebrew "SBL Hebrew")
(set-face-attribute 'greek "SBL Greek")

;; UI

(setq-default cursor-type '(bar . 2)) ;; cursor type and width
(blink-cursor-mode 0)              ;; No blinking cursor
