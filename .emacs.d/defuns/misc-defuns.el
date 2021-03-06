
(defun wm/insert-date-time ()
  "Insert current date-time string in full ISO 8601 format.
Example: 2010-11-29T23:23:35-08:00"
   (concat
    (format-time-string "%Y-%m-%dT%T")
    ((lambda (x) (concat (substring x 0 3) ":" (substring x 3 5)))
     (format-time-string "%z"))))


(defun today-is ()
  "Return current year-month-day."
  (format-time-string "%Y-%m-%d"))

(defun wm/hugo-new ()
  (concat (file-name-as-directory "~/Dropbox/Org/wmanger_blog/content/post")
            (today-is) ".md"))

(defun wm/staff-meeting ()
  (concat (file-name-as-directory "~/Dropbox/Org/work/staff_meetings")
            (today-is) ".org"))

(defun wm/clip-file ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      (file-name-directory default-directory)
                    (buffer-file-name))))
    (when filename
      (x-select-text filename))))

(defun wm/kill-other-buffers ()
    "Kill all other buffers -- but not dired, scratch, or shells."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))
