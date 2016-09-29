;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'org)
(require 'org-bullets)

(defvar org-work-file)
(setq org-work-file "~/Dropbox/Org/work.org")

(setq org-log-done t)

(setq org-default-notes-file "~/Dropbox/org/notes.org")

(setq org-agenda-files (list "~/Dropbox/org/notes.org"
                             "~/Dropbox/org/blog.org"
                             "~/Dropbox/org/work.org"))

(setq org-archive-location (concat org-directory "/notes-archive"))

;; Work File

;; fontify code in code blocks
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh         . t)
   (js         . t)
   (emacs-lisp . t)
   (clojure    . t)
   (python     . t)
   (C          . t)
   (dot        . t)
   (scheme        . t)
   (css        . t)))

;; use org-bullets in org-mode
(add-hook 'org-mode-hook (lambda ()
                           (org-bullets-mode 1)
                           (variable-pitch-mode t)
                           ))

(defvar org-capture-templates)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?" :prepend t)
        ("n" "Note" entry (file+headline org-default-notes-file "Notes")
         "* %?")
        ("b" "Blog Idea" entry (file+headline org-default-notes-file "Blog Ideas")
         "* %?")
        ("z" "Work Task" entry (file+headline org-work-file "Work Tasks")
         "* TODO %?" :prepend t)
        ("l" "Listen" entry (file+headline org-default-notes-file "Listen")
         "* %?")
        ("r" "Read" entry (file+headline org-default-notes-file "Read")
         "* %?")
        ("w" "Watch" entry (file+headline org-default-notes-file "Watch")
        "* %?")
        ("W" "Work Note" entry (file+headline org-work-file "Work Notes")
        "* %?")
        ("p" "Post" plain (file (wm/hugo-new))
        (file "~/.emacs.d/org-templates/blogpost.orgcaptmpl"))
    ))

(setq org-columns-default-format
      "%25ITEM %TODO %3PRIORITY %10CLOCKSUM(Total Time) %CLOCKSUM_T(Time Today)")

(require 'harvest)
(add-hook 'org-clock-in-hook 'harvest)
(add-hook 'org-clock-out-hook 'harvest-clock-out)

(setq org-return-follows-link t)

(provide 'setup-orgmode)
;;; setup-orgmode.el ends here
