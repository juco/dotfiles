(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("40f6a7af0dfad67c0d4df2a1dd86175436d79fc69ea61614d668a635c2cd94ab" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default)))
 '(ns-use-native-fullscreen nil)
 '(package-selected-packages
   (quote
    (tern-auto-complete tern js2-mode zenburn-theme powerline powerline-evil helm-ls-git helm evil sublime-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Boot with evil mode
(require 'evil)
(evil-mode 1)

;; Js indent level
(setq js-indent-level 2)

;; JS mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Tern
(global-auto-complete-mode t)
(setenv "PATH" (concat "/Users/juco/.nvm/versions/node/v5.4.1/bin/:" (getenv "PATH")))
(add-to-list 'load-path "/Users/juco/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
(add-hook 'js-mode-hook (lambda () (tern-mode t)))

;; line numbers
(global-linum-mode t)

;; Load theme
(load-theme 'zenburn t)

;; Toggle maximize
(toggle-frame-maximized)

;; line numbers
(linum-mode)

;; Helm
(require 'helm-config)
(require 'helm-ls-git)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-autoresize-mode 1)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
