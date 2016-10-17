(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                        ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;; ace-mode
(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; ?
(put 'upcase-region 'disabled nil)

;; zenburn theme
(package-install 'zenburn-theme)
(load-theme 'zenburn t)

;; evil
(package-install 'evil)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;; intero
(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)

;; haskell unicode
(setq haskell-font-lock-symbols t)
