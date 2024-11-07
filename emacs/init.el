;; initialize emacs packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; evil mode
(require 'evil)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(org-bullets evil-org evil)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; gui settings ~~~
;; don't show the ugly toolbar in gui emacs
(tool-bar-mode -1)
(toggle-scroll-bar -1)
;; show line nums
(global-display-line-numbers-mode 1)
;; fonts
(set-frame-font "Geneva 14" nil t)
(setq org-fontify-todo-headline t)
(with-eval-after-load 'org-faces
  (progn
    (set-face-foreground 'org-level-1 "NavajoWhite3")
    (set-face-foreground 'org-level-2 "RosyBrown2")
    (set-face-foreground 'org-level-3 "Black")
    (custom-set-faces
    '(org-done ((t (:foreground "gray52" :background "honeydew1"))))
    '(org-headline-done ((t (:foreground "gray52" :italic t))))
    '(org-todo ((t (:foreground "black" :background "MistyRose1" :underline t))))
    '(org-headline-todo ((t (:foreground "black" ))))
    '(org-special-keyword ((t (:foreground "gray52" ))))
    '(org-date ((t (:foreground "LightSteelBlue2" ))))
    )))


;; org-mode
(setq org-agenda-files '("~/heart-hands/03.projects/TASKBOARDS.org"))
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 2))))
(with-eval-after-load 'org
  (bind-key "s-k" 'org-todo)
  (bind-key "s-3" 'org-agenda-list)
  (bind-key "s-s" 'org-schedule)
  (bind-key "s-M" 'org-refile))
(with-eval-after-load 'org
  (bind-key "s-k" 'org-todo)
    (bind-key "s-3" 'org-agenda-list)
    (bind-key "s-s" 'org-schedule)
    (bind-key "s-M" 'org-refile)
  )

;; quick open specific files
(keymap-global-set "C-c o"
    (lambda () (interactive) (find-file "~/heart-hands/03.projects/TASKBOARDS.org")))
(keymap-global-set "C-c i"
    (lambda () (interactive) (find-file "~/.emacs")))
