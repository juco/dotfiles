;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; PATH
(let ((path (shell-command-to-string ". ~/.bash_profile; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path 
        (append
         (split-string-and-unquote path ":")
         exec-path)))

;; Some term enhancement
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(defadvice ansi-term (before force-bash)
  (interactive (list "/bin/zsh")))
(ad-activate 'ansi-term)

;; Other configs
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)

;; UI configurations
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
(global-linum-mode 1)
;; (add-to-list 'default-frame-alist '(font . "Iosevka-13"))
(add-to-list 'default-frame-alist '(font . "Overpass Mono-13"))
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))

;; Allow hash to be entered  
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))

;; ruler
;;(require 'fill-column-indicator)
;;(setq-default fill-column 80)
(setq fci-rule-width 1)
(add-hook 'prog-mode-hook 'turn-on-fci-mode)
(add-hook 'text-mode-hook 'turn-on-fci-mode)

(defun on-off-fci-before-company(command)
  (when (string= "show" command)
    (turn-off-fci-mode))
  (when (string= "hide" command)
    (turn-on-fci-mode)))

(advice-add 'company-call-frontends :before #'on-off-fci-before-company)

;; pdf-tools fix
(add-hook 'doc-view-mode-hook
  (lambda ()
    (linum-mode -1)
  ))

(use-package fill-column-indicator
  :ensure t
  :init
  (setq-default fill-column 80))

;; magit
(use-package magit
  :ensure t
  :config
  (setq git-magit-status-fullscreen t))
(use-package evil-magit
  :ensure t
  :init)
;;(require 'evil-magit)

;; indentation
(defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
  )
(my-setup-indent 2)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq-default evil-shift-width 2)

;; Splash Screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; Happy Hacking")

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode  1)

