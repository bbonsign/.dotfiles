;;; +org.el -*- lexical-binding: t; -*-

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")


(after! org
  (setq org-agenda-start-with-log-mode t
        org-log-done 'time
        org-log-into-drawer t)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
          (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MEETING")))

  (setq org-todo-keyword-faces
        '(("TODO" :foreground "forest green" :weight bold)
          ("NEXT" :foreground "blue" :weight bold)
          ("WAITING" :foreground "orange" :weight bold)
          ("HOLD" :foreground "purple" :weight bold)
          ("MEETING" :foreground "forest green" :weight bold)))

  ;; (setq org-todo-state-tags-triggers
  ;;       (quote (("CANCELLED" ("CANCELLED" . t))
  ;;               ("WAITING" ("WAITING" . t))
  ;;               ("HOLD" ("WAITING") ("HOLD" . t))
  ;;               (done ("WAITING") ("HOLD"))
  ;;               ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
  ;;               ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
  ;;               ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

  (setq org-tag-alist
        '((:startgroup)
          ;; mutually exclusive tags here
          (:endgroup)
          ("@errand" . ?E)
          ("@home"   . ?H)
          ("@work"   . ?W)
          ("idea"    . ?i)))

  (setq org-agenda-files
        `(,(concat org-directory "tasks.org")
          ,(concat org-directory "archive.org")))

  (setq org-refile-targets
        '((nil :maxlevel . 1)
          (org-agenda-files :maxlevel . 1)))

  (advice-add 'org-refile :after 'org-save-all-org-buffers))
