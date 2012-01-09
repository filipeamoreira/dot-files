;; Install starter-kit and others packages if they are not installed
(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-js starter-kit-lisp starter-kit-eshell starter-kit-ruby windsize yasnippet)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; DESCRIPTION: guto settings
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

;; line numbers
(require 'linum)
(global-linum-mode)
(setq linum-format " %d ")

;;(require 'simplenote)
;;(setq simplenote-email "famoreira@gmail.com")
;;(setq simplenote-password nil)
;;(simplenote-setup)

;;(set-default-font "Inconsolata-9")
(set-default-font "Meslo LG M DZ-12:normal")

;; Display the time in the mode line
(setq display-time-24hr-format t)
(display-time)

;; Backup directory
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)


(require 'windsize)
(windsize-default-keybindings)

(autoload 'multi-term "multi-term" nil t)
(autoload 'multi-term-next "multi-term" nil t)

(setq multi-term-program "/bin/zsh") ;; or use zsh...

(setenv "ESHELL" (expand-file-name "~/bin/eshell"))
(setenv "TERM" "xterm")
(set-terminal-coding-system 'utf-8)

(require 'ledger)

(setq auto-fill-mode -1)
(setq-default fill-column 99999)
(setq fill-column 99999)

;; syntax highlighting by default
(global-font-lock-mode t)

;; adds time, cpu load and battery information to modeline
(display-time-mode t)
(column-number-mode t)

;; Better continuity for scrolling. Also adds 10 line margin at the bootom while schrolling.
(setq scroll-conservatively 10)
(setq scroll-margin 7)
(setq inhibit-startup-screen 1)

;; ANSI color for terminal shells
(ansi-color-for-comint-mode-on)

;; Disable some gui elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Adds a newline at the end of a file
(setq require-final-newline t)

;; Disable the creation of a newline while moving to a new line at the end of a file
(setq next-line-add-newlines nil)

;; Fix foolish calendar-mode scrolling.
(add-hook 'calendar-load-hook
 '(lambda ()
 (setq mark-holidays-in-calendar t)
 (define-key calendar-mode-map ">" 'scroll-calendar-left)
 (define-key calendar-mode-map "<" 'scroll-calendar-right)
 (define-key calendar-mode-map "\C-x>" 'scroll-calendar-left)
 (define-key calendar-mode-map "\C-x<" 'scroll-calendar-right)))

;; Making files open in the same window
(setq ns-pop-up-frames 'nil)

;; Disable transient-mode
(setq transient-mark-mode nil)

;; ido mode always creates new files or use C-j to force file creation
(setq ido-create-new-buffer 'always)

;; dired customizations

(setq dired-listing-switches "-la")

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
