;; (defun coffee-custom ()
;;   "coffee-mode-hook"

;;   ;; CoffeeScript uses two spaces.
;;   (make-local-variable 'tab-width)
;;   (set 'tab-width 2)

;;   ;; If you don't have js2-mode
;;   (setq coffee-js-mode 'javascript-mode)

;;   ;; If you don't want your compiled files to be wrapped
;;   (setq coffee-args-compile '("-c" "--bare"))

;;   ;; *Messages* spam
;;   (setq coffee-debug-mode t)

;;   ;; Emacs key binding
;;   (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)

;;   ;; Riding edge.
;;   (setq coffee-command "~/dev/coffee")

;;   ;; Compile '.coffee' files on every save
;;   (and (file-exists-p (buffer-file-name))
;;        (file-exists-p (coffee-compiled-file-name))
;;        (coffee-cos-mode t)))

;; (add-hook 'coffee-mode-hook 'coffee-custom)


(custom-set-variables '(coffee-tab-width 2))
