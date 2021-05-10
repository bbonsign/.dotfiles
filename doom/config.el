;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Brian Bonsignore"
      user-mail-address "bonsignore.brian@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 13 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; Line numbers are pretty slow all around. The performance boost of
;; disabling them outweighs the utility of always keeping them on.
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq left-fringe-width 10
      right-fringe-width 10)

(setq which-key-idle-delay 0.25
      which-key-idle-secondary-delay 0.25)

(setq evil-goggles-duration 0.4)

(setq +lua-lsp-dir "~/.lua-language-server")


;; Shows buffers when using Spc-, for example
(setq +ivy-buffer-preview t)

(setq company-idle-delay 0.2)

(after! magit
  (setq magit-diff-refine-hunk 'all))

(dimmer-configure-which-key)
(dimmer-mode t)

;; Switch to the new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)


;; Show how many lines are in a folded region
(setq vimish-fold-show-lines t)


(all-the-icons-ivy-rich-mode 1)
(ivy-rich-mode 1)
;; Fuzzier matching: https://oremacs.com/2016/01/06/ivy-flx/
;; (setq ivy-re-builders-alist
;;       '((t . ivy--regex-fuzzy)))

(use-package! writeroom-mode
  :config
  (setq +zen-text-scale 1.2
        writeroom--mode-line-showing t
        writeroom-mode-line-toggle-position 'mode-line-format)
  (map! :leader
        :desc "mode line" "tm" #'writeroom-toggle-mode-line))

(map! "C-y" #'evil-scroll-line-up
      :nvomeg "C-t" #'evil-scroll-line-down
      :nvomeg "C-e" #'evil-end-of-line)


(map! :map evilem-map
      "b" #'evilem-motion-backward-WORD-begin
      "w" #'evilem-motion-forward-WORD-begin
      "j" #'evilem-motion-next-line-first-non-blank
      "k" #'evilem-motion-previous-line-first-non-blank)


(map! :leader
      :desc "Dired" :nv "od" #'dired-jump
      :desc "Resume last search" "hh" #'ivy-resume)


(setq avy-style 'at)
(setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?: ?w ?e ?r ?t ?y ?u ?i ?o ?x ?c ?v ?b ?n ?m ?q ?p ?z ?m))

;; Increases left-fringe-width for magit overview. It wasn't shoing the collapse
;; markers very clearly by default
(defun my-magit-mode-hook ()
  "Custom `magit-mode' behaviours."
  (setq left-fringe-width 20
        right-fringe-width 0))

(add-hook 'magit-mode-hook 'my-magit-mode-hook)


(use-package! dired
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" #'dired-up-directory
    "l" #'dired-find-file))

(defun my-dired-mode-hook ()
  "My `dired' mode hook."
  ;; To hide dot-files by default
  (dired-hide-dotfiles-mode))

(add-hook 'dired-mode-hook #'my-dired-mode-hook)

(map! :map dired-mode-map
      :n "." #'dired-hide-dotfiles-mode)


(global-prettify-symbols-mode -1)


(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)



(use-package! tree-sitter
  :when (bound-and-true-p module-file-suffix)
  :hook (prog-mode . tree-sitter-mode)
  :hook (tree-sitter-after-on . tree-sitter-hl-mode)
  :config
  (require 'tree-sitter-langs)
  (defadvice! doom-tree-sitter-fail-gracefully-a (orig-fn &rest args)
    "Don't break with errors when current major mode lacks tree-sitter support."
    :around #'tree-sitter-mode
    (condition-case e
        (apply orig-fn args)
      (error
       (unless (string-match-p (concat "^Cannot find shared library\\|"
                                       "^No language registered\\|"
                                       "cannot open shared object file")
                            (error-message-string e))
            (signal (car e) (cadr e)))))))


(add-hook 'evil-jumps-post-jump-hook #'evil-scroll-line-to-center)
(add-hook 'better-jumper-mode-hook #'evil-scroll-line-to-center)
;; (add-hook 'magit-mode-hook (lambda () (magit-delta-mode +1)))


(load! "+org")
