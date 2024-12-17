;; to remove the ugly defaults
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; (load-theme 'wombat)

(set-face-attribute 'default nil :height 160)

;; line numbers
(defun lines()
  "A command to enable relative line numbers."
  (interactive)
  (display-line-numbers-mode)
  (menu-bar--display-line-numbers-mode-relative)
  (line-number-mode)
  )

(defun my-code-block(language block-name)
  "A custom function to insert code blocks in org mode, \ninvoke using 'C-u M-x'"
  (interactive "Mlanguage: \nMcode-block-name: ")
  (insert (concat "#+NAME: " block-name))
  (insert (concat "\n#+BEGIN_SRC " language))
  (insert "\n\n#+END_SRC")
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" default))
 '(inhibit-default-init t)
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-echo-area-message "Emman-pip")
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(package-selected-packages '(which-key web-mode elpy gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; theme

(use-package gruvbox-theme
  :ensure
  :init
  (load-theme 'gruvbox-dark-soft))


;; to use with bindings
;; flymake-goto-next-error
;; flymake-goto-prev-error
(add-hook 'flymake-mode-hook
	  (lambda() (local-set-key (kbd "M-n") 'flymake-goto-next-error)))
(add-hook 'flymake-mode-hook
	  (lambda() (local-set-key (kbd "M-p") 'flymake-goto-prev-error)))

;; add eglot hook to python-mode
(add-hook 'python-mode-hook 'eglot-ensure)


;; for org-mode python
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; elpy
(use-package elpy
  :ensure t)

(use-package magit
  :ensure t)

