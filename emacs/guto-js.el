(custom-set-variables '(coffee-tab-width 2))
(setq js-indent-level 2)

;; use js-jsx-mode for mdx (Storybook) files
(add-to-list 'auto-mode-alist '("\\.mdx$" . js-jsx-mode))

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
;; (setq-default flycheck-disabled-checkers
;;              (append flycheck-disabled-checkers
;;                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
;; (flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
;;(setq-default flycheck-disabled-checkers
;;              (append flycheck-disabled-checkers
;;                      '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
