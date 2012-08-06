;; el-get
;; So the idea is that you copy/paste this code into your *scratch* buffer,
;; hit C-j, and you have a working developper edition of el-get.
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

(el-get 'sync)

;; Install packages using el-get
(setq el-get-sources ())

;; list all packages you want installed
(setq my-el-get-packages
      (append
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-el-get-packages)
