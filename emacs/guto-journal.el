(defvar org-journal-dir "~/Dropbox/sync/org")
(defvar org-journal-file "~/Dropbox/sync/org/journal.org"
  "Path to OrgMode journal file.")

(defvar org-journal-date-format "%Y%m%d - %A"
  "Date format string for journal headings.")

(defvar org-journal-time-format "%H:%M"
  "Date format string for journal headings.")

(defun journal ()
  "Create a new diary entry for today."
  (interactive)
  (switch-to-buffer (find-file org-journal-file))
  (widen)
  ;;(let ((today (format-time-string org-journal-date-format)))
  (let ((isearch-forward t) (today (format-time-string org-journal-date-format))
        (now (format-time-string org-journal-time-format)))

    (beginning-of-buffer)
    (unless (org-goto-local-search-headings today nil t)
      ((lambda ()
         (insert "\n")
         (org-insert-heading)
         (insert today)
         (insert "\n"))))
    (org-show-entry)
    (org-narrow-to-subtree)
    (end-of-buffer)
    (org-insert-subheading t)
    ;; (insert "\n  - " )
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
