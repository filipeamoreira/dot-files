;; Interactively Do Things
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".org" ".rb" ".py" ".emacs" ".el"))

;; Custom bindings
(add-hook 'ido-define-mode-map-hook 'ido-my-keys)

(defun ido-my-keys()
  ;; keys used in file and dir environment
  (when (memq ido-cur-item '(file dir))
    ;; (define-key ido-mode-map  "C-w" 'ido-delete-backward-updir)
    (define-key ido-mode-map (kbd "C-w") 'ido-delete-backward-updir)
    ))


(ido-mode t)
