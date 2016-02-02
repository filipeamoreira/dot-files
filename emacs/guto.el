;; Fullscreen
(toggle-fullscreen)

;; See also other Dired hacks at: https://github.com/Fuco1/dired-hacks

;; golden-ratio ;; resize windows based on the golden ratio
;; vlf ;; view large files
;; neotree ;; file browser (http://www.emacswiki.org/emacs/NeoTree)
;; centered-cursor-mode ;; https://marmalade-repo.org/packages/centered-cursor-mode
;; comment-dwim-2 ;; better comment features (https://github.com/remyferre/comment-dwim-2)
;; flycheck-tip ;; show errors on popup-tip (https://github.com/yuutayamada/flycheck-tip)
;; general-close ;; (https://github.com/emacs-berlin/general-close)
;; sicp ;; (https://github.com/webframp/sicp-info)
;; eww ;; Read Practical common lisp (https://www.reddit.com/r/emacs/comments/42g6u9/what_are_some_lesserknown_packages_that_you_love/)
;; sx ;; StackExchange on Emacs (https://github.com/vermiculus/sx.el)
;; leerzeichen ;; highlight whitespace characters (https://github.com/fgeller/leerzeichen.el)
;; speed-type ;; touch speed with Emacs (https://github.com/hagleitn/speed-type)
;; direx ;; Dired based directory explorer

;; Packages

(defvar guto/packages
  '(ace-jump-mode
    ag
    aggressive-indent
    auto-complete
    blank-mode
    bundler
    centered-cursor-mode
    cider
    comment-dwim-2
    deft
    direx
    discover
    discover
    enclose
    eww
    elfeed
    flx-ido
    flycheck-tip
    general-close
    golden-ratio
    helm
    ido-ubiquitous
    ido-vertical-mode
    key-chord
    leerzeichen
    magit
    minitest
    neotree
    org-pdfview
    pdf-tools
    projectile
    projectile-rails
    rbenv
    rinari
    robe
    seeing-is-believing
    sicp
    slime
    smart-mode-line
    smart-tab
    smartparens
    smooth-scroll
    solarized-theme
    speed-type
    switch-window
    sx
    tldr
    ucs-cmds
    use-package
    vlf
    wc-mode
    yasnippet))

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)

;; Refresh list of packages
(unless package-archive-contents
  (package-refresh-contents))

;; Install missing packages
;; (dolist (package guto/packages)
;;   (unless (package-installed-p package)
;;     (package-install package)))

;; Use prelude-require-packages to install packages
;; (prelude-require-packages '(some-package some-other-package))

(prelude-require-packages guto/packages)

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

;; Use use-package for package installation and setup
(use-package smooth-scroll
  :config
  (smooth-scroll-mode 1)
  (setq smooth-scroll/vscroll-step-size 5)
  )

(use-package ido-ubiquitous)
(use-package ucs-cmds)


;;(server-mode)

;; Confirm emacs closing
(setq confirm-kill-emacs 'y-or-n-p)

;; Enables line numbering in all modes
(global-linum-mode)

;; Disable system bell
(setq visible-bell 1)

;; Replace region with yank
(delete-selection-mode t)

;; Disable transient mark mode
;; Use C-<SPC> C-<SPC> to temporally activate it.
(setq transient-mark-mode nil)

;; Load auto-revert-tail-mode after opening .log file
(add-to-list 'auto-mode-alist
             '("\\.log\\'" . (lambda ()
                               (auto-revert-tail-mode))))

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
;; (require 'rinari)
;; (global-rinari-mode)

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

(require 'enclose)
(enclose-mode t)

;; Adds vendor to loadpath
(add-to-list 'load-path "~/.emacs.d/personal/vendor/")

(require 'rcodetools)

;; (define-key ruby-mode-map (kbd "C-c C-c") 'xmp)

;; Always use UTF-8
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment "en_GB.UTF-8")
(prefer-coding-system 'utf-8)

(setq buffer-file-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix)
(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq default-sendmail-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)

;; delete whitespaces when writing to a file
;; (add-hook 'before-save-hook 'whitespace-cleanup)

;;(global-rbenv-mode)

;; Visual window switching
(global-set-key (kbd "C-x o") 'switch-window)
(require 'switch-window)

;; (add-hook 'after-init-hook
;;           (lambda () (setq debug-on-error t)))

(yas-global-mode 1)

(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; FIXME Should move this out of source control
(setq paradox-github-token "b8d4d69f51510df60a13635b9f4161ac13c7394c")

;; Sidebar list of frames
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)

;; Speeds up saves
;; http://www.method-combination.net/blog/archives/2011/03/11/speeding-up-emacs-saves.html
(setq vc-handled-backends nil)

;; Error with emacs 24.4
(fset 'package-desc-vers 'package--ac-desc-version)

;; File bookmarks
;; C-x r m – set a bookmark at the current location (e.g. in a file)
;; C-x r b – jump to a bookmark
;; C-x r l – list your bookmarks
;; M-x bookmark-delete – delete a bookmark by name

(require 'wc-goal-mode)

;; Using sudo over ssh and Tramp
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

;; Request UTF-8 when pasting from other applications
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; Unbound keys
(global-set-key (kbd "C-M-SPC") nil)

;; On Mac OSX, delete files by moving them to ~/.Tash
(cond ((eq system-type 'darwin)
       (setq delete-by-moving-to-trash t)
       (setq trash-directory "~/.Trash/")))

;; Always autoscroll compilation output, so long reuslt listings are easier to
;; read.
(setq compilation-scroll-output t)

;; pdf-tools install
(pdf-tools-install)

;; When using GUI, do not open new frames but re-use existing frames
;; when opening new files.
(setq ns-pop-up-frames nil)

;; UI
;; Hide unnecessary GUI chrome
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(blink-cursor-mode t)
(show-paren-mode t)

;; enable company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Set different fonts depending on input type
;; See here: http://emacs.stackexchange.com/questions/5519/how-to-assign-a-certain-font-for-each-input-method-language-in-emacs-24/5525#5525
(defun default-input-font ()
  "changes the set-input-method to nil and selects a default font
bound to C-c f"
  (interactive)
  (set-input-method nil)
  (face-remap-add-relative 'default :family "Source Code Pro" :height 110))

(defun greek-input-font ()
  "changes the set-input-method to Greek and selects another font
bound to C-c g"
  (interactive)
  (set-input-method "greek")
  (face-remap-add-relative 'default :family "SBL Greek" :height 120))

(defun hebrew-input-font ()

  "changes the set-input-method to Hebrew  and selects another font
bound to C-c h"
  (interactive)
  (set-input-method "hebrew") ; you can specify like `hebrew-biblical-tiro`
  (face-remap-add-relative 'default :family "SBL Hebrew" :height 120))

(global-set-key (kbd "C-c f") 'default-input-font)
(global-set-key (kbd "C-c g") 'greek-input-font)
(global-set-key (kbd "C-c h") 'hebrew-input-font)

;; discover. See here: https://www.masteringemacs.org/article/discoverel-discover-emacs-context-menus
(require 'discover)
(global-discover-mode 1)

;; autocomplete pairs
(electric-pair-mode 1)

;; Disable whispace mode cleanup on save
(setq prelude-clean-whitespace-on-save nil)

;; Turn on everywhere
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(provide 'guto)
;;; guto.el ends here
