;;; package --- Summary
;;; Commentary:
;;; Code:
(global-auto-revert-mode t)
(global-visual-line-mode 1)
(setq visible-bell t)

(set-face-attribute 'default nil :height 140)

(global-hl-line-mode 1)
(set-face-attribute 'hl-line nil :foreground nil :background "#111" :inherit nil)

(setq display-time-day-and-date t)

(defvar display-time-24hr-format)
(setq display-time-24hr-format nil)

(display-time)

(show-paren-mode 1)

(provide 'setup-appearance)
;;; setup-appearance.el ends here
