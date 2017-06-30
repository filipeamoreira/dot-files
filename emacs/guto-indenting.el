(defun my-setup-indent (n)
  ;; java/c/c++
  (setq-local c-basic-offset n)
  ;; web development
  (setq-local coffee-tab-width n) ; coffeescript
  (setq-local javascript-indent-level n) ; javascript-mode
  (setq-local js-indent-level n) ; js-mode
  (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local css-indent-offset n) ; css-mode
  )

(defun my-personal-code-style ()
  (interactive)
  (message "Setting my personal code style!")
  ;; use space instead of tab
  (setq indent-tabs-mode nil)
  ;; indent 2 spaces width
  (my-setup-indent 2))

;;(my-personal-code-style)

;; prog-mode-hook requires emacs24+
;; (add-hook 'prog-mode-hook 'my-setup-indent)
;; a few major-modes does NOT inherited from prog-mode
;; (add-hook 'lua-mode-hook 'my-setup-indent)
;; (add-hook 'web-mode-hook 'my-setup-indent)
