;;; =========================
;;; PACKAGE SYSTEM (FIRST)
;;; =========================

(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org"   . "https://orgmode.org/elpa/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;;; =========================
;;; UI BASICS
;;; =========================

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)

;; Disable annoying bell
(setq ring-bell-function 'ignore)

;; Font (stable across frames)
(add-to-list 'default-frame-alist
             '(font . "JetBrainsMono Nerd Font-11"))


;;; =========================
;;; LINE NUMBERS
;;; =========================

(global-display-line-numbers-mode t)
(column-number-mode)

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;;; =========================
;;; THEME
;;; =========================

(use-package catppuccin-theme
  :init
  (setq catppuccin-flavor 'mocha
        catppuccin-italic-comments t
        catppuccin-italic-variables t)
  :config
  (load-theme 'catppuccin t))


;;; =========================
;;; MODELINE
;;; =========================

(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 15
        doom-modeline-bar-width 3
        doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-minor-modes nil))


;;; =========================
;;; COMPLETION (IVY STACK)
;;; =========================

(use-package ivy
  :diminish
  :bind (("C-S" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package counsel
  :after ivy
  :config
  (counsel-mode 1))

(use-package swiper
  :after ivy)


;;; =========================
;;; SYNTAX HIGHLIGHTING
;;; =========================

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


;;; =========================
;;; WHICH-KEY (HELP MENU)
;;; =========================

(use-package which-key
  :init
  (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0))
