(defvar org-journal-file "~/data/org/journal.org"
  "Path to OrgMode journal file.")

(defvar org-journal-date-format "%d/%m/%Y"
  "Date format string for journal headings.")

(defun journal ()
  "Create a new diary entry for today."
  (interactive)
  (switch-to-buffer (find-file org-journal-file))
  (widen)
  ;;(let ((today (format-time-string org-journal-date-format)))
  (let ((isearch-forward t) (today (format-time-string org-journal-date-format)))
    (beginning-of-buffer)
    (unless (org-goto-local-search-headings today nil t)
      ((lambda ()
         (insert "\n")
         (org-insert-heading)
         (insert today)
         (insert "\n\n"))))
    (org-show-entry)
    (org-narrow-to-subtree)
    (end-of-buffer)
    (insert "\n  ")
    (auto-fill-mode 1)
    (set-fill-column 100)))

(global-set-key (kbd "C-c j") 'journal)

(defun find-org-markers (regexp)
  (occur regexp)
  (pop-to-buffer "*Occur*"))

(defun find-top-org-headers ()
  (interactive)
  (find-org-markers "^\\*[^*]"))

(defun find-all-org-headers ()
  (interactive)
  (find-org-markers "^\\*+"))

(defun find-org-links ()
  (interactive)
  (find-org-markers "\\[\\["))
