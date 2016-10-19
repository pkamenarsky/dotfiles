(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                        ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(menu-bar-mode -1)

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

(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-\\") 'evil-window-vsplit)
     (define-key evil-normal-state-map (kbd "C-_") 'evil-window-split)

     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))

;; evil-leader
(package-install 'evil-leader)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

;; magit
(package-install 'magit)

;; writeroom-mode
(package-install 'writeroom-mode)

;; projectile
(package-install 'projectile)
(require 'projectile)

;; intero
(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)
(evil-leader/set-key "t" 'intero-type-at)

;; haskell unicode
(setq haskell-font-lock-symbols t)
