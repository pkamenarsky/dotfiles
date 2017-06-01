(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                        ("marmalade" . "http://marmalade-repo.org/packages/")
                        ("melpa" . "http://melpa.org/packages/")))

(package-initialize)

(set-default-font "Source Code Pro 13")

(set-default 'truncate-lines t)

;; autosave & backup
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; ?
(put 'upcase-region 'disabled nil)

;; no tabs
(setq-default indent-tabs-mode nil)

;; autosave
(package-install 'real-auto-save)
(require 'real-auto-save)
(add-hook 'prog-mode-hook 'real-auto-save-mode)

(setq real-auto-save-interval 1)

;; evil
(package-install 'evil)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-i-jump nil)
;; (setq evil-search-module 'evil-search)
(require 'evil)
(evil-mode 1)
(setq evil-esc-delay 0)

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
(evil-leader/set-key "g" 'intero-goto-definition)
(evil-leader/set-key "i" 'intero-info)
(evil-leader/set-key "f" 'helm-etags-select)

;; company-mode
(package-install 'company)

;; magit
(package-install 'magit)

(package-install 'langtool)

;; writeroom-mode
(package-install 'writeroom-mode)

;; projectile
(package-install 'projectile)
(require 'projectile)

(package-install 'helm-projectile)
(require 'helm-projectile)
(helm-projectile-on)

;; org-bullets
(package-install 'org-bullets)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(add-hook 'org-mode-hook (lambda ()
  (progn
    ;; Snipped
    ;; (auto-fill-mode t)

    ;; Spelling
    (flyspell-mode t)

    ;; Grammar
    (require 'langtool)
    (setq langtool-java-classpath "/usr/local/share/languagetool/*"))))

;; javascript
(package-install 'tide)
(require 'tide)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(setq js-indent-level 2)

;; idris
(package-install 'idris-mode)
(require 'idris-mode)
(idris-define-evil-keys)

;; purescript
(package-install 'purescript-mode)
(require 'purescript-mode)

(package-install 'psc-ide)
(require 'psc-ide)
(customize-set-variable 'psc-ide-rebuild-on-save t)
(add-hook 'purescript-mode-hook
  (lambda ()
    (psc-ide-mode)
    (company-mode)
    (flycheck-mode)
    (turn-on-purescript-indentation)))

;; intero
(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)
(evil-leader/set-key "t" 'intero-type-at)

;; haskell unicode
(setq haskell-font-lock-symbols t)

;; generate haskell tags on save
(setq haskell-tags-on-save t)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; fullscreen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
;; (scroll-bar-mode -1)
(toggle-frame-fullscreen)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" default)))
 '(flycheck-javascript-flow-args nil)
 '(package-selected-packages
   (quote
    (flow-mode flycheck-flow psc-ide purescript-mode company projectile evil zenburn-theme writeroom-mode swiper-helm solarized-theme org-bullets magit intero helm-projectile focus evil-leader counsel avy)))
 '(psc-ide-rebuild-on-save t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; zenburn theme
(package-install 'zenburn-theme)
(load-theme 'zenburn)