;; NeoTree
(use-package neotree
  :ensure t
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

; Startup dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;; Set the title
(setq dashboard-banner-logo-title "Emacs ftw")
(setq dashboard-startup-banner 'logo)
(setq dashboard-center-content t)
(setq dashboard-items '((recents  . 5)
                        (projects . 5)
                        (bookmarks . 5)
                        (agenda . 5)
                        (registers . 5)))
(setq dashboard-set-navigator t)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
;; (setq dashboard-init-info "Try not to break it this time")
;; ;; (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
;;                                                    :height 1.1
;;                                                    :v-adjust -0.05
;;                                                    :face 'font-lock-keyword-face))

; Vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-escape
  :ensure t
  :init
  :config
  (evil-escape-mode 1))
(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

; Keychord
(use-package key-chord
  :ensure t
  :init
  :config
  (key-chord-mode 1))

(key-chord-define evil-insert-state-map "jj" 'evil-normal-state) 

;; Anzu for search matching
(use-package anzu
  :ensure t
  :config
  (global-anzu-mode 1)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace] 'anzu-query-replace))

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)

  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
  )

(use-package doom-modeline
      :ensure t
      :defer t
      :hook (after-init . doom-modeline-init))

;; Helm
(use-package helm
  :ensure t
  :init
  (setq helm-M-x-fuzzy-match t
	helm-mode-fuzzy-match t
	helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
	helm-locate-fuzzy-match t
	helm-semantic-fuzzy-match t
	helm-imenu-fuzzy-match t
	helm-completion-in-region-fuzzy-match t
	helm-candidate-number-list 80
	;helm-split-window-in-side-p t
	helm-move-to-line-cycle-in-source t
	helm-echo-input-in-header-line t
	helm-autoresize-max-height 0
	helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

;; RipGrep
(use-package helm-rg :ensure t)

;; Dumb jump
(use-package dumb-jump :ensure t)

;; Smart parents
(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode 1))

;; Projectile
(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

;; Helm Projectile
(use-package helm-projectile
  :ensure t
  :init
  (setq helm-projectile-fuzzy-match t)
  (setq projectile-project-search-path '("~/projects/" "~/work/"))
  :config
  (helm-projectile-on))

;; All The Icons
(use-package all-the-icons :ensure t)

;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

;; Functions
;; ---------
(defun spacemacs/toggle-maximize-buffer ()
  "Maximize buffer"
  (interactive)
  (if (and (= 1 (length (window-list)))
           (assoc ?_ register-alist))
      (jump-to-register ?_)
    (progn
      (window-configuration-to-register ?_)
      (delete-other-windows))))

(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer 
          (delq (current-buffer) 
                (remove-if-not 'buffer-file-name (buffer-list)))))

;; Custom keybinding
(use-package general
  :ensure t
  :config (general-define-key
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  "/"   '(helm-rg :which-key "ripgrep")
  "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
  "SPC" '(helm-M-x :which-key "M-x")
  ;; Parents
  "g"   '(:which-key "git")
  "c"   '(:which-key "comments")
  "b"   '(:which-key "buffers")
  "p"   '(:which-key "project")
  "w"   '(:which-key "windows")
  "f"   '(:which-key "files")
  "a"   '(:which-key "utils")
  "s"   '(:which-key "spell")
  "q"   '(:which-key "quit")
  "e"   '(:which-key "errors")
  "z"   '(:which-key "zoom")
  ;; Project
  "pf"  '(helm-projectile-find-file :which-key "find files")
  "pp"  '(helm-projectile-switch-project :which-key "switch project")
  "pb"  '(helm-projectile-switch-to-buffer :which-key "switch buffer")
  "pr"  '(helm-show-kill-ring :which-key "show kill ring")
  ;; Comments
  "cl"  '(comment-line :which-key "comment line")
  ;; Dired
  "d"  '(dired :which-key "dired")'
  ;; Jump to definition
  "jj"  '(dumb-jump-go :which-key "jump to")
  "jb"  '(dumb-jump-back :which-key "jump back")
  ;; Buffers
  "bb"  '(helm-mini :which-key "helm buffers")
  "bl"  '(list-buffers :which-key "buffer list")'
  "bm"  '(kill-other-buffers :which-key "kill others")
  "bk"  '(kill-buffer :which-key "kill a buffer")
  ;; Flycheck errors
  "el"  '(flycheck-list-errors :which-key "list errors")
  ;; Git
  "gl" '(magit-log-current :which-key "log branch")
  "gb" '(magit-blame :which-key "blame")
  "gs" '(magit-status :which-key "git status")
  "gf" '(magit-log-buffer-file :which-key "file history")
  ;; Window
  "wl"  '(windmove-right :which-key "move right")
  "wh"  '(windmove-left :which-key "move left")
  "wk"  '(windmove-up :which-key "move up")
  "wm"  '(spacemacs/toggle-maximize-buffer :which-key "maximize")
  "wj"  '(windmove-down :which-key "move bottom")
  "w/"  '(split-window-right :which-key "split right")
  "w-"  '(split-window-below :which-key "split bottom")
  "wd"  '(delete-window :which-key "delete window")
  "qz"  '(delete-frame :which-key "delete frame")
  "qq"  '(kill-emacs :which-key "quit")
  ;; Spelling
  "sb"  '(ispell-buffer :which-key "spell buffer")
  "sw"  '(ispell-word :which-key "spell word")
  ;; NeoTree
  "ft"  '(neotree-toggle :which-key "toggle neotree")
  "z+"  '(text-scale-increase :which-key "zoom in")
  "z-"  '(text-scale-decrease :which-key "zoom out")
  ;; Others
  "at"  '(ansi-term :which-key "open terminal")
))

;; Fancy titlebar for MacOS
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)

;; Window resizing
(global-set-key (kbd "A-<down>") 'enlarge-window)
(global-set-key (kbd "A-<up>") 'shrink-window)
(global-set-key (kbd "A-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "A-<right>") 'shrink-window-horizontally)
 
;; Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(add-to-list 'display-buffer-alist
             `(,(rx bos "*Flycheck errors*" eos)
              (display-buffer-reuse-window
               display-buffer-in-side-window)
              (side            . bottom)
              (reusable-frames . visible)
              (window-height   . 0.33)))

;; Prettier JS
;; (use-package prettier-js
;;   :ensure t)
;; (setq prettier-js-args '(
;;   "--trailing-comma" "all"
;;   "--bracket-spacing" "false"
;; ))
;; (add-hook 'js2-mode-hook 'prettier-js-mode)
;; (add-hook 'web-mode-hook 'prettier-js-mode)

;; LSP
(use-package lsp-mode
  :ensure t
  :init
  (add-hook 'prog-major-mode #'lsp-prog-major-mode-enable))

(use-package lsp-ui
  :ensure t
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; Company mode
(use-package company
:ensure t
:init
(setq company-minimum-prefix-length 3)
(setq company-auto-complete nil)
(setq company-idle-delay 0)
(setq company-require-match 'never)
(setq company-frontends
  '(company-pseudo-tooltip-unless-just-one-frontend
    company-preview-frontend
    company-echo-metadata-frontend))
(setq tab-always-indent 'complete)
(defvar completion-at-point-functions-saved nil)
:config
(global-company-mode 1)
(define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
(define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)
(define-key company-active-map (kbd "S-TAB") 'company-select-previous)
(define-key company-active-map (kbd "<backtab>") 'company-select-previous)
(define-key company-mode-map [remap indent-for-tab-command] 'company-indent-for-tab-command)
(defun company-indent-for-tab-command (&optional arg)
  (interactive "P")
  (let ((completion-at-point-functions-saved completion-at-point-functions)
    	(completion-at-point-functions '(company-complete-common-wrapper)))
	(indent-for-tab-command arg)))

(defun company-complete-common-wrapper ()
	(let ((completion-at-point-functions completion-at-point-functions-saved))
	(company-complete-common))))

(use-package company-lsp
:ensure t
:init
(push 'company-lsp company-backends))
 
;;;;;;;;;;;;;;;;;;;;;;;
;; Language Supports ;;
;;;;;;;;;;;;;;;;;;;;;;;
 
;; JavaScript
(use-package js2-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (setq-default js2-basic-offset 2))
(use-package tern :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" default)))
 '(package-selected-packages
   (quote
    (dashboard rjsx-mode coffee-mode docker exec-path-from-shell pdf-tools org-bullets smartparens jsx-mode dumb-jump circe yaml-mode treemacs dockerfile-mode evil-magit magit fill-column-indicator helm-ag key-chord doom-modeline tern js2-mode spaceline company-lsp company lsp-ui lsp-mode flycheck general which-key neotree helm-projectile projectile helm-rg helm doom-themes anzu evil-escape evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#212121" :foreground "#eeffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "nil" :family "Iosevka"))))
 '(font-lock-constant-face ((t (:foreground "#C792EA"))))
 '(font-lock-keyword-face ((t (:foreground "#2BA3FF" :slant italic))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#2BA3FF" :slant italic :weight normal))))
 '(font-lock-string-face ((t (:foreground "#C3E88D"))))
 '(font-lock-type-face ((t (:foreground "#FFCB6B"))))
 '(font-lock-variable-name-face ((t (:foreground "#FF5370"))))
 '(helm-rg-active-arg-face ((t (:foreground "LightGreen"))))
 '(helm-rg-file-match-face ((t (:foreground "LightGreen" :underline t))))
 '(helm-rg-preview-line-highlight ((t (:background "LightGreen" :foreground "black"))))
 '(mode-line ((t (:background "#191919" :box nil))))
 '(mode-line-inactive ((t (:background "#282828" :foreground "#5B6268" :box nil)))))
