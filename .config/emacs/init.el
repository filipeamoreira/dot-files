;; DO NOT EDIT THIS FILE DIRECTLY
;; It is generated from an Org file (init.org).
;;
;; You should make any changes there and regenerate it with C-c C-v t ('org-babel-tangle)

;; Define variables
(defvar guto/default-font-size 210)
(defvar guto/default-variable-font-size 210)

;; Make frame transparency overridable
(defvar guto/frame-transparency '(90 . 90))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Initialize package sources
(require 'package)

;; using Github based mirros: https://github.com/d12frosted/elpa-mirror
(setq package-archives
      '(("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/")
        ("org"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/org/")
        ("gnu"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/gnu/")))

;; (setq package-archives
;;       '(("melpa" . "https://melpa.org/packages/")
;;         ("org"   . "https://orgmode.org/elpa/")
;;         ("elpa"  . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (straight-use-package 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
;; (setq straight-use-package-by-default t) ;; this defaults to using straight.el to install files

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns))
  :config
  ;;(setq exec-path-from-shell-arguments '("-l"))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PATH")
  ;; (exec-path-from-shell-copy-envs
  ;;  '("PATH" "GOPATH" "GO111MODULE" "GOPROXY"
  ;;    "NPMBIN" "LC_ALL" "LANG" "LC_TYPE"
  ;;    "SSH_AGENT_PID" "SSH_AUTH_SOCK" "SHELL"
  ;;    "JAVA_HOME"))
  )

(use-package auto-package-update
  :custom
  (auto-package-update-interval 7)
  (auto-package-update-prompt-before-update t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe)
  (auto-package-update-at-time "09:00"))

;; Set the default font face
(set-face-attribute 'default nil :font "Fira Code" :height guto/default-font-size)
;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "Fira Code" :height guto/default-font-size)
;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height guto/default-variable-font-size :weight 'regular)

;; Enable ligature support
;; emacs-mac has native support
(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

;; For other versions
(use-package ligature
  :straight (ligature :type git :host github :repo "mickeynp/ligature.el")
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
				       ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
				       "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
				       "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
				       "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
				       "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
				       "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
				       "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
				       "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
				       "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

;; https://protesilaos.com/modus-themes/
;;(use-package modus-themes
;;  :init (load-theme 'modus-vivendi))

;; Solarized theme
(use-package solarized-theme
  :init (load-theme 'solarized-dark t))

;; Call `emojify-apropos-emoji` or `emojify-insert-emoji`
(use-package emojify
  :hook (after-init . global-emojify-mode))

;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(defun guto/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'guto/display-startup-time)

;; Change all questions prompts to accept y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; Prompt when closing emacs
(defun guto/save-buffers-kill-terminal-prompt ()
  (interactive)
  (if (y-or-n-p "Quit?")
      (save-buffers-kill-terminal)))

(global-set-key (kbd "C-x C-c") 'guto/save-buffers-kill-terminal-prompt)

;; Disable logging
;; (setq native-comp-async-report-warnings-errors silent)
(setq native-comp-async-report-warnings-errors nil)

;; NOTE: If you want to move everything out of the ~/.emacs.d folder
;; reliably, set `user-emacs-directory` before loading no-littering!
;(setq user-emacs-directory "~/.cache/emacs")

(use-package no-littering)

;; no-littering doesn't set this by default so we must place
;; auto save files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
;; (menu-bar-mode -1)          ; Disable the menu bar

(setq-default cursor-type 'bar) ; change cursor type

;; Disable visual bell
(setq visible-bell       nil)
(setq ring-bell-function #'ignore)

(column-number-mode)
(global-display-line-numbers-mode t)

;; Set frame transparency
;; (set-frame-parameter (selected-frame) 'alpha guto/frame-transparency)
;; (add-to-list 'default-frame-alist `(alpha . ,guto/frame-transparency))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun guto/full-screen ()
  "Set window to full screen."
  (interactive)
  (set-frame-parameter (selected-frame) 'fullscreen 'maximized))

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq show-paren-delay 0)      ; how long to wait?
(show-paren-mode t)            ; turn paren-mode on
(setq show-paren-style 'mixed) ; alternatives are 'parenthesis' and 'mixed'

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defun guto/eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (prin1 (eval (read (current-kill 0)))
         (current-buffer)))

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'guto/eval-and-replace)

;; Maps Ctrl-z to undo
(global-set-key (kbd "C-z") 'undo)

;; Maps Ctrl-x-m to M-x
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Maps Ctrl-c Ctrl-k to kill-region
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Maps Ctrl-w to kill backward word or kill region
(global-set-key "\C-w"
                (lambda (arg)
                  (interactive "p")
                  (cond ((region-active-p) (kill-region (region-beginning) (region-end)))
                        (t (backward-kill-word arg)))))

(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)

;; Bind UK pound sign to alt/option-3
(define-key global-map (kbd "s-3") (lambda () (interactive) (insert "£")))


;; Window switching. (C-x o goes to the next window)
;;(use-package switch-window
;;  :config
;;  (global-set-key (kbd "C-x o") 'switch-window))

(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (global-set-key (kbd "C-x o") 'ace-window)
  (global-set-key (kbd "C-c s") 'ace-swap-window))

;; Replace region with yank
(delete-selection-mode t)

;; Disable transient mark mode
;; Use C-<SPC> C-<SPC> to temporally activate it.
(setq transient-mark-mode nil)

;; Set Meta key as Command and Super key as Option on a Mac
(setq mac-command-modifier 'meta) 
(setq mac-option-modifier 'super)
(setq mac-control-modifier 'control) ; make Control key do Control
(setq ns-function-modifier 'hyper)  ; make Fn key do Hyper

(use-package keypression)

(use-package command-log-mode
  :commands command-log-mode)

(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (
           (doom-modeline-height 15)
           (doom-modeline-project-detection 'project)
           (doom-modeline-buffer-file-name 'relative-to-project)
           (doom-modeline-enable-word-count nil)
           (doom-modeline-env-version t)
           (inhibit-compacting-font-caches t)))

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(global-unset-key (kbd "C-x c"))

(use-package helm
  ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
  ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
  ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
  :straight t
  ;; :demand t

  :bind (
         ("C-c h" . helm-command-prefix)
         ("M-x" . helm-M-x)
         ("C-c RET" . helm-M-x)
         ("C-x m" . helm-M-x)
         ("C-x RET" . helm-M-x)
         ("C-x C-m" . helm-M-x)
         ("C-c h o" . helm-occur)
         ("M-y" . helm-show-kill-ring)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("C-x C-b" . helm-buffers-list)
         ("C-h f" . helm-apropos)
         ("C-h r" . helm-info-emacs)
         ("C-h C-l" . helm-locate-library)
         ("C-c f" . helm-recentf)
         ("C-x d" . helm-find-files)
         ("C-x C-d" . helm-find-files)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action) ; rebind tab to run persistent action
         ("C-i" . helm-execute-persistent-action) ; make TAB works in terminal
         ("C-z" . helm-select-action) ; list actions using C-z
         :map helm-command-map
         ("o" . helm-occur)
         ("g" . helm-do-grep)
         ("C-c w" . helm-wikipedia-suggest)
         ("SPC" . helm-all-mark-rings))
  :init
  (setq helm-input-idle-delay                 0.01
        helm-reuse-last-window-split-state    t
        helm-split-window-inside-p           t
        helm-buffers-fuzzy-matching           t
        helm-move-to-line-cycle-in-source     t
        helm-ff-search-library-in-sexp        t
        helm-ff-file-name-history-use-recentf t)
  (require 'helm-config)
  (helm-mode 1))

;; helm-ag
(use-package helm-ag
  :config
  (setq helm-ag-base-command "rg --vimgrep --no-heading --smart-case")
  (setq helm-move-to-line-cycle-in-source 'nil)
  ;; (setq helm-ag-base-command "ag --nocolor --nogroup")
  )

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;;(use-package hydra
  ;;  :defer t)

  ;;(defhydra hydra-text-scale (:timeout 4)
  ;;  "scale text"
  ;;  ("j" text-scale-increase "in")
  ;;  ("k" text-scale-decrease "out")
  ;;  ("f" nil "finished" :exit t))

;;  (guto/leader-keys
;;    "ts" '(hydra-text-scale/body :which-key "scale text"))

(defun guto/org-font-setup ()
  ;; Replace list hyphen with dot
  ;; (font-lock-add-keywords 'org-mode
  ;;                        '(("^ *\\([-]\\) "
  ;;                           (0 (prog1 () (compose-region ;; (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.1)
                  (org-level-3 . 1.05)
                  (org-level-4 . 1.0)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Fira Code" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

(defun guto/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :pin org
  :commands (org-capture org-agenda)
  :hook (org-mode . guto/org-mode-setup)
  :config
  (setq org-startup-folded t)
  (setq org-ellipsis " ▾")
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-agenda-files
        '("~/Projects/Code/emacs-from-scratch/OrgFiles/Tasks.org"
          "~/Projects/Code/emacs-from-scratch/OrgFiles/Habits.org"
          "~/Projects/Code/emacs-from-scratch/OrgFiles/Birthdays.org"))

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60)

  (setq org-todo-keywords
    '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
      (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

  (setq org-refile-targets
    '(("Archive.org" :maxlevel . 1)
      ("Tasks.org" :maxlevel . 1)))

  ;; Save Org buffers after refiling!
  (advice-add 'org-refile :after 'org-save-all-org-buffers)

  (setq org-tag-alist
    '((:startgroup)
       ; Put mutually exclusive tags here
       (:endgroup)
       ("@errand" . ?E)
       ("@home" . ?H)
       ("@work" . ?W)
       ("agenda" . ?a)
       ("planning" . ?p)
       ("publish" . ?P)
       ("batch" . ?b)
       ("note" . ?n)
       ("idea" . ?i)))

  ;; Configure custom agenda views
  (setq org-agenda-custom-commands
   '(("d" "Dashboard"
     ((agenda "" ((org-deadline-warning-days 7)))
      (todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))
      (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

    ("n" "Next Tasks"
     ((todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))))

    ("W" "Work Tasks" tags-todo "+work-email")

    ;; Low-effort next actions
    ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
     ((org-agenda-overriding-header "Low Effort Tasks")
      (org-agenda-max-todos 20)
      (org-agenda-files org-agenda-files)))

    ("w" "Workflow Status"
     ((todo "WAIT"
            ((org-agenda-overriding-header "Waiting on External")
             (org-agenda-files org-agenda-files)))
      (todo "REVIEW"
            ((org-agenda-overriding-header "In Review")
             (org-agenda-files org-agenda-files)))
      (todo "PLAN"
            ((org-agenda-overriding-header "In Planning")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "BACKLOG"
            ((org-agenda-overriding-header "Project Backlog")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "READY"
            ((org-agenda-overriding-header "Ready for Work")
             (org-agenda-files org-agenda-files)))
      (todo "ACTIVE"
            ((org-agenda-overriding-header "Active Projects")
             (org-agenda-files org-agenda-files)))
      (todo "COMPLETED"
            ((org-agenda-overriding-header "Completed Projects")
             (org-agenda-files org-agenda-files)))
      (todo "CANC"
            ((org-agenda-overriding-header "Cancelled Projects")
             (org-agenda-files org-agenda-files)))))))

  (setq org-capture-templates
    `(("t" "Tasks / Projects")
      ("tt" "Task" entry (file+olp "~/Projects/Code/emacs-from-scratch/OrgFiles/Tasks.org" "Inbox")
           "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)

      ("j" "Journal Entries")
      ("jj" "Journal" entry
           (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
           "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
           ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
           :clock-in :clock-resume
           :empty-lines 1)
      ("jm" "Meeting" entry
           (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
           "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
           :clock-in :clock-resume
           :empty-lines 1)

      ("w" "Workflows")
      ("we" "Checking Email" entry (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
           "* Checking Email :email:\n\n%?" :clock-in :clock-resume :empty-lines 1)

      ("m" "Metrics Capture")
      ("mw" "Weight" table-line (file+headline "~/Projects/Code/emacs-from-scratch/OrgFiles/Metrics.org" "Weight")
       "| %U | %^{Weight} | %^{Notes} |" :kill-buffer t)))

  (define-key global-map (kbd "C-c j")
    (lambda () (interactive) (org-capture nil "jj")))

  (guto/org-font-setup))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun guto/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . guto/org-mode-visual-fill))

(with-eval-after-load 'org
  (org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
      (python . t)))

  (push '("conf-unix" . conf-unix) org-src-lang-modes))

(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("rb" . "src ruby"))
  (add-to-list 'org-structure-template-alist '("hs" . "src haskell")))

(use-package org-roam
  :ensure t
:init
(setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/sync/notes/org-roam")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

(defun guto/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . guto/lsp-mode-setup)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :ensure t
  :after (lsp-mode)
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references))
  :init (setq lsp-ui-doc-delay 1.5
              lsp-ui-doc-position 'bottom
              lsp-ui-doc-max-width 100))

(use-package helm-lsp
  :ensure t
  :after (lsp-mode)
  :commands helm-lsp-workspace-symbol)

(use-package lsp-treemacs
  :after (lsp-mode treemacs)
  :ensure t
  :commands lsp-treemacs-errors-list
  :bind (:map lsp-mode-map
         ("M-9" . lsp-treemacs-errors-list)))

(use-package treemacs
  :ensure t
  :commands (treemacs)
  :after (lsp-mode))

(use-package attrap
  :ensure t
  :bind (("C-x /" . attrap-attrap))) ;; use any binding of your choice

(use-package direnv)

(electric-pair-mode)

;; C-c C-n - jump between start/end tags
;; C-c C-f - fold code block
;; C-c C-s - code insertion
;; C-c C-m - clever text selection
;; C-c C-i - indent entire buffer

(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.[jt]sx?\\'" . web-mode)
         ("\\.[jt]s?\\'" . web-mode)
         ("\\.erb?\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-block-padding 2
        web-mode-comment-style 2
        web-mode-enable-css-colorization t
        web-mode-enable-auto-pairing t
        web-mode-enable-comment-keywords t
        web-mode-enable-current-element-highlight t)

  (add-hook 'web-mode-hook
            (lambda ()
              (if (or
                   (string-equal "tsx" (file-name-extension buffer-file-name))
                   (string-equal "ts" (file-name-extension buffer-file-name)))
                  (guto/setup-tide-mode)))))

(defun guto/setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(defun guto/set-local-eslint ()
  "Use local node_modules."
  (add-node-modules-path)
  (setq-local flycheck-javascript-eslint-executable (executable-find "eslint")))

(use-package tide
  :ensure 
  :config
  (flycheck-add-next-checker 'tsx-tide 'javascript-eslint)
  :after (web-mode company flycheck)
  :hook (web-mode . guto/setup-tide-mode))

(use-package typescript-mode
  :ensure t
  :mode (
         ("\\.ts\\'" . typescript-mode)
         ("\\.gql\\'" . typescript-mode))
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2)
  (add-hook 'typescript-mode #'subword-mode)) 

(use-package flycheck
  :ensure t
  :hook (web-mode . guto/set-local-eslint)
  :init
  (setq flycheck-python-flake8-executable (executable-find "flake8"))
  (setq flycheck-python-pycompile-executable (executable-find "python3"))
  :config
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))
  (global-flycheck-mode 1))

(use-package add-node-modules-path
  :ensure t)

(use-package robe
  :straight (robe :type git :host github :repo "dgutov/robe")
  :hook (ruby-mode)
  :config
(global-robe-mode))

(use-package ruby-mode
  :after lsp-mode
  :mode
  (("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\|Fast\\|Match\\|App\\)file\\)\\'" . ruby-mode))
  :interpreter "ruby")

(use-package projectile-rails
:config
(projectile-rails-global-mode))

(use-package ruby-electric
  :after ruby-mode
  :hook (ruby-mode . ruby-electric-mode))

(use-package ruby-test-mode
  :after ruby-mode
  :diminish ruby-test-mode)

(use-package yaml-mode)

;; (use-package toml-mode)

;; (use-package rust-mode
;;   :hook (rust-mode . lsp))

;; ;; Add keybindings for interacting with Cargo
;; (use-package cargo
;;   :hook (rust-mode . cargo-minor-mode))

;; (use-package flycheck-rust
;;   :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; rust-mode
;; https://github.com/rust-lang/rust-mode

(use-package rust-mode
  :bind ( :map rust-mode-map
               (("C-c C-t" . racer-describe)
                ([?\t] .  company-indent-or-complete-common)))
  :config
  (progn
    ;; add flycheck support for rust (reads in cargo stuff)
    ;; https://github.com/flycheck/flycheck-rust
    (use-package flycheck-rust)

    ;; cargo-mode for all the cargo related operations
    ;; https://github.com/kwrooijen/cargo.el
    (use-package cargo
      :hook (rust-mode . cargo-minor-mode)
      :bind
      ("C-c C-c C-n" . cargo-process-new)) ;; global binding

    ;;; separedit ;; via https://github.com/twlz0ne/separedit.el
    (use-package separedit
      :straight (separedit :type git :host github :repo "idcrook/separedit.el")
      :config
      (progn
        (define-key prog-mode-map (kbd "C-c '") #'separedit)
        (setq separedit-default-mode 'markdown-mode)))

    ;;; racer-mode for getting IDE like features for rust-mode
    ;; https://github.com/racer-rust/emacs-racer
    (use-package racer
      :hook (rust-mode . racer-mode)
      :config
      (progn
        ;; package does this by default ;; set racer rust source path environment variable
        ;; (setq racer-rust-src-path (getenv "RUST_SRC_PATH"))
        (defun my-racer-mode-hook ()
          (set (make-local-variable 'company-backends)
               '((company-capf company-files)))
          (setq company-minimum-prefix-length 1)
          (setq indent-tabs-mode nil))

        (add-hook 'racer-mode-hook 'my-racer-mode-hook)

        ;; enable company and eldoc minor modes in rust-mode (racer-mode)
        (add-hook 'racer-mode-hook #'company-mode)
        (add-hook 'racer-mode-hook #'eldoc-mode)))

    (add-hook 'rust-mode-hook 'flycheck-mode)
    (add-hook 'flycheck-mode-hook 'flycheck-rust-setup)

    ;; format rust buffers on save using rustfmt
    (add-hook 'before-save-hook
              (lambda ()
                (when (eq major-mode 'rust-mode)
                  (rust-format-buffer))))))

(use-package json-mode)

(use-package groovy-mode
  :config
  (setq groovy-indent-offset 4))

(use-package swift-mode)

(use-package haskell-mode)

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-mode))

(use-package nix-mode)

(use-package lsp-java 
:ensure t
:config (add-hook 'java-mode-hook 'lsp))

(use-package company
  :after lsp-mode
  :hook (
         (lsp-mode . company-mode)
         (lsp-mode . ruby-mode)
         (prog-mode . company-mode))
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 2)
  (company-idle-delay 0.5)
  (company-show-numbers t)
  (company-tooltip-align-annotations t)
  (company-tooltip-flip-when-above t))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package company-quickhelp
  :ensure t
  :init
  (company-quickhelp-mode 1)
  (use-package pos-tip
    :ensure t))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/projects/")
    (setq projectile-project-search-path '("~/projects/")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

(use-package magit
  :commands magit-status
  :bind (("C-c g" . magit-status)
         ("C-x f" . magit-status)
         ("C-x C-g" . magit-status)
         ("C-x g" . magit-status))
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  (magit-refresh-status-buffer nil)
  (auto-revert-buffer-list-filter 'magit-auto-revert-repository-buffer-p)
  (magit-git-executable "/usr/local/bin/git"))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; (use-package editorconfig
  ;;   :ensure t
  ;;   :config
  ;;   (setq editorconfig-trim-whitespaces-mode
  ;;      'ws-butler-mode)
  ;;   (editorconfig-mode 1))

;; trims whitespace only on touched lines

(use-package ws-butler
  :straight (ws-butler :type git :host github :repo "lewang/ws-butler")
  :ensure t)

(use-package editorconfig
  :hook (prog-mode . editorconfig-mode)
  :config
  (defun guto/editorconfig-disable-ws-butler-maybe-h (props)
    "Disable `ws-butler-mode' if trim_trailing_whitespace is true."
    (when (and (equal (gethash 'trim_trailing_whitespace props) "true")
               (bound-and-true-p ws-butler-mode))
      (ws-butler-mode -1)))
  (add-hook 'editorconfig-after-apply-functions #'guto/editorconfig-disable-ws-butler-maybe-h)
  (editorconfig-mode +1))

(use-package prettier
  :ensure t
  :hook (js2-mode json-mode))

(defun guto/enable-minor-mode (my-pair)
    "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
    (if (buffer-file-name)
        (if (string-match (car my-pair) buffer-file-name)
            (funcall (cdr my-pair)))))

(add-hook 'web-mode-hook #'(lambda ()
                             (guto/enable-minor-mode
                              '("\\.jsx?\\'" . prettier-mode))))
(add-hook 'web-mode-hook #'(lambda ()
                             (guto/enable-minor-mode
                              '("\\.tsx?\\'" . prettier-mode))))
(add-hook 'json-mode-hook #'(lambda ()
                              (guto/enable-minor-mode
                               '("\\.json?\\'" . prettier-mode))))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init
  (bind-key "C-M-f" #'sp-forward-sexp smartparens-mode-map)
  (bind-key "C-M-b" #'sp-backward-sexp smartparens-mode-map)
  (bind-key "C-)" #'sp-forward-slurp-sexp smartparens-mode-map)
  (bind-key "C-(" #'sp-backward-slurp-sexp smartparens-mode-map)
  (bind-key "M-)" #'sp-forward-barf-sexp smartparens-mode-map)
  (bind-key "M-(" #'sp-backward-barf-sexp smartparens-mode-map)
  (bind-key "C-S-s" #'sp-splice-sexp)
  (bind-key "C-M-<backspace>" #'backward-kill-sexp)
  (bind-key "C-M-S-<SPC>" (lambda () (interactive) (mark-sexp -1)))
    :config
  (smartparens-global-mode t)
  ;; (sp-pair "'" nil :actions :rem) ;; disable specific pairs
  (setq sp-highlight-pair-overlay nil))

(use-package pdf-tools
  :straight (:depth full)
  :config
  (pdf-tools-install :no-query)
  ;; open pdfs scaled to fit page
  (setq-default pdf-view-display-size 'fit-page)
  ;; automatically annotate highlights
  (setq pdf-annot-activate-created-annotations t)
  ;; use normal isearch
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward)
  ;; turn off cua so copy works
  (add-hook 'pdf-view-mode-hook (lambda () (cua-mode 0)))
  ;; more fine-grained zooming
  (setq pdf-view-resize-factor 1.1)
  ;; keyboard shortcuts
  (define-key pdf-view-mode-map (kbd "h") 'pdf-annot-add-highlight-markup-annotation)
  (define-key pdf-view-mode-map (kbd "t") 'pdf-annot-add-text-annotation)
  (define-key pdf-view-mode-map (kbd "D") 'pdf-annot-delete))

(defun guto/copy-buffer-file-name ()
    "Copy the full path to the current file in the minibuffer."
    (interactive)
    (let ((file-name (buffer-file-name)))
      (if file-name
          (progn
            (kill-new file-name))
        (error "Buffer not visiting a file"))))

(global-set-key (kbd "C-c c") 'guto/copy-buffer-file-name)

;; `yas-describe-tables` show the available snippets for current mode
;; `yas-visit-snippet-file` shows definition for snippet
  (use-package yasnippet
   :config (yas-global-mode 1))

(use-package yasnippet-snippets)

(use-package term
  :commands term
  :config
  (setq explicit-shell-file-name "zsh") ;; Change this to zsh, etc
  ;;(setq explicit-zsh-args '())         ;; Use 'explicit-<shell>-args for shell-specific args

  ;; Match the default Bash shell prompt.  Update this if you have a custom prompt
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

(use-package eterm-256color
  :hook (term-mode . eterm-256color-mode))

;; (use-package vterm
;;   :commands vterm
;;   :config
;;   (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")  ;; Set this to match your custom shell prompt
;;   ;;(setq vterm-shell "zsh")                       ;; Set this to customize the shell to launch
;;   (setq vterm-max-scrollback 10000))

(when (eq system-type 'windows-nt)
  (setq explicit-shell-file-name "powershell.exe")
  (setq explicit-powershell.exe-args '()))

(defun guto/configure-eshell ()
  ;; Save command history when commands are entered
  (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)

  ;; Truncate buffer for performance
  (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)

  ;; Bind some useful keys for evil-mode
  ;;(evil-define-key '(normal insert visual) eshell-mode-map (kbd "C-r") 'counsel-esh-history)
  ;;(evil-define-key '(normal insert visual) eshell-mode-map (kbd "<home>") 'eshell-bol)
  ;;(evil-normalize-keymaps)

  (setq eshell-history-size         10000
	eshell-buffer-maximum-lines 10000
	eshell-hist-ignoredups t
	eshell-scroll-to-bottom-on-input t))

(use-package eshell-git-prompt
  :after eshell)

(use-package eshell
  :hook (eshell-first-time-mode . guto/configure-eshell)
  :config

  (with-eval-after-load 'esh-opt
    (setq eshell-destroy-buffer-when-process-dies t)
    (setq eshell-visual-commands '("htop" "zsh" "vim")))

  (eshell-git-prompt-use-theme 'powerline))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :config )

(use-package dired-single
  :commands (dired dired-jump))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-open
  :commands (dired dired-jump)
  :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  (setq dired-open-extensions '(("png" . "feh")
                                ("mkv" . "mpv"))))

;; (use-package elfeed
;;   :defer t
;;   :bind ("C-x w" . elfeed)
;;   :init (setf url-queue-timeout 30)
;;   :config
;;   (require 'feed-setup)
;;   (push "-k" elfeed-curl-extra-arguments)
;;   (setf bookmark-default-file (locate-user-emacs-file "local/bookmarks")))

;; Make gc pauses faster by decreasing the threshold.
;; (setq gc-cons-threshold (* 2 100000000))

;; Increase the amount of data which Emacs reads from the process
;; source: https://emacs-lsp.github.io/lsp-mode/page/performance/
  (setq read-process-output-max (* 1024 1024)) ;; 1mb

(server-start)
