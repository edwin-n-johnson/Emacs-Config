;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;   Paths   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq my-home (getenv "HOME"))
(add-to-list 'load-path my-home)

;; Load up a custom file if it exists
(setq custom-file "~/.custom")
(if (file-exists-p custom-file)
    (load custom-file))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;   Packages   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Packages - ELPA
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;   C/C++   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cc-mode)
(c-initialize-cc-mode)

(setq default-c-comment-column 60)

;; Always indent after a newline
(define-key c-mode-base-map "\C-M" 'newline-and-indent)

;; Setup YASnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Django
(require 'django-html-mode)
(require 'django-mode)
(require 'django-snippets)
;(yas/load-directory (concat my-home "django-mode/snippets")

; Use web-mode for django template (.djhtml) files
(add-to-list 'auto-mode-alist '("\\.djhtml$" . web-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;   CEDET   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://www.emacswiki.org/emacs/CEDET_Quickstart
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'cedet)
;(require 'eieio)
;(require 'eieio-speedbar)
;(require 'semantic)
;(require 'ede)

;; Enable EDE (Project Management) features
;(global-ede-mode 1)
;(semantic-load-enable-excessive-code-helpers)      ; Enable prototype help and smart completion 
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;; Semantic
;(global-semantic-idle-scheduler-mode)
;(global-semantic-idle-completions-mode)
;(global-semantic-decoration-mode)
;(global-semantic-highlight-func-mode)
;(global-semantic-show-unmatched-syntax-mode)

;; CC-mode
;; (add-hook 'c-mode-common-hook '(lambda ()
;;                                  (setq ac-sources (append '(ac-source-semantic) ac-sources))
;;                                  ))

;; ;; Autocomplete
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories (expand-file-name
;;                                          "~/.emacs.d/elpa/auto-complete-20150618.1949/dict"))
;; (setq ac-comphist-file (expand-file-name
;;                         "~/.emacs.d/ac-comphist.dat"))
;; (ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;   Python   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python
;; (when (featurep 'python) (unload-feature 'python t))
;; (setq py-install-directory "~/elisp/python-mode.el-6.1.2")
;; (add-to-list 'load-path py-install-directory) 
;; (require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;   Other stuff   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Templates
;; (add-to-list 'load-path "~/elisp/template-mode-1.1")
;; (require 'template-mode)
;; (add-hook 'c-mode-common-hook 'template-mode)
;; (add-hook 'python-mode-hook 'template-mode)

;; hideshow for programming
;; (load-library "hideshow")
;; (add-hook 'c-mode-common-hook 'hs-minor-mode)
;; (add-hook 'perl-mode-hook 'hs-minor-mode)

; Mode list - Is this necessary anymore??
;; (setq auto-mode-alist
;;       (append '(
;;                 ("\\.C$"       . c++-mode)
;; 		("\\.cc$"      . c++-mode)
;; 		("\\.cpp$"     . c++-mode)
;; 		("\\.cxx$"     . c++-mode)
;; 		("\\.c$"       . c-mode)
;; 		("\\.h$"       . c++-mode)
;; 		("\\.i$"       . c++-mode)
;; 		("\\.ii$"      . c++-mode)
;; 		("\\.pl$"      . perl-mode)
;; 		("\\.sql$"     . c-mode)
;; 		("\\.sh$"      . shell-script-mode)
;; 		("\\.mak$"     . makefile-mode)
;; 		("\\.mki$"     . makefile-mode)
;; 		("\\.min$"     . makefile-mode)
;; 		("\\.GNU$"     . makefile-mode)
;; 		("makefile$"   . makefile-mode)
;;                 ("SConstruct$" . python-mode)
;;                 ("SConscript$" . python-mode)
;;                 ("\\.scons$"   . python-mode)
;;                 ("\\.api$"     . python-mode)
;;                 ("paths.sconscript$" . python-mode)
;; 		) 
;;               auto-mode-alist))

;; The following says display these buffers in their own window.  The
;; second variable specifies the attributes of that window (I like it to
;; be smaller than regular windows and not waste a line with a minibuffer).
;(setq special-display-buffer-names '("*compilation*" "*grep*" "*igrep*"))
;(setq special-display-frame-alist
;      '((height . 15) (width . 80)
;	(minibuffer . nil)))

;; Setup the good default colors (via customize)
;;(set-background-color "black")
;;(set-foreground-color "white")
;;(set-cursor-color "purple")
;;(set-default-font "-*-Courier New-normal-r-*-*-15-82-96-96-c-*-iso8859-1")
;; "-*-courier-medium-r-*-*-10-*-*-*-*-*-*-*")

(global-set-key "\M-g"      'goto-line)
(global-set-key "\M-h"      'hexl-mode)
(global-set-key "\M-c"      'compile)
(global-set-key "\M-2"      'next-error)
(global-set-key "\M-1"      'previous-error)
(global-set-key "\M-d"      'gdb)
