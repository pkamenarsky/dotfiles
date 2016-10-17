(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                        ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; zenburn theme
(package-install 'zenburn-theme)
(load-theme 'zenburn t)

;; ?
(put 'upcase-region 'disabled nil)

;; avy
(package-install 'avy)
(require 'avy)

(global-set-key (kbd "M-g w") 'avy-goto-word-1)

;; evil
(package-install 'evil)
(setq evil-want-C-u-scroll t)
;; (setq evil-search-module 'evil-search)
(require 'evil)
(evil-mode 1)

;; projectile
(package-install 'projectile)
(require 'projectile)

;; intero
(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)

;; haskell unicode
(setq haskell-font-lock-symbols t)
