;; Enable minitest mode on ruby mode
(add-hook 'ruby-mode-hook 'minitest-mode)

(eval-after-load 'minitest
  '(minitest-install-snippets))
