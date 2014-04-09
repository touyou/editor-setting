(cd "~/")
(add-to-list 'load-path "~/.emacs.d/elisp")

;============================================================================
; language coding system
;============================================================================
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(setq file-name-coding-system 'shift_jis)

;============================================================================
; font
;============================================================================
(set-default-font "Consolas 12")
(if (display-graphic-p)
    (set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("KonatuTohaba"."unicode-bmp")
                  ))
(if (display-graphic-p)
    (set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  '("KonatuTohaba"."unicode-bmp")
                  ))

;============================================================================
; frame
;============================================================================
(custom-set-variables
 '(inhibit-startup-screen t))
(menu-bar-mode nil)
(tool-bar-mode nil)
(setq transient-mark-mode t)
(global-font-lock-mode t)
(add-to-list 'load-path "~/.emacs.d/elisp/color-theme-solarized")
(when (require 'color-theme)
  (color-theme-initialize)
  (when (require 'color-theme-solarized)
    (color-theme-solarized-dark)))
(setq initial-frame-alist
      (append
       '((top . 50)
         (left . 50)
         (width . 80)
         (height . 35))
       initial-frame-alist))
(setq default-frame-alist
      (append
       '((width . 80)
         (height . 35))
       default-frame-alist))

;============================================================================
; input
;============================================================================
(setq-default tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                        64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)

;============================================================================
; misc
;============================================================================
(mouse-wheel-mode t)
(if (display-graphic-p)
    (setq line-number-mode t))
(auto-compression-mode t)
(set-scroll-bar-mode 'right)
(global-set-key "\C-z" 'undo)
(setq frame-title-format
      (concat "%b - emacs@" system-name))
(display-time)
(setq make-backup-files nil)
(setq visible-bell t)
(recentf-mode)
(setq transient-mark-mode t)
(set-face-background 'region "darkgreen")
(show-paren-mode)
(setq backup-inhibited t)
(setq c-auto-newline t)

;; linum
(if (display-graphic-p)
    (require 'linum)
    (global-linum-mode)
)

;; tabbar
(require 'cl)
(when (require 'tabbar nil t)
  (setq tabbar-buffer-groups-function
        (lambda (b) (list "All Buffers")))
  (setq tabbar-buffer-list-function
        (lambda ()
          (remove-if
           (lambda (buffer)
             (find (aref (buffer-name buffer) 0) " *"))
           (buffer-list))))
  (tabbar-mode))
(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
  (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
  `(defun ,name (arg)
     (interactive "P")
     ,do-always
     (if (equal nil arg)
         ,on-no-prefix
       ,on-prefix)))
(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
(global-set-key [(control tab)] 'shk-tabbar-next)
(global-set-key [(control shift tab)] 'shk-tabbar-prev)
(set-face-attribute
 'tabbar-default-face nil
 :background "gray90")
(set-face-attribute
 'tabbar-unselected-face nil
 :background "gray90"
 :foreground "black"
 :box nil)
(set-face-attribute
 'tabbar-selected-face nil
 :background "black"
 :foreground "white"
 :box nil)
(set-face-attribute
 'tabbar-separator-face nil
 :height 0.7)
(setq tabbar-home-button-enabled "")
(setq tabbar-scroll-left-button-enabled "")
(setq tabbar-scroll-right-button-enabled "")
(setq tabbar-scroll-left-button-disabled "")
(setq tabbar-scroll-right-button-disabled "")

;; revive
(require 'revive)
(autoload 'save-current-configuration "revive" "Save startus" t)
(autoload 'resume "revive" "Resume emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)
(define-key ctl-x-map "F" 'resume)
(define-key ctl-x-map "K" 'wipe)
(add-hook 'kill-emacs-hook 'save-current-configuration)
(resume)

;; tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(set x-select-enable-clipboard t)

;============================================================================
; IME
;============================================================================
(cond
    ((eq window-system 'w32)
        (setq default-input-method "W32-IME")
        (setq w32-ime-buffer-switch-p nil)
    )
)

;============================================================================
; autocomplete
;============================================================================
(add-to-list 'load-path "~/.emacs.d/elisp/autocomplete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/autocomplete/ac-dict")
(ac-config-default)
(require 'auto-complete-clang)
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")
(setq ac-quick-help-delay 0)

;============================================================================
; key bind
;============================================================================
(define-key global-map "\C-z" 'undo)

;============================================================================
; programming-mode
;============================================================================
(add-hook 'python-mode-hock
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))
(add-hook 'python-mode-hock '(lambda ()
                               (define-key python-mode-map "\C-m" 'newline-and-indent)))

(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "k&r")
             (setq c-basic-offset 4)
             (setq indent-tabs-mode nil)
             (c-set-offset 'innamespace 0)
             (c-set-offset 'arglist-close 0)
             (define-key c-mode-base-map "\C-m" 'newline-and-indent)
))

;;; flymake for python
;(add-hook 'find-file-hook 'flymake-find-file-hook)
;(when (load "flymake" t)
;  (defun flymake-pyflakes-init ()
;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;                       'flymake-create-temp-inplace))
;           (local-file (file-relative-name
;                        temp-file
;                        (file-name-directory buffer-file-name))))
;      (list "pycheckers"  (list local-file))))
;  (add-to-list 'flymake-allowed-file-name-masks
;               '("\\.py\\'" flymake-pyflakes-init)))
;(load-library "flymake-cursor")
;(global-set-key [f10] 'flymake-goto-prev-error)
;(global-set-key [f11] 'flymake-goto-next-error)
;
(require 'magit)
