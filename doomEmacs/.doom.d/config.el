;;; $DOOMDIR/config.el

(setq doom-theme 'doom-ayu-dark)

(setq display-line-numbers-type t)

(setq org-directory "~/org/")

(setq projectile-project-search-path
      '("~/dotfiles/"
        "~/org"
        "~/notes"
        "~/languages/"
        ("~/github/" . 2)))

;; TODO settings
(after! org
  ;; TODO keywords
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "ALL(a)"
           "INPROGRESS(i)"
           "WAITING(w)"
           "|"
           "DONE(d)"
           "CANCELED(c)"
           "IMPOSSIBLE(m)")))

  ;; TODO keyword faces
  (setq org-todo-keyword-faces
        '(("TODO"        . (:foreground "#ff6c6b" :weight bold))
          ("ALL"         . (:foreground "#ECBE7B" :weight bold))
          ("INPROGRESS"  . (:foreground "#51afef" :weight bold))
          ("WAITING"     . (:foreground "#c678dd" :weight bold))
          ("DONE"        . (:foreground "#98be65" :weight bold))
          ("CANCELED"    . (:foreground "#5B6268" :weight bold))
          ("IMPOSSIBLE"  . (:foreground "#ff5555"
                             :background "#282c34"
                             :weight bold
                             :strike-through t))))

  ;; Make priority cookies inherit the default face.
  (custom-set-faces!
    '(org-priority :inherit default))

  ;; Colorize priority cookies.
  (font-lock-add-keywords
   'org-mode
   '(("\\(\\[#A\\]\\)"
      1 '(:foreground "#d2a6ff" :weight bold) prepend)
     ("\\(\\[#B\\]\\)"
      1 '(:foreground "#59c2ff" :weight bold) prepend)
     ("\\(\\[#C\\]\\)"
      1 '(:foreground "#95e6cb" :weight bold) prepend))))
