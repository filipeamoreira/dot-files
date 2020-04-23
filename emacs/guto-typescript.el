(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (prelude-ts-mode-defaults))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)
