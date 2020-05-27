;;; package --- Summary
;;; copied from: https://github.com/munen/emacs.d/blob/master/init.el
;;; Commentary:
;;   - All of the configuration is within `~/.dotfiles/emacs/config.org`
;;; Code:


(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"       . "https://elpa.gnu.org/packages/")
                         ("org"       . "https://orgmode.org/elpa/")
                         ("melpa"     . "https://melpa.org/packages/")))
(unless package--initialized (package-initialize))

;; Make sure 'use-package' is available
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Configure `use-package' prior to loading it.
(eval-and-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))

(require 'org)

(org-babel-load-file "~/.emacs.d/config.org")


;;; init.el ends here
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
