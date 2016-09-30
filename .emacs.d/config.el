
;; remove UI components that I don't want to see
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; no startup commentary
(setq inhibit-startup-message t
    inhibit-startup-echo-area-message t
    inhibit-startup-message t)

(global-auto-revert-mode t)
(global-visual-line-mode 1)

(setq visible-bell nil)
(setq ring-bell-function 'ignore)

(set-face-attribute 'default nil :height 140)

(global-hl-line-mode 1)
(set-face-attribute 'hl-line nil :foreground nil :background "#111" :inherit nil)

(setq display-time-day-and-date t)

(defvar display-time-24hr-format)
(setq display-time-24hr-format nil)

(display-time)

(show-paren-mode 1)

;; These need to be loaded early.
;; I need to split this out

(use-package skewer-mode
  :ensure t)

(use-package powerline
  :ensure t)

(use-package projectile
  :ensure t)

(use-package helm-projectile
  :ensure t)

(use-package try 
  :ensure t)

(use-package which-key 
  :ensure t 
  :config 
  (which-key-mode))

(use-package helm
  :ensure t)

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
(add-to-list 'projectile-globally-ignored-directories "node_modules")
(add-to-list 'projectile-globally-ignored-directories "build/js")
(add-to-list 'projectile-globally-ignored-directories "docs/dash")
(add-to-list 'projectile-globally-ignored-directories "vendor")
(helm-projectile-on)


(use-package helm-ag
  :ensure t)

(use-package yasnippet
  :defer t
  :ensure t
  :config
  (progn 
    (setq yas-snippet-dirs
          '("~/.emacs.d/snippets"                 ;; personal snippets
            "~/repos/yasnippet-snippets"          ;; the default collection
    ))
    (yas-global-mode 1)
    )
)

(use-package flycheck
  :ensure t
  :defer t
  :config
  (setq-default flycheck-emacs-lisp-load-path 'inherit)
  (setq flycheck-jscs-esprima "=esprima-fb")
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (flycheck-add-mode 'javascript-jscs 'web-mode))

(use-package org
    :ensure t
    :bind 
    (("C-c c" . org-capture)
    ("C-c a" . org-agenda)
    ("C-c l" . org-store-link)))

(global-set-key (kbd "C-c n")
    (lambda ()
        (interactive)
        (find-file "~/Dropbox/org/notes.org")))

(global-set-key (kbd "C-c w")
    (lambda ()
        (interactive)
        (find-file "~/Dropbox/org/work.org")))


(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq evil-want-C-u-scroll t)

(use-package evil
  :ensure t
  :config
    ;; Cursor Colors
    (setq evil-emacs-state-cursor '("red" box))
    (setq evil-normal-state-cursor '("darkgray" box))
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("red" bar))
    (setq evil-replace-state-cursor '("red" bar))
    (setq evil-operator-state-cursor '("red" hollow))
    ;; ESC Quits
    (define-key evil-normal-state-map [escape] 'keyboard-quit)
    (define-key evil-visual-state-map [escape] 'keyboard-quit)
    (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
    ;; Window Management
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
    ;; Always use Evil if I can
    (evil-mode t))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package magit 
  :ensure t 
  :bind ("C-x g" . magit-status))

(use-package git-gutter
    :ensure t
    :config
    (global-git-gutter-mode t)
)

(use-package eshell
  :ensure t)

(defun eshell/clear ()
  "Clear like most terminal emulators."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

(use-package smartparens
  :ensure t
  :config 
  (smartparens-global-mode 1))

;;  (use-package emms-setup
;;    :ensure t
;;    :config
;;    ((emms-standard)
;;    (emms-default-players)))

(use-package helm-dash
   :ensure t)

(setq helm-dash-browser-func 'eww)



(use-package smart-mode-line
  :ensure t)

(setq sml/no-confirm-load-theme t)
(setq sml/theme 'respectful)
(sml/setup)

(setq wakatime-api-key "33c08473-7680-4203-b97d-64120cd743c1")
(setq wakatime-cli-path "/usr/local/bin/wakatime")

(global-wakatime-mode)

;;(add-to-list 'auto-mode-alist '("\\go\src\github.com\powerchordinc" . wakatime-mode))
;;(add-to-list 'auto-mode-alist '("\\Dropbox\org\work.org" . wakatime-mode))
;;(add-to-list 'auto-mode-alist '("\\Dropbox\org\notes.org" . wakatime-mode))
;;(add-to-list 'auto-mode-alist '("\\dotfiles\*" . wakatime-mode))

(defun turn-on-wakatime ()
    (cond ((string-match "dotfiles\\|github\.com/\powerchordinc\\|work\.org" buffer-file-name)
           (progn ((wakatime-turn-on t))))))

;;(add-hook 'eshell-mode-hook #'wakatime-mode)
;;(add-hook 'org-mode-hook 'turn-on-wakatime)
;;(add-hook 'js-mode-hook 'turn-on-wakatime)
;;(add-hook 'go-mode-hook 'turn-on-wakatime)
;;(add-hook 'sass-mode-hook 'turn-on-wakatime)

(use-package twittering-mode
  :ensure t
  :defer t)

(use-package yaml-mode
  :ensure t
  :defer t)

(use-package go-autocomplete
  :ensure t)

(defvar settings-dir)
(defvar defuns-dir)

(setq settings-dir
      (expand-file-name "settings/" user-emacs-directory))

;; set up the settings folder
(add-to-list 'load-path settings-dir)

;; keep custom settings out of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(defun flycheck-list-errors-only-when-errors ()
  "Open a error list buffer when there are errors to consider."
  (if flycheck-current-errors
      (flycheck-list-errors)
    (-when-let (buffer (get-buffer flycheck-error-list-buffer))
      (dolist (window (get-buffer-window-list buffer))
        (quit-window nil window)))))

;; (require 'setup-appearance)
;; (require 'setup-package)
;; (require 'setup-smartparens)
;; (require 'setup-emms)
;; (require 'setup-helm)
;; (require 'setup-evil)
(require 'setup-erc)
;; (require 'setup-eshell)


;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'wombat t)

(require 'auto-complete-config)

(use-package auto-complete
  :ensure t
  :config
    (ac-config-default)
  )

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

(require 'multi-term)
(setq multi-term-program "/bin/zsh")

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(defun set-exec-path-from-shell-PATH ()
  "Get the shell path from PATH."
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell)
    (message "%s" (propertize path-from-shell 'face '(:foreground "red")))
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))


(add-hook 'term-mode-hook
    (lambda ()
      (setq term-buffer-maximum-size 10000)))

(add-hook 'dired-mode-hook (lambda ()
                             (dired-hide-details-mode 1)))

(setenv "GOPATH" "/Users/waltermanger/go")

(use-package go-mode
  :ensure t)

(require 'go-mode-autoloads)

(use-package go-eldoc
  :ensure t)

(defun wm/go-mode-hook()
  "GOLang Hook."
  (setq evil-shift-width tab-width)
  ;;(local-set-key (kbd "M-.") 'godef-jump)
  (go-eldoc-setup)
  (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
  ;; (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))

(add-hook 'go-mode-hook 'wm/go-mode-hook)

;; Whitespace
(setq-default indent-tabs-mode  nil
              default-tab-width 2)

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(defun wm/web-mode-hook()
  "Web-Mode Hook"
  (setq evil-shift-width tab-width)
  (setq web-mode-code-indent-offset tab-width)
  (add-hook 'before-save-hook #'flycheck-list-errors-only-when-errors))

(defun wm/js2-mode-hook()
  "js2 Hook"
  (js2-minor-mode 1)
  (setq evil-shift-width tab-width)
  (add-hook 'before-save-hook #'flycheck-list-errors-only-when-errors))

(add-hook 'js-mode-hook
          (lambda()
            (js2-minor-mode 1)
            (setq evil-shift-width tab-width)
            ))

(add-hook 'js2-mode-hook 'wm/js2-mode-hook)

(setq js2-highlight-level 3)

(add-hook 'web-mode-hook 'wm/web-mode-hook)


;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
 
(setq make-backup-files nil)

;;(add-hook 'sass-mode-hook
;;    (function (lambda()
;;        (setq evil-shift-width 2))))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(setq ispell-program-name "/usr/local/bin/aspell")

;; Let's use projectile globally

(projectile-global-mode)

;; OrgModeSettings
(eval-after-load 'org '(require 'setup-orgmode))

;; defuns (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Let's edit all text in Emacs please
(require 'edit-server)
(edit-server-start)
