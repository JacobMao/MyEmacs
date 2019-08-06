(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t)
 '(package-selected-packages (quote (markdown-mode)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(setq x-select-enable-clipboard t)
(global-hl-line-mode t)

(set-frame-font "Menlo-16" nil t)

;;打开上次的文件记录
(load "desktop") 
(desktop-load-default)
(desktop-read)
;;当emacs退出时保存文件打开状态
(add-hook 'kill-emacs-hook
          '(lambda()(desktop-save "~/")))

;; We don't want to type yes and no all the time so, do y and n
(defalias 'yes-or-no-p 'y-or-n-p)

(setq auto-save-default nil)
