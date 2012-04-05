(set-default-font "Meslo LG M DZ-13:normal")

;;(setq mac-allow-anti-aliasing t)
;;(setq mac-command-modifier 'meta)
;;(setq mac-option-modifier 'none))

;; Display the time in the mode line
(setq display-time-24hr-format t)
(display-time)

;; Backup directory
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
  
;; Better continuity for scrolling. Also adds 10 line margin at the bootom while schrolling.
(setq scroll-conservatively 10)
(setq scroll-margin 7)
(setq inhibit-startup-screen 1)

;; ido mode always creates new files or use C-j to force file creation
(setq ido-create-new-buffer 'always)

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Represent undo-history as an actual tree (visualize with C-x u)
(setq undo-tree-mode-lighter "")
(global-undo-tree-mode)

(global-linum-mode t)

(provide 'guto/misc)
