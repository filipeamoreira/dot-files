(require 'deft)

(setq deft-extension "txt")
;;(setq deft-extensions '("txt" "md" "markdown" "taskpaper")
(setq deft-text-mode 'markdown-mode)
(setq deft-use-filename-as-title t)
(setq deft-directory "~/Dropbox/sync/notes")

(global-set-key [f8] 'deft)
