;;; package --- setup-eshell
;;; Commentary:
;;; Code:
(require 'eshell)

(defun eshell/clear ()
  "Clear like most terminal emulators."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(provide 'setup-eshell)

;;; setup-eshell ends here
