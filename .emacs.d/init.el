;;; package -- summary
;;; Commentary: 
;;; Code:
(toggle-scroll-bar -1) 

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)

(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))


(setq evil-want-C-u-scroll t)

(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

(visual-line-mode 1)
(tool-bar-mode -1)

(require 'evil)
(evil-mode t)

;; Cursor Colors for Modes (Only works in GUI)
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("darkgray" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

;;; esc quits

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(load-theme 'atom-dark t)


(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
     (define-key evil-normal-state-map (kbd "C-n") 'neotree-toggle)))

;;; yasnippet
;;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)

(add-to-list 'load-path "~/misc/emacs/go-autocomplete.el")
;(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(add-hook 'prog-mode-hook 'linum-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

(require 'multi-term)
(setq multi-term-program "/bin/zsh")

(require 'evil-surround)
(global-evil-surround-mode 1)

(add-hook 'term-mode-hook
	  (lambda ()
	    (setq term-buffer-maximum-size 10000)))

(setenv "GOPATH" "/Users/waltermanger/go")

(add-to-list 'load-path "~/misc/emacs/go-mode.el")
(require 'go-mode-autoloads)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) 
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; Whitespace
(setq-default indent-tabs-mode  nil
              default-tab-width 2)


(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

(add-hook 'js-mode-hook
          (lambda()
            (js2-minor-mode 1)
            (setq evil-shift-width default-tab-width)
            ))

(add-hook 'js2-mode-hook
          (lambda()
            (setq evil-shift-width default-tab-width)
            (ac-js2-mode t)))

;(add-hook 'js-mode-hook
;          (lambda() flycheck-mode t))
; (add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-highlight-level 3)

; (add-hook 'go-mode-hook 'flycheck-mode)

(defun my-go-mode-hook ()
  (message "running my-go-mode-hook")
  ; Call gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save))
(add-hook 'go-mode-hook 'my-go-mode-hook)


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
(setq helm-M-x-fuzzy-match t)

(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(helm-mode 1)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(setq make-backup-files nil) 


(global-hl-line-mode 1)
(set-face-background 'hl-line "#202")
(set-face-attribute 'default nil :height 120)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-day-and-date t)
 '(electric-indent-mode nil)
 '(fci-rule-color "#373b41")
 '(flycheck-disabled-checkers (quote (javascript-jshint)))
 '(js2-basic-offset 2)
 '(js2-include-browser-externs nil)
 '(js2-include-jslint-globals nil)
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(js2-strict-trailing-comma-warning nil))

;(add-hook 'js-mode-hook
;    (function (lambda()
;        (setq evil-shift-width 2)))
;
;(add-hook 'js2-mode-hook
;    (function (lambda()
;        (setq evil-shift-width 2)))
;
;(add-hook 'javascript-mode
;    (function (lambda()
;        (setq evil-shift-width 2))))

(add-hook 'sass-mode-hook
    (function (lambda()
        (setq evil-shift-width 2))))

(global-flycheck-mode 1)

; (require 'projectile)
(projectile-global-mode)
; (setq projectile-completion-system 'helm)
; (helm-projectile-on)
(require 'org)
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-agenda-files (list "~/org/notes.org"
                             "~/org/blog.org"))
;; fontify code in code blocks
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(provide 'init)

(setq display-time-day-and-date t
                display-time-24hr-format t)
             (display-time)

;;; init.el ends here
