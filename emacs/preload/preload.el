;; Set package repositories
(setq
 package-archives
 '(("melpa-stable" . "https://stable.melpa.org/packages/")
   ("melpa" . "https://melpa.org/packages/")
   ("org"         . "https://orgmode.org/elpa/")
   ("gnu"         . "https://elpa.gnu.org/packages/")))

;; https://www.reddit.com/r/emacs/comments/aug9in/failed_to_verify_signature_archivecontentssig/eh81iuz/
(setq package-check-signature 'nil)

;; Set default theme
(setq solarized-use-variable-pitch nil);; Don't change the font for some headings and titles
(setq solarized-scale-org-headlines nil);; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-use-less-bold t) ;; Use less bolding
(setq prelude-theme 'solarized-dark)

;; Fonts
(setq default-frame-alist '((font . "Source Code Pro-18")))
(set-frame-font "Source Code Pro-18")
(set-face-attribute 'default nil :font "Source Code Pro-18")
(set-face-attribute 'fixed-pitch nil :font "Source Code Pro-18")
(set-face-attribute 'variable-pitch nil :font "Source Sans 3 VF-18")
(set-face-attribute 'hebrew "SBL Hebrew")
(set-face-attribute 'greek "SBL Greek")

;; UI
(setq-default cursor-type '(bar . 2)) ;; cursor type and width
(blink-cursor-mode 0)              ;; No blinking cursor

;; Disable whitespace cleanup on save
;; (setq prelude-clean-whitespace-on-save nil)
;; (setq prelude-whitespace nil)

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
