(defun unbind-bindings ()
  "Unbind some bindings to some buggy functions."
  ;; (global-set-key (kbd "#") 'insert-hash-key)
  (global-set-key (kbd "#")
                  (lambda ()
                    (interactive)
                    (insert "#"))))
(add-hook 'ruby-tools-mode (unbind-bindings))

(defun insert-# ()
  (insert "#"))
