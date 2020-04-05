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
(add-hook 'css-mode-hook 'real-auto-save-mode)
(add-hook 'org-mode-mode-hook 'real-auto-save-mode)

(setq real-auto-save-interval 1)

;; copy & paste
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

;; rainbow-delimiters
(package-install 'rainbow-delimiters)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; (setq interprogram-cut-function 'paste-to-osx)
;; (setq interprogram-paste-function 'copy-from-osx)

;; modalka
;; (package-install 'modalka)
;; (global-set-key (kbd ";") #'modalka-mode)
;;
;; (modalka-define-kbd "SPC" "C-SPC")
;; ;; '
;; (modalka-define-kbd "," "C-,")
;; ;; -
;; (modalka-define-kbd "/" "M-.")
;; (modalka-define-kbd "." "C-.")
;; (modalka-define-kbd ":" "M-;")
;; (modalka-define-kbd ";" "C-;")
;; (modalka-define-kbd "?" "M-,")
;;
;; (modalka-define-kbd "0" "C-0")
;; (modalka-define-kbd "1" "C-1")
;; (modalka-define-kbd "2" "C-2")
;; (modalka-define-kbd "3" "C-3")
;; (modalka-define-kbd "4" "C-4")
;; (modalka-define-kbd "5" "C-5")
;; (modalka-define-kbd "6" "C-6")
;; (modalka-define-kbd "7" "C-7")
;; (modalka-define-kbd "8" "C-8")
;; (modalka-define-kbd "9" "C-9")
;;
;; (modalka-define-kbd "a" "C-a")
;; (modalka-define-kbd "b" "C-b")
;; (modalka-define-kbd "c c" "C-c C-c")
;; (modalka-define-kbd "c k" "C-c C-k")
;; (modalka-define-kbd "c v" "C-c C-v")
;; (modalka-define-kbd "d" "C-d")
;; (modalka-define-kbd "e" "C-e")
;; (modalka-define-kbd "f" "C-f")
;; (modalka-define-kbd "g" "C-g")
;; (modalka-define-kbd "h" "M-h")
;; (modalka-define-kbd "i" "C-i")
;; (modalka-define-kbd "j" "M-j")
;; (modalka-define-kbd "k" "C-k")
;; (modalka-define-kbd "l" "C-l")
;; (modalka-define-kbd "m" "C-m")
;; (modalka-define-kbd "n" "C-n")
;; (modalka-define-kbd "o" "C-o")
;; (modalka-define-kbd "p" "C-p")
;; (modalka-define-kbd "q" "M-q")
;; (modalka-define-kbd "r" "C-r")
;; (modalka-define-kbd "s" "C-s")
;; (modalka-define-kbd "t" "C-t")
;; (modalka-define-kbd "u" "C-u")
;; (modalka-define-kbd "v" "C-v")
;; (modalka-define-kbd "w" "C-w")
;; (modalka-define-kbd "x ;" "C-x C-;")
;; (modalka-define-kbd "x e" "C-x C-e")
;; (modalka-define-kbd "x o" "C-x C-o")
;; (modalka-define-kbd "y" "C-y")
;; (modalka-define-kbd "z" "M-z")
;;
;; (modalka-define-kbd "A" "M-SPC")
;; (modalka-define-kbd "B" "M-b")
;; (modalka-define-kbd "C" "M-c")
;; (modalka-define-kbd "D" "M-d")
;; (modalka-define-kbd "E" "M-e")
;; (modalka-define-kbd "F" "M-f")
;; (modalka-define-kbd "G" "C-`")
;; (modalka-define-kbd "H" "M-H")
;;
;; ;; J
;; (modalka-define-kbd "K" "M-k")
;; (modalka-define-kbd "L" "M-l")
;; (modalka-define-kbd "M" "M-m")
;; (modalka-define-kbd "N" "M-n")
;; (modalka-define-kbd "O" "M-o")
;; (modalka-define-kbd "P" "M-p")
;;
;; (modalka-define-kbd "R" "M-r")
;; (modalka-define-kbd "S" "M-S")
;; (modalka-define-kbd "T" "M-t")
;; (modalka-define-kbd "U" "M-u")
;; (modalka-define-kbd "V" "M-v")
;; (modalka-define-kbd "W" "M-w")
;; ;; X
;; (modalka-define-kbd "Y" "M-y")
;; (modalka-define-kbd "Z" "C-z")

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
     (define-key evil-motion-state-map ";" 'evil-ex)
     (define-key evil-motion-state-map ":" 'evil-find-char)

     (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
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
(evil-leader/set-key "m" 'magit-status)

;;
(package-install 'highlight-indentation)
(require 'highlight-indentation)

(set-face-background 'highlight-indentation-face "#4a4a4a")
(set-face-background 'highlight-indentation-current-column-face "#4a4a4a")

(setq whitespace-style '(face spaces empty space-mark))
(setq whitespace-display-mappings '((space-mark 32 [8231])))
(setq whitespace-line-column 80)
;; (global-whitespace-mode t)

;;
(package-install 'markdown-mode)
(require 'markdown-mode)

;; company-mode
(package-install 'company)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort))

;; magit
(package-install 'magit)

(package-install 'langtool)

;; writeroom-mode
;; (package-install 'writeroom-mode)

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

(add-hook 'text-mode-hook (lambda ()
  (progn
    ;; Spelling
    (flyspell-mode t)

    ;; Grammar
    (require 'langtool)
    (setq langtool-java-classpath "/usr/local/share/languagetool/*"))))

;; javascript
(package-install 'rjsx-mode)
(require 'rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))

;; javascript better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

;; (package-install 'js2-refactor)
;; (require 'js2-refactor)

(package-install 'xref-js2)
(require 'xref-js2)

;; (add-hook 'js2-mode-hook #'js2-refactor-mode)
;; (js2r-add-keybindings-with-prefix "C-c C-r")
;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; typescript
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

;; TSX
(package-install 'web-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

(setq typescript-indent-level
  (or (plist-get (tide-tsfmt-options) ':indentSize) 2))

(setq js2-basic-offset 2)
(setq js-indent-level 2)
(setq typescript-indent-level 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-indent-style 2)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

;; css
(setq css-indent-offset 2)

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

(setq psc-ide-use-npm-bin t)

(define-abbrev-table 'global-abbrev-table '(
    ("xxx" "×")
    ("aaa" "∀")
    ("ddd" "Δ")
    ("ggg" "Γ")
    ("ooo" "○")
    ))

;; dante
(package-install 'dante)
(add-hook 'haskell-mode-hook 'dante-mode)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(evil-leader/set-key "t" 'dante-type-at)
;; (evil-leader/set-key "g" 'intero-goto-definition)

;; intero
(package-install 'intero)
;; (add-hook 'haskell-mode-hook 'intero-mode)
;; (evil-leader/set-key "t" 'intero-type-at)
;; (evil-leader/set-key "g" 'intero-goto-definition)

;; haskell unicode
;; (setq haskell-font-lock-symbols t)

;; generate haskell tags on save
;; (setq haskell-tags-on-save t)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; clojure
(package-install 'cider)
(require 'cider)

(package-install 'clojure-mode)
(require 'clojure-mode)

(package-install 'smartparens)
(require 'smartparens-config)

(package-install 'aggressive-indent)
(require 'aggressive-indent)

(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)

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
    ("76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "0c9f63c9d90d0d135935392873cd016cc1767638de92841a5b277481f1ec1f4a" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" "0c32e4f0789f567a560be625f239ee9ec651e524e46a4708eb4aba3b9cdc89c5" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "5e52ce58f51827619d27131be3e3936593c9c7f9f9f9d6b33227be6331bf9881" "2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" "cdfc5c44f19211cfff5994221078d7d5549eeb9feda4f595a2fd8ca40467776c" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" default)))
 '(package-selected-packages
   (quote
    (aggressive-indent smartparens clojure-mode cider dante web-mode rjsx-mode highlight-indentation xref-js2 js2-mode highlight-indent-guides markdown-mode rainbow-delimiters idris-mode tide langtool real-auto-save psc-ide purescript-mode company projectile evil zenburn-theme writeroom-mode swiper-helm solarized-theme org-bullets magit intero helm-projectile focus evil-leader counsel avy)))
 '(psc-ide-rebuild-on-save t)
 '(safe-local-variable-values (quote ((dante-methods stack)))))

;; zenburn theme
(package-install 'zenburn-theme)
;; (setq zenburn-override-colors-alist
;;       '(("zenburn-bg" . nil)))
(load-theme 'zenburn)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-space ((t (:bold f :background nil :foreground "#4a4a4a")))))
