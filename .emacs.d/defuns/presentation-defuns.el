;;; defuns that modify the ui in some way

(defun wm/toggle-linum ()
  "Turn on linum if it is off and vice versa."
  (interactive)
  (if (null global-linum-mode)
      (global-linum-mode 1)
      (global-linum-mode 0)))
