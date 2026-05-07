;; Emacs from scratch System Crafters

;; Video 1
;; Eacs clean ui
(setq inhibit-startup-message t)

;; -1 means disable
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

;; setup visible bell instead of audiobell when ever we reach file end
(setq visible-bell t)

;; disable line numbers in some modes (added)
(dolist (mode '(org-mode-hook
                term-mode-hook
		shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Setup font size
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 110)

;; Theme best available
;; 1. tango
;; 2. tango-dark
;; ....... some more shit themes
;; (load-theme 'tango-dark t)

;; CUSTOM THEME

;; Doom modeline (modern status bar)
(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 15
        doom-modeline-bar-width 3
        doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-minor-modes nil))

;; Catppuccin theme
(use-package catppuccin-theme
  :config
  (setq catppuccin-flavor 'mocha) ;; options: mocha / macchiato / frappe / latte
  (load-theme 'catppuccin t)
  (setq catppuccin-italic-comments t
        catppuccin-italic-variables t))

;; Emacs shortcuts
;; Ctrl-h f for describe
;; Ctrl-X Ctrl-e for auto reload

;; Use package-manager
;; default pacakge-manager list-packages

;; using melpa PM
(require 'package)

;; sources of packages
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                          ("org" . "https://orgmode.org/elpa/")
                          ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-linux plateforms
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; for checking waht happens uncommnet this
;; (use-package command-log-mode)

;; Ivy for Completions
(use-package ivy
  :diminish
  :bind (("C-f" . swiper)
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

;; Counsel improves M-x and other commands (added)
(use-package counsel
  :after ivy
  :config
  (counsel-mode 1))

;; Swiper search already used by ivy binding (kept for completeness)
(use-package swiper
  :after ivy)


;; Video 2

;; Line numbers Turn on
(column-number-mode)
(global-display-line-numbers-mode t)

;; disable line numbers for some mode
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda()(display-line-numbers-mode 0)))
  )

;; nesting of brackets
(use-package rainbow-delimiters
  :hook (pro-mode . rainbow-delimiters-mode))
