;;; config --- benj's emacs config

;;; Commentary:
;;; this config tries to import the best of vim

;;; Code:
;; Package manager stuff--------------------------
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
						 '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; General Configs------------------------------

;; Keep the config file clean-------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Stop saving ~ files on . folder
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Get rig of extra UI elements-----------------
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
(setq ring-bell-function (quote ignore))
(set-face-attribute 'default nil :family "Fira Mono")
(set-face-attribute 'default nil :height 120)
(set-face-attribute 'default nil :weight 'light)
(setq-default left-margin-width 5 right-margin-width 5)
(set-window-buffer nil (current-buffer))
(fringe-mode 0)
(setq-default cursor-type 'bar)
(setq-default line-spacing 30)
(setq-default tab-width 2)
(show-paren-mode 1)
(setq dired-listing-switches "-alh --group-directories-first")
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable Emacs auto-pair-----------------------
(electric-pair-mode 1)

(use-package auto-complete
  :ensure t
  :config
	(ac-config-default)
	(global-auto-complete-mode t))

(use-package base16-theme
	:ensure t)

(use-package counsel-projectile
	:ensure t
	:config
	(counsel-projectile-on))

(use-package flycheck
  :ensure t
  :config
	(global-flycheck-mode))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

(use-package magit
  :ensure t)

(use-package moe-theme
  :ensure t)

(use-package php-mode
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (projectile-mode 1))

(use-package pug-mode
  :ensure t
  :config
  (setq pug-backspace-backdents-nesting nil))

(use-package sass-mode
  :ensure t
  :config
  (defun configure-auto-complete-for-sass ()
    (add-to-list 'ac-sources 'ac-source-css-property))
  (add-hook 'sass-mode-hook 'configure-auto-complete-for-sass)
  (add-to-list 'ac-modes 'sass-mode))

(use-package try
  :ensure t)

(use-package vue-mode
  :ensure t)

(use-package web-mode
  :ensure t)
