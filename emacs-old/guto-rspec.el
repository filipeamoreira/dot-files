;; Adds extra bindings to rspec mode
(eval-after-load 'rspec-mode
  '(add-hook 'rspec-mode-hook
             (lambda ()
               (enable-rspec-verify-single))))


(add-hook 'rspec-mode-hook
          (lambda ()
            (enable-rspec-verify-single)))

(setq rspec-use-bundler-when-possible nil)

(defun enable-rspec-verify-single ()
  (interactive)
  "Adds binding to rspec-verify-single function"
  (message "adding custom keymap for rspec-verify-single")
  (local-set-key (kbd "C-c , s") 'rspec-verify-single))

;; (add-hook 'rspec-mode (lambda ()
;;                         (message "Setting binding")
;;                         (define-key rspec-mode-verifible-keymap (kbd "s") 'rspec-verify-single)))

;; Reload mode
(defun reload-mode (mode-name)
  "Reload given mode"
  (interactive)
  (eval mode-name)
  (eval mode-name))
