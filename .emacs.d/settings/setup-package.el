;;; setup-package --- Summary
;;; Commentary:
;;; Absolute base need for getting packages from melpa
;;; Code:
(require 'package)
;;(require 'dash)

(setq package-archives '(("melpa"     . "http://melpa.milkbox.net/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)

(unless (file-exists-p "~/.emacs.d/elpa/archives/melpa")
  (package-refresh-contents))

(defun packages-install (packages)
  (--each packages
    (when (not (package-installed-p it))
      (package-install it)))
  (delete-other-windows))

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(provide 'setup-package)
;;; setup-package.el ends here
