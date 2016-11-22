(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                        ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(menu-bar-mode -1)

;; zenburn theme
(package-install 'zenburn-theme)
(load-theme 'zenburn t)

(set-default-font "Source Code Pro 13")

;; ?
(put 'upcase-region 'disabled nil)

;; avy
(package-install 'avy)
(require 'avy)

;; ivy
;; (package-install 'swiper)
;; (package-install 'counsel)
;; (require 'ivy)
;; (ivy-mode 1)

;; help
(require 'helm-config)

(global-set-key (kbd "M-g w") 'avy-goto-word-1)

;; ido
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

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

     (define-key evil-normal-state-map (kbd "C-t") 'helm-projectile-find-file)

     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))

;; evil-leader
(package-install 'evil-leader)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key "n" 'next-error)
(evil-leader/set-key "p" 'previous-error)
(evil-leader/set-key "d" 'intero-goto-definition)

;; magit
(package-install 'magit)

;; writeroom-mode
(package-install 'writeroom-mode)

;; projectile
(package-install 'projectile)
(require 'projectile)

(package-install 'helm-projectile)
(require 'helm-projectile)
(helm-projectile-on)

;; intero
(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)
(evil-leader/set-key "t" 'intero-type-at)

;; haskell unicode
(setq haskell-font-lock-symbols t)
