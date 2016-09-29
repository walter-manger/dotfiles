;;; setup-helm --- Summary
;;; Commentary:
;;; Experimenting with theming and other neat helm things
;;; Code:
(require 'helm)

(helm-autoresize-mode 1)
(setq helm-display-header-line nil)
(set-face-attribute 'helm-source-header nil
                    :foreground "white"
                    :background "gray27"
                    :height 2)
(set-face-attribute 'helm-selection nil
                    :background "DeepSkyBlue2"
                    :foreground "black")
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-min-height 30)
(setq helm-split-window-in-side-p t)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)

(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(helm-mode 1)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(provide 'setup-helm)
;;; setup-helm ends here
