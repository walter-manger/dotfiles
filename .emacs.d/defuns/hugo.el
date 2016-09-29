

(defun hyde/serve ()
  "Serves hugo to localhost in an asynchronous process. If already started, stops and restarts."
  (interactive)
  (hyde/stop-serve)
  (setq hyde/serve-process
   (start-process-shell-command "hugo/serve" "*hugo/serve*"
    (format "cd %s && %s" (expand-file-name hyde-home) hyde/serve-command))))
