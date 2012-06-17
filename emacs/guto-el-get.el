;; el-get

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(el-get 'sync) (el-get 'wait)

;; Install packages using el-get
(setq el-get-sources
      '((:name apel)))

;; list all packages you want installed
(setq my-el-get-packages
      (append
       '(wanderlust)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-el-get-packages)
