;; Load grammar checking tool language tool (https://www.languagetool.org/)
;; (require 'langtool)
;; (setq langtool-language-tool-jar "/usr/local/Cellar/languagetool/3.4/libexec/languagetool-commandline.jar")
;; (setq langtool-java-bin "/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home/bin/java")

;; (setq langtool-default-language "en-GB")
;; (setq langtool-mother-tongue "en")


;; Flyspell
(add-hook 'org-mode-hook
          (lambda()
            (flyspell-mode 1)))

(setq ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra")
      ispell-change-dictionary "en_GB")

(define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct)

(provide 'guto-spell-checking)
;;; guto-spell-checking.el ends here
