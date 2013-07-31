;; Poor's man rspec
;; source: http://crypt.codemancers.com/posts/2013-03-28-poor-mans-rspec-mode-for-emacs/
(require 'compile)
;; Find root directory by searching for Gemfile
(defun* get-closest-gemfile-root (&optional (file "Gemfile"))
  (let ((root (expand-file-name "/")))
    (loop 
     for d = default-directory then (expand-file-name ".." d)
     if (file-exists-p (expand-file-name file d))
     return d
     if (equal d root)
     return nil)))

(defun rspec-compile-file ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   ) t))

(defun rspec-compile-on-line ()
  (interactive)
  (compile (format "cd %s;bundle exec rspec %s -l %s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   (line-number-at-pos)
                   ) t))

(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c l") 'rspec-compile-on-line)
            (local-set-key (kbd "C-c k") 'rspec-compile-file)
            ))

;; Rspec setup

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of ZSH issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

;;  * toggle back and forth between a spec and it's target (bound to
;;    `\C-c ,t`)
;;
;;  * verify the spec file associated with the current buffer (bound to `\C-c ,v`)
;;
;;  * verify the spec defined in the current buffer if it is a spec
;;    file (bound to `\C-c ,v`)
;;
;;  * verify the example defined at the point of the current buffer (bound to `\C-c ,s`)
;;
;;  * re-run the last verification process (bound to `\C-c ,r`)
;;
;;  * toggle the pendingness of the example at the point (bound to
;;    `\C-c ,d`)
;;
;;  * disable the example at the point by making it pending
;;
;;  * reenable the disabled example at the point
;;
;;  * run all specs related to the current buffer (`\C-c ,m`)
;;
;;  * run the current spec and all after it (`\C-c ,c`)
;;
;;  * run spec for entire project (bound to `\C-c ,a`)
;;
