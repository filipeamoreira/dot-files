;; Set package repositories
(setq
 package-archives
 '(("melpa-stable" . "https://stable.melpa.org/packages/")
   ("melpa" . "https://melpa.org/packages/")
   ("org"         . "https://orgmode.org/elpa/")
   ("gnu"         . "https://elpa.gnu.org/packages/")))

;; Fonts
(setq default-frame-alist '((font . "Source Code Pro-20")))
(set-frame-font "Source Code Pro-20")
(set-face-attribute 'default nil :font "Source Code Pro-20")

(set-face-attribute 'fixed-pitch nil :font "Source Code Pro-20")

(set-face-attribute 'variable-pitch nil :font "Source Sans Pro-20")

(set-face-attribute 'hebrew "SBL Hebrew")
(set-face-attribute 'greek "SBL Greek")

;; UI
(setq-default cursor-type '(bar . 2)) ;; cursor type and width
(blink-cursor-mode 0)              ;; No blinking cursor

;; Disable whitespace cleanup on save
(setq prelude-clean-whitespace-on-save nil)
(setq prelude-whitespace nil)

;; Set persistence folder
(setq emacs-persistence-directory (concat user-emacs-directory "personal/persistence/"))
(unless (file-exists-p emacs-persistence-directory)
  (make-directory emacs-persistence-directory t))
;; Set prelude persistence directory
(setq prelude-savefile-dir emacs-persistence-directory)

;; Set ido directory list file
(setq ido-save-directory-list-file (concat emacs-persistence-directory
                                           "ido.last"))
;; Set org-clock-save location
(setq org-clock-persist-file (concat emacs-persistence-directory
                                     "org-clock-save.el"))
