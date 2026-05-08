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

(setq package-install-upgrade-built-in t)

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

(use-package nerd-icons)

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

;;; =========================
;;; ivy-rich
;;; =========================
(use-package ivy-rich
  :init (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history)))

;;; ==========================
;;; Helpful
;;; ==========================

(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))




;;; =========================
;;; ORG-ROAM
;;; =========================

(use-package compat
  :ensure t)

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

;; -------------------------------
;; Org base setup
;; -------------------------------

(use-package org
  :ensure t
  :config

  ;; Org files
  (setq org-directory "~/org/")
  (setq org-agenda-files
        '("~/org/tasks.org"
          "~/org/projects.org"
          "~/org/habits.org"
          "~/org/inbox.org"))

  ;; Logging
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  ;; TODO workflow
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "NEXT(n)"
           "WAIT(w@)"
           "|"
           "DONE(d)"
           "CANCELLED(c@)")))

  ;; Priorities
  (setq org-highest-priority ?A)
  (setq org-default-priority ?C)
  (setq org-lowest-priority ?E)

  ;; Tags
  (setq org-tag-alist
        '(("@work" . ?w)
          ("@home" . ?h)
          ("@errand" . ?e)
          ("urgent" . ?u)
          ("idea" . ?i)))

  ;; Agenda appearance
  (setq org-agenda-span 'day)
  (setq org-agenda-start-on-weekday nil)
  (setq org-agenda-start-with-log-mode t)
  (setq org-agenda-window-setup 'current-window)

  ;; Sorting
  (setq org-agenda-sorting-strategy
        '((agenda habit-down time-up priority-down category-keep)
          (todo priority-down category-keep)
          (tags priority-down category-keep)
          (search category-keep)))

  ;; Habits
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)

  ;; Habit display
  (setq org-habit-graph-column 60)

  ;; Custom agenda commands
  (setq org-agenda-custom-commands
        '(("d" "Dashboard"
           ((agenda "" ((org-deadline-warning-days 7)))
            (todo "NEXT")
            (tags-todo "urgent")
            (todo "WAIT")))

          ("w" "Work Tasks"
           tags-todo "@work")

          ("h" "Home Tasks"
           tags-todo "@home")

          ("n" "Next Tasks"
           todo "NEXT"))))

;; -------------------------------
;; Useful keybindings
;; -------------------------------

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(catppuccin-theme counsel doom-modeline helpful ivy-rich org-roam
		      org-roam-ui rainbow-delimiters transient)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
