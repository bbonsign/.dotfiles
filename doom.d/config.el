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
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;;; Added by bbonsign


(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling

;; Temporary expand-region binding
;; (global-set-key (kbd "C-x C-=") 'er/expand-region)


;; Example rebindings: https://github.com/rschmukler/doom.d/blob/master/%2Bbindings.el
;; Also https://github.com/hlissner/doom-emacs/blob/develop/core/core-keybinds.el
;; for source of doom key binds
 ;; I want C-a and C-e to be a little smarter. C-a will jump to
 ;; indentation. Pressing it again will send you to the true bol. Same goes
 ;; for C-e, except it will ignore comments and trailing whitespace before
 ;; jumping to eol.
(map!
 :ig     "C-x C-s"  #'save-buffer
 :i      "C-d" #'delete-char
 :i      "C-a" #'doom/backward-to-bol-or-indent
 :ivgno  "C-e" #'doom/forward-to-last-non-comment-or-eol
 :i      "C-u" #'doom/backward-kill-to-bol-and-indent
 :in     "C-k" #'kill-line
 :invgo  "C-=" #'er/expand-region
 "C-x C-=" #'text-scale-increase
 "C-x C--" #'text-scale-decrease
 "C-x C-0" #'text-scale-adjust
 :ing    "C-\\" #'fixup-whitespace
 ;; alternative to C-g
 :invgo "C-q" #'evil-escape

 :vn        "z s" #'flyspell-correct-at-point
 )

(map! :leader
      :desc "M-x"           "SPC"   #'execute-extended-command
      :desc "popup-toggle"  "`"     #'+popup/toggle
      :desc "popup-raise"  "~"     #'+popup/raise
      :prefix-map ("TAB" . "workspace")
          :desc "ibuffer for workspace"  "i" #'+ibuffer-current-workspace)

(setq-default which-key-idle-delay 0.5)

(use-package! evil
  :config
  (setq ;;cursor appearance
        evil-default-cursor '+evil-default-cursor-fn
        evil-emacs-state-cursor  '((bar . 1) +evil-emacs-cursor-fn)))

(setq org-agenda-files (list "~/Dropbox/org/work.org"
                             "~/Dropbox/org/projects.org"
                             "~/Dropbox/org/personal.org"))

(when IS-MAC
  (setq trash-directory "~/.Trash"))

;; (use-package! flyspell-correct-popup
;;   :bind ("C-;" . flyspell-correct-wrapper)
;;   :init
;;   (setq flyspell-correct-interface #'flyspell-correct-ivy))

(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face "#000000")))
