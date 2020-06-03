;; (require 'helm-config)

;; (global-set-key (kbd "M-x") 'execute-extended-command)
(global-set-key (kbd "C-x RET") 'helm-M-x)

;; ;; Disable header line
;; (setq helm-display-header-line nil) ;; t by default
;; ;; Turn-off source header line width
;; ;; (set-face-attribute 'helm-source-header nil :height 0.1)

;; ;; Use autoresize
;; ;; (helm-autoresize-mode 1)

;; ;; Use fixed width
;; (setq helm-autoresize-max-height 30)
;; (setq helm-autoresize-min-height 30)

;; ;; No more random windows
;; (setq helm-split-window-in-side-p t)

(use-package helm
    :ensure helm
    :config (progn
              (global-set-key (kbd "C-x d") 'helm-find-files)
              (global-set-key (kbd "C-x C-d") 'helm-find-files)
              (global-set-key (kbd "C-x RET") 'helm-M-x)
              (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
              (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
              (define-key helm-map (kbd "C-z")  'helm-select-action)))
