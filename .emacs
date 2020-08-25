(setq package-archives
      '(("elpa" . "http://elpa.emacs-china.org/gnu/")
        ("melpa" . "http://elpa.emacs-china.org/melpa/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(require 'use-package)

(add-to-list 'load-path "~/.emacs.d/otherPackages")


;; Start - Japanese holidays
(eval-after-load "holidays"
  '(progn
     (require 'japanese-holidays)
     (setq calendar-holidays ; 他の国の祝日も表示させたい場合は適当に調整
           (append japanese-holidays holiday-local-holidays holiday-other-holidays))
     (setq mark-holidays-in-calendar t) ; 祝日をカレンダーに表示
     ;; 土曜日・日曜日を祝日として表示する場合、以下の設定を追加します。
     ;; デフォルトで設定済み
     (setq japanese-holiday-weekend '(0 6)     ; 土日を祝日として表示
           japanese-holiday-weekend-marker     ; 土曜日を水色で表示
           '(holiday nil nil nil nil nil japanese-holiday-saturday))
     (add-hook 'calendar-today-visible-hook 'japanese-holiday-mark-weekend)
     (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend)))

;; “きょう”をマークするには以下の設定を追加します。
 (add-hook 'calendar-today-visible-hook 'calendar-mark-today)
;; End - Japanese holidays

;; Start - Recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; End - Recent files

;; Start - Tab
(setq-default indent-tabs-mode nil) ; tab 改为插入空格
(setq c-basic-offset 4) ; c c++ 缩进4个空格
(setq default-tab-width 4)
;; End - Tab

;; Start - Magit
(global-set-key "\C-x\ \C-g" 'magit-status)
;; End - Magit

;; Start - Dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Stay Hungry, Stay Foolish")
(setq dashboard-items '((recents  . 20)
                        (agenda . 5)))
;; End - Dashboard

;; Start - counsel-dash
(setq counsel-dash-browser-func 'browse-web)
(setq counsel-dash-common-docsets '("C++"))
(global-set-key "\C-c\ \C-v\ q" 'counsel-dash)
;; End - counsel-dash

;; Start - Youdao
(use-package youdao-dictionary
  :ensure t
  :bind (("C-c t y" . youdao-dictionary-search-at-point+)))
;; End - Youdao

;; Start - C++ 11 Syntax highlighting
(modern-c++-font-lock-global-mode t)
;; End - C++ 11 Syntax highlighting

(setq leetcode-prefer-language "c++")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(package-selected-packages
   '(modern-cpp-font-lock use-package counsel-dash dashboard magit leetcode markdown-mode org ##))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight normal :height 158 :width normal)))))
