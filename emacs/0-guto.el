;;; package -- Summary

;;; Commentary:

;; See also other Dired hacks at: https://github.com/Fuco1/dired-hacks

;; golden-ratio ;; resize windows based on the golden ratio
;; vlf ;; view large files
;; neotree ;; file browser (http://www.emacswiki.org/emacs/NeoTree)
;; centered-cursor-mode ;; https://marmalade-repo.org/packages/centered-cursor-mode
;; comment-dwim-2 ;; better comment features (https://github.com/remyferre/comment-dwim-2)
;; flycheck-tip ;; show errors on popup-tip (https://github.com/yuutayamada/flycheck-tip)
;; general-close ;; (https://github.com/emacs-berlin/general-close)
;; sicp ;; (https://github.com/webframp/sicp-info)
;; eww ;; Read Practical common Lisp (https://www.reddit.com/r/emacs/comments/42g6u9/what_are_some_lesserknown_packages_that_you_love/)
;; sx ;; StackExchange on Emacs (https://github.com/vermiculus/sx.el)
;; leerzeichen ;; highlight whitespace characters (https://github.com/fgeller/leerzeichen.el)
;; speed-type ;; touch speed with Emacs (https://github.com/hagleitn/speed-type)
;; direx ;; Dired based directory explorer

;; Packages

;; This

;;; Code:

;; Theme path
;;(let ((basedir "~/.emacs.d/personal/themes/"))
;;  (dolist (f (directory-files basedir))
;;    (if (and (not (or (equal f ".") (equal f "..")))
;;             (file-directory-p (concat basedir f)))
;;        (add-to-list 'custom-theme-load-path (concat basedir f)))))

;; (require 'color-theme-solarized)
;; (color-theme-solarized)

;; (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;;                     (not (gnutls-available-p))))
;;        (protocol (if no-ssl "http" "https")))

;;   (add-to-list 'package-archives (cons "melpa-stable" (concat protocol "://stable.melpa.org/packages/")) t)
;;   (add-to-list 'package-archives (cons "org" (concat protocol "://orgmode.org/elpa/")) t)

;;   (when (< emacs-major-version 24)
;;     ;; For important compatibility libraries like cl-lib
;;     (add-to-list 'package-archives (cons "gnu" (concat protocol "://elpa.gnu.org/packages/")))))

;; (package-initialize)

(setq package-pinned-packages
      '((helm-bibtex . "melpa")
        (evil . "melpa")
        (solarized-theme . "melpa")
        (evil-commentary . "melpa-stable")
        (writeroom-mode . "melpa-stable")
        (restclient . "melpa-stable")
        ))

(setq package-archive-priorities
      '(("melpa-stable" .  9)
        ("melpa" . 10)
        ))

(defvar guto/packages
  '(key-chord
    ag
    aggressive-indent
    auto-complete
    bundler
    bug-hunter
    centered-cursor-mode
    cider
    comment-dwim-2
    company-restclient
    crux
    dap-mode
    deft
    direx
    discover
    define-word
    devdocs
    editorconfig
    edit-server
    ;; ehn-ruby-mode
    elfeed
    enclose
    exec-path-from-shell
    eww
    flx-ido
    flycheck-tip
    syntactic-close
    helm
    helm-bibtex
    helm-ag
    ido-completing-read+
    ido-vertical-mode
    interleave
    ispell
    keyfreq
    ledger-mode
    leerzeichen
    magit
    minitest
    multiple-cursors
    neotree
    org
    org-board
    lsp-origami
    origami
    pdf-tools
    prettier
    projectile
    rbenv
    restclient
    rinari
    robe
    rspec-mode
    seeing-is-believing
    smart-mode-line
    ;; smart-tab ;; broken on 20200908
    smartparens
    smooth-scroll
    shell-pop
    solarized-theme
    speed-type
    switch-window
    sx
    tide
    typescript-mode
    tldr
    use-package
    vlf
    vterm
    writeroom-mode
    wc-mode
    wc-goal-mode
    yard-mode
    yasnippet
    zotxt
    ))

(require 'package)

;; Refresh list of packages
(unless package-archive-contents
  (package-refresh-contents))

;; Install missing packages
(dolist (package guto/packages)
  (unless (package-installed-p package)
    (package-install package)))

;; Use prelude-require-packages to install packages
;; (prelude-require-packages '(some-package some-other-package))

(prelude-require-packages guto/packages)

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(setq solarized-use-variable-pitch nil)
(setq solarized-scale-org-headlines nil)
(setq solarized-use-less-bold t)
(setq prelude-theme 'solarized-dark)

;; Prettier global setup
;; https://github.com/jscheid/prettier.el

(add-hook 'after-init-hook #'global-prettier-mode)

;; (dir-locals-set-class-variables 'prettier-js
;;                                 '((js-mode . ((eval . (prettier-mode t))))
;;                                   (typescript . ((eval . (prettier-mode t))))))

;; (dir-locals-set-directory-class "/Users/guto/projects/fl/futurelearn/" 'prettier-js)

(setq prettier-enabled-parsers '(css
                                 json
                                 scss
                                 toml
                                 typescript))

;; (dir-locals-set-class-variables 'prettier-js
;;                                 '((typescript . ((eval . (prettier-mode t))))
;;                                   (web-mode . ((eval . (prettier-mode t))))
;;                                   (js-mode . ((eval . (prettier-mode t))))))

;; (dir-locals-set-directory-class "~/projects/fl/futurelearn/" 'prettier-js)

;; (use-package prettier-js
;;   :after js2-mode
;;   :init
;;   (add-hook 'js2-mode-hook 'prettier-js-mode)
;;   (add-hook 'web-mode-hook 'prettier-js-mode)
;;   :config
;;   (setq prettier-js-args '("--trailing-comma" "all"
;;                            "--bracket-spacing" "false"))



  ;; (defun enable-minor-mode (my-pair)
  ;;   "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  ;;   (if (buffer-file-name)
  ;;       (if (string-match (car my-pair) buffer-file-name)
  ;;           (funcall (cdr my-pair)))))
  ;; (add-hook 'web-mode-hook #'(lambda ()
  ;;                              (enable-minor-mode
  ;;                               '("\\.jsx?\\'" . prettier-js-mode)))))

;; github.com/akermu/emacs-libvterm
(use-package vterm
  :ensure t
  :config
  (setq vterm-max-scrollback 100000))

(use-package key-chord
  :config
  ;; disable key-chord
  (key-chord-mode -1)
  ;; disable individual key-chord bindings
  ;;(key-chord-define-global "jj" nil)
  )

(use-package tide
  :ensure
  :config
  (flycheck-mode 1))

(use-package multiple-cursors
  :ensure
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))


;;(use-package enh-ruby-mode
;;  :config
;;  (setq enh-ruby-add-encoding-comment-on-save nil))

(use-package magit
  :config
  ;; (setq magit-commit-show-diff nil)
  ;; (setq auto-revert-buffer-list-filter 'magit-auto-revert-repository-buffers-p)
  ;; Check other options here: https://magit.vc/manual/magit/Switching-Buffers.html
  (setq magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1))

;; TODO: Redo this using https://github.com/jwiegley/use-package
;; Use use-package for package installation and setup
(use-package smooth-scroll
  :config
  (smooth-scroll-mode 1)
  (setq smooth-scroll/vscroll-step-size 5))

;;(use-package ucs-cmds)

;; elfeed
;;(use-package elfeed
;;  :config
;;  (global-set-key (kbd "C-x w") 'elfeed)
;;  (setf url-queue-timeout 30))

;;(use-package elfeed-org
;;  :config
;;  (elfeed-org)
;;  (setq rmh-elfeed-org-files (list "~/.emacs.d/personal/elfeed.org")))

(use-package keyfreq
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

;; Set of useful extensions to Emacs
(use-package crux
  :config
  ;;(define-key KEYMAP "\C-c i" nil)
  ;; FIXME: Need to unset this first
  (define-key global-map (kbd "C-c i") nil)
  (global-unset-key "\C-c i")
  (global-set-key (kbd "C-c i") 'crux-ispell-word-then-abbrev)
  (setq save-abbrevs 'silently)
  (setq-default abbrev-mode t))

;; Definition of words using a web service
(use-package define-word
  :config
  (global-set-key (kbd "C-c d") 'define-word-at-point))

;; Synonymous
;; C-c s l synosaurus-lookup
;; C-c s r synosaurus-choose-and-replace
;;(use-package synosaurus
;;  :config
;;  (synosaurus-mode))

;; Ispell dictionary
(use-package ispell
  :config
  (ispell-change-dictionary "en_GB"))

;; helm-ag
(use-package helm-ag
  :config
  (setq helm-ag-base-command "rg --vimgrep --no-heading --smart-case")
  (setq helm-move-to-line-cycle-in-source 'nil)
  ;; (setq helm-ag-base-command "ag --nocolor --nogroup")
  )

;; helm-bibtex
(use-package helm-bibtex
  :config
  (setq helm-bibtex-bibliography '("~/Documents/school/master-theology-newbold/modules/dissertation/biblio.bib")))

;; Tide configuration
(use-package tide
  :config
  (add-hook 'typescript-mode-hook
            (lambda ()
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (eldoc-mode +1)
              ;; company is an optional dependency. You have to
              ;; install it separately via package-install
              (company-mode-on))))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; (use-package persp-mode
;;   :config
;;   (setq wg-morph-on nil) ;; switch off animation
;;   (persp-mode t))

;; Highlight current line
;; (use-package hlinum
;;   :config
;;   (linum-highlight-in-all-buffersp t)
;;   (hlinum-activate))

;; golden-ratio
;; (use-package golden-ratio
;;   :diminish golden-ratio-mode
;;   :config (progn
;;             ;;(add-to-list ’golden-ratio-extra-commands ’ace-window)
;;             (golden-ratio-mode 1)))

;; (use-package which-key
;;   :diminish which-key-mode
;;   :config (add-hook ’after-init-hook ’which-key-mode))


(use-package shell-pop
  :bind (("C-t" . shell-pop))
  :config
  (setq shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
  (setq shell-pop-term-shell "/bin/zsh")
  ;; need to do this manually or not picked up by `shell-pop'
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))


;; pdf-tools
;;; Install epdfinfo via 'brew install pdf-tools' and then install the
;;; pdf-tools elisp via the use-package below. To upgrade the epdfinfo
;;; server, just do 'brew upgrade pdf-tools' prior to upgrading to newest
;;; pdf-tools package using Emacs package system. If things get messed
;;; up, just do 'brew uninstall pdf-tools', wipe out the elpa
;;; pdf-tools package and reinstall both as at the start.
;;(use-package pdf-tools
;;  :ensure t
;;  :config
;;  (custom-set-variables
;;   '(pdf-tools-handle-upgrades nil)) ; Use brew upgrade pdf-tools instead.
;;  (setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo"))
;;(pdf-tools-install)

;; (use-package pdf-tools
;;   :ensure t
;;  :pin manual ;;manually update
;;  :config
;;  ;; initialise
;;  (pdf-tools-install)
;;  (setq-default pdf-view-display-size 'fit-page)
;;  ;; automatically annotate highlights
;;  (setq pdf-annot-activate-created-annotations t)
;;  ;; use isearch instead of swiper
;;  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
;;  ;; turn off cua so copy works
;;  (add-hook 'pdf-view-mode-hook (lambda () (cua-mode 0)))
;;  ;; more fine-grained zooming
;;  (setq pdf-view-resize-factor 1.1)
;;  ;; keyboard shortcuts
;;  (define-key pdf-view-mode-map (kbd "h") 'pdf-annot-add-highlight-markup-annotation)
;;  (define-key pdf-view-mode-map (kbd "t") 'pdf-annot-add-text-annotation)
;;  (define-key pdf-view-mode-map (kbd "D") 'pdf-annot-delete)
;;  ;; wait until map is available
;;  (with-eval-after-load "pdf-annot"
;;    (define-key pdf-annot-edit-contents-minor-mode-map (kbd "<return>") 'pdf-annot-edit-contents-commit)
;;    (define-key pdf-annot-edit-contents-minor-mode-map (kbd "<S-return>") 'newline)
;;    ;; save after adding comment
;;    (advice-add 'pdf-annot-edit-contents-commit :after 'guto/save-buffer-no-args)))

;; zpresent(https://bitbucket.org/zck/zpresent.el)
;; (use-package zpresent :ensure t)

;; Confirm emacs closing
(setq confirm-kill-emacs 'y-or-n-p)

;; Enables line numbering in all modes
;; (setq linum-format "%4d \u2502") ;; with solid line separator;
;; (global-linum-mode t)
;; (set-face-attribute 'linum nil :height 200)


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

;; (use-package smart-tab
;;   :ensure t
;;   :config
;;   (setq smart-tab-user-provided-completion-function 'company-complete)
;;   (setq smart-tab-using-hippie-expand t)
;;   (global-smart-tab-mode 1))

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

;;(global-rbenv-mode)

;; Visual window switching
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

;;; Visual window with ace-window
;; (global-set-key (kbd "C-x o") 'ace-window)
;; (global-set-key (kbd "M-p") 'ace-window)

;; (defvar aw-dispatch-alist
;;   '((?x aw-delete-window " Ace - Delete Window")
;;     (?m aw-swap-window " Ace - Swap Window")
;;     (?n aw-flip-window)
;;     (?v aw-split-window-vert " Ace - Split Vert Window")
;;     (?b aw-split-window-horz " Ace - Split Horz Window")
;;     (?i delete-other-windows " Ace - Maximize Window")
;;     (?o delete-other-windows))
;;   "List of actions for `aw-dispatch-default'.")

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
;; (pdf-tools-install)

;; When using GUI, do not open new frames but re-use existing frames
;; when opening new files.
(setq ns-pop-up-frames nil)

;; UI
;; Hide unnecessary GUI chrome
;; (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(show-paren-mode t)

;; enable company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Set different fonts depending on input type
;; See here: http://emacs.stackexchange.com/questions/5519/how-to-assign-a-certain-font-for-each-input-method-language-in-emacs-24/5525#5525
;; (defun default-input-font ()
;;   "changes the set-input-method to nil and selects a default font
;; bound to C-c f"
;;   (interactive)
;;   (set-input-method nil)
;;   (face-remap-add-relative 'default :family "Source Code Pro" :height 110))

;; (defun greek-input-font ()
;;   "changes the set-input-method to Greek and selects another font
;; bound to C-c g"
;;   (interactive)
;;   (set-input-method "greek")
;;   (face-remap-add-relative 'default :family "SBL Greek" :height 120))

;; (defun hebrew-input-font ()

;;   "changes the set-input-method to Hebrew  and selects another font
;; bound to C-c h"
;;   (interactive)
;;   (set-input-method "hebrew") ; you can specify like `hebrew-biblical-tiro`
;;   (face-remap-add-relative 'default :family "SBL Hebrew" :height 120))

;; (global-set-key (kbd "C-c f") 'default-input-font)
;; (global-set-key (kbd "C-c g") 'greek-input-font)
;; (global-set-key (kbd "C-c h") 'hebrew-input-font)

;; discover. See here: https://www.masteringemacs.org/article/discoverel-discover-emacs-context-menus
(require 'discover)
(global-discover-mode 1)

;; autocomplete pairs
(electric-pair-mode 1)

;; Turn on everywhere
;; (global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; Fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

;; (toggle-fullscreen)

;; Solarized theme settings

;; Don't change the font for some headings and titles
;; (setq solarized-use-variable-pitch nil)
;; Don't change size of org-mode headlines (but keep other size-changes)
;; (setq solarized-scale-org-headlines nil)
;; Scale org-mode headlines
;; (setq solarized-scale-org-headlines t)

(setq prelude-theme 'solarized-dark)

;; (when (require 'edit-server nil t)
;;   (setq edit-server-new-frame nil)
;;   (edit-server-start))

;; Use command as control
;; (setq mac-command-modifier 'control)

;; remove auto save when focus is lost
(remove-hook 'focus-out-hook 'prelude-auto-save-command)

;; stop blinking cursor
(blink-cursor-mode -1)

;; indent yanked code


;; automatically indenting yanked text if in programming-modes
(defvar yank-indent-modes '(emacs-lisp-mode
                            c-mode c++-mode
                            tcl-mode sql-mode
                            perl-mode cperl-mode
                            java-mode jde-mode
                            lisp-interaction-mode
                            LaTeX-mode TeX-mode)
  "Modes in which to indent regions that are yanked (or yank-popped)")

(defvar yank-advised-indent-threshold 1000
  "Threshold (# chars) over which indentation does not automatically occur.")

(defun yank-advised-indent-function (beg end)
  "Do indentation, as long as the region isn't too large."
  (if (<= (- end beg) yank-advised-indent-threshold)
      (indent-region beg end nil)))

(defadvice yank (after yank-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
      (let ((transient-mark-mode nil))
    (yank-advised-indent-function (region-beginning) (region-end)))))

(defadvice yank-pop (after yank-pop-indent activate)
  "If current mode is one of 'yank-indent-modes, indent yanked text (with prefix arg don't indent)."
  (if (and (not (ad-get-arg 0))
           (member major-mode yank-indent-modes))
    (let ((transient-mark-mode nil))
    (yank-advised-indent-function (region-beginning) (region-end)))))

;; Use OSX extended character entry with right alt/option/meta key in emacs
(setq mac-right-alternate-modifier nil)

;; Use gnus to read mailing list
;; Fire up gnus and
;; B
;; nntp
;; news.gmane.org
(setq gnus-select-method '(nntp "ger.gmane.org"))

;; Overwriting earlier definition
(global-set-key "\C-c /" 'comment-or-uncomment-region-or-line)

;; Stop making window height even
(setq even-window-heights nil)

;; (if (display-graphic-p)
;;     (use-package solarized
;;       :init
;;       (progn
;;         (setq solarized-use-variable-pitch nil)
;;         (setq solarized-high-contrast-mode-line t)
;;         (load-theme 'solarized-dark t)))
;;   (load-theme 'wombat t))

;; Apparently helps issue with terminal mode theme
;; (custom-set-faces (if (not window-system) '(default ((t (:background "nil"))))))


;; Enable visual line mode
;; (global-visual-line-mode)

(auto-fill-mode)

;; Integrate with Finda
;; More info: https://keminglabs.com/finda/
;;(load "~/.finda/integrations/emacs/finda.el")

(x-focus-frame nil)

;; Disable package ssl signature
(setq package-check-signature nil)

;; Improved look and feel
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; Native line numbers
(global-display-line-numbers-mode)

;; Edit browser text on emacs
;; (require 'atomic-chrome)
;; (atomic-chrome-start-server)

;; Use pandoc as the markdown command
(custom-set-variables
 '(markdown-command "/usr/local/bin/pandoc"))

;; Disable whitespace cleanup on save
;; (setq prelude-clean-whitespace-on-save nil)
;; (setq prelude-whitespace nil)

;; (whitespace-mode +1)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; Start Emacs server
(server-mode)

;; set default directory
(setq default-directory "/Users/guto/")

(defun writing-mode ()
  (interactive)
  (setq buffer-face-mode-face '(:family "Source Code Sans Pro-20" :height 150))
  (buffer-face-mode)
  (linum-mode 0)
  (writeroom-mode 1)
  (blink-cursor-mode)
  (visual-line-mode 1)
  (setq truncate-lines nil)
  (setq-default line-spacing 5)
  (setq global-hl-line-mode nil))

;;(add-hook 'markdown-mode-hook 'writing-mode)

;; https://karthinks.com/software/batteries-included-with-emacs/
(setq view-read-only t)

(global-set-key (kbd "C-c t") 'vterm-other-window)

(setq garbage-collection-messages t)

(provide 'guto)
;;; guto.el ends here
