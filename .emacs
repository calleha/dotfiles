; Emacs config

;;;* Extensions
;;;** package

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;;** melpa
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;;;** evil
;(add-to-list 'load-path "~/.emacs.d/el-get/evil")
;(require 'evil)
;(evil-mode 0)

;; replace insert state with emacs state
;(defalias 'evil-insert-state 'evil-emacs-state)

;; set emacs state as default state
;(setq evil-default-state 'emacs)

;; show evil state in modeline
;(setq evil-normal-state-tag "NORMAL")
;(setq evil-insert-state-tag "INSERT")
;(setq evil-visual-state-tag "VISUAL")
;(setq evil-replace-state-tag "REPLACE")
;(setq evil-emacs-state-tag "EMACS")

;; exit insert mode by pressing j and then j quickly
;(setq key-chord-two-keys-delay 0.5)
;(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
;(key-chord-define evil-emacs-state-map "jj" 'evil-normal-state)
;(key-chord-mode 1)

;; map <TAB> to org-cycle when in org-mode
;(evil-define-key 'normal org-mode-map
;  (kbd "TAB") 'org-cycle
;  ">" 'org-shiftmetaright
;  "<" 'org-shiftmetaleft)

;;;** org-mode

;; The following lines are always needed.  Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)


;; add org to elpa
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; LaTeX export
;;(require 'ox-latex)
;;(unless (boundp 'org-latex-classes)
;;  (setq org-latex-classes nil))
;;(add-to-list 'org-latex-classes
;;             '("article"
;;               "\\documentclass{article}"
;;               ("\\section{%s}" . "\\section*{%s}")))

;; org-ref
(require 'org-ref)
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))

;;;** enable xclip
(add-to-list 'load-path "~/.emacs.d/elpa/xclip-1.4/")
(require 'xclip)
(xclip-mode 1)

;;;** mail
(setq send-mail-function    'smtpmail-send-it
      smtpmail-smtp-server  "smtp.gmail.com"
      smtpmail-stream-type  'ssl
      smtpmail-smtp-service 465)

;;;** notmuch
(autoload 'notmuch "notmuch" "notmuch mail" t)
(require 'notmuch)
;; C-c m opens up notmuch from any buffer
(global-set-key (kbd "C-c m") `notmuch)


;;;** company
;(add-hook 'after-init-hook 'global-company-mode)
;; rebind M-n and M-p to C-n and C-p for company
;(define-key company-active-map (kbd "\C-n") 'company-select-next)
;(define-key company-active-map (kbd "\C-p") 'company-select-previous)

;;;** slime
(setq inferior-lisp-program "/usr/bin/sbcl")
(slime-setup '(slime-fancy slime-company))

;;;** ycmd
;(require 'ycmd)
;(add-hook 'after-init-hook 'global-ycmd-mode)

;; company-ycmd for autocompletion
;(require 'company-ycmd)
;(company-ycmd-setup)
;;;** multiple-cursors
(require 'multiple-cursors)

;; keybindings
(global-set-key (kbd "C-. C-.") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-. C-<") 'mc/mark-all-like-this)

;; mc-extras
;; haven't added keybindings yet

;;;** dmenu
(global-set-key (kbd "C-s-d") 'dmenu)
;;;* Settings

;;;** Functionality settings

; display lines
(global-display-line-numbers-mode)

(add-hook 'notmuch-search-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'notmuch-show-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'notmuch-hello-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'doc-view-mode-hook (lambda () (display-line-numbers-mode -1)))

;; scroll line by line
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

; auto-revert-mode (auto refresh)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

; display time
(setq display-time-24hr-format t)
(display-time-mode 1)

;;;** Aesthetics

; disable menu bar and other stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

;; remove fringes
(fringe-mode '(0 . 0))

;; colors
(set-background-color "#292b2e")
(set-foreground-color "#b2b2b2")
(set-cursor-color "#e3dedd")

;; transparency
;;(set-frame-parameter (selected-frame) 'alpha 95)
;;(add-to-list 'default-frame-alist '(alpha 95))

;; blinking cursor
(blink-cursor-mode 1)

;; modeline
(column-number-mode 1)
(set-face-attribute 'mode-line           nil :background "#222226" :foreground "#b2b2b2" :box nil)  
;;#1A1A1B

;; font
;(add-to-list 'default-frame-alist
;               (cons 'font "Monaco:pixelsize=15"))

;;;* Bindings

;;;** Currently disabled

;; vim keys in insert mode by holding ctrl
;;(define-key evil-insert-state-map (kbd "C-h") 'backward-char)
;;(define-key evil-insert-state-map (kbd "C-j") 'next-line)
;;(define-key evil-insert-state-map (kbd "C-k") 'previous-line)
;;(define-key evil-insert-state-map (kbd "C-l") 'forward-char)
;;(define-key evil-insert-state-map (kbd "C-w") 'forward-word)
;;(define-key evil-insert-state-map (kbd "C-b") 'backward-word)

;; emacs keys for moving to start and end of line
;;(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
;;(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
;;(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
;;(define-key evil-visual-state-map (kbd "C-e") 'move-end-of-line)

;; vim keys in notmuch
;;(define-key notmuch-search-mode-map (kbd "h") 'backward-char)
;;(define-key notmuch-search-mode-map (kbd "j") 'next-line)
;;(define-key notmuch-search-mode-map (kbd "k") 'previous-line)
;;(define-key notmuch-search-mode-map (kbd "l") 'forward-char)
;;(define-key notmuch-search-mode-map (kbd "gg") 'beginning-of-buffer)
;;(define-key notmuch-search-mode-map (kbd "G") 'end-of-buffer)
;;(define-key notmuch-show-mode-map (kbd "h") 'backward-char)
;;(define-key notmuch-show-mode-map (kbd "j") 'next-line)
;;(define-key notmuch-show-mode-map (kbd "k") 'previous-line)
;;(define-key notmuch-show-mode-map (kbd "l") 'forward-char)
;;(define-key notmuch-show-mode-map (kbd "gg") 'beginning-of-buffer)
;;(define-key notmuch-show-mode-map (kbd "G") 'end-of-buffer)
;;(define-key notmuch-hello-mode-map (kbd "h") 'backward-char)
;;(define-key notmuch-hello-mode-map (kbd "j") 'next-line)
;;(define-key notmuch-hello-mode-map (kbd "k") 'previous-line)
;;(define-key notmuch-hello-mode-map (kbd "l") 'forward-char)
;;(define-key notmuch-hello-mode-map (kbd "gg") 'beginning-of-buffer)
;;(define-key notmuch-hello-mode-map (kbd "G") 'end-of-buffer)

;; esc to quit
;(defun minibuffer-keyboard-quit ()
;  "Abort recursive edit.
;In Delete Selection mode, if the mark is active, just deactivate it;
;then it takes a second \\[keyboard-quit] to abort the minibuffer."
;  (interactive)
;  (if (and delete-selection-mode transient-mark-mode mark-active)
;      (setq deactivate-mark  t)
;    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
;    (abort-recursive-edit)))
;(define-key evil-normal-state-map [escape] 'keyboard-quit)
;(define-key evil-visual-state-map [escape] 'keyboard-quit)
;(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
;(global-set-key [escape] 'evil-exit-emacs-state)


;;;** Smaller keybindings

;; C-c q to toggle visual-line-mode
(global-set-key (kbd "C-c q") 'visual-line-mode)

;; C-c e to toggle electric-pair-mode
(global-set-key (kbd "C-c e") 'electric-pair-mode)

;; M-p and M-n for backward-paragraph and forward-paragraph
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; M-" for mark-word (translating M-@ to swedish keyboard)
(global-set-key (kbd "M-\"") 'mark-word)

;; C-; for other-window (default: C-x o)
(global-set-key (kbd "C-;") 'other-window)

;; C-: for previous-buffer (default: C-x <left>)
(global-set-key (kbd "C-:") 'previous-buffer)

;; M-f for forward-to-word instead of forward-word (misc.el)
(require 'misc)
(global-set-key (kbd "M-f") 'forward-to-word)

;;;** Larger keybindings (custom functions)

;; Move to window when splitting
(defun split-window-below-and-move ()
  (interactive)
  (split-window-below)
  (other-window 1))
(defun split-window-right-and-move ()
  (interactive)
  (split-window-right)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-window-below-and-move)
(global-set-key (kbd "C-x 3") 'split-window-right-and-move)

;; kill-whole-word with C-c w
(defun kill-whole-word ()
  (interactive)
  (forward-word)
  (backward-kill-word 1))
(global-set-key (kbd "C-c w") 'kill-whole-word)

;; C-w for backward-kill-word, unless there is a region selected
(defadvice kill-region (before unix-werase activate compile)
      "When called interactively with no active region, delete a single word
    backwards instead."
      (interactive
       (if mark-active (list (region-beginning) (region-end))
         (list (save-excursion (backward-word 1) (point)) (point)))))

;; M-w to copy line, unless there is a region selected
(defun kill-ring-save-line-or-region (beg end)
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list (line-beginning-position) (line-beginning-position 2))))
  (kill-ring-save beg end))
(global-set-key (kbd "M-w") 'kill-ring-save-line-or-region)

;; C-s-x C-s-k to kill all buffers
(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-s-x C-s-k") 'kill-all-buffers)

;;;* Macros

;; Insert vertical space
;(fset 'vspace
;   [?i ?# ?+ ?L ?A ?T ?E ?X ?: ?  ?\\ ?v ?s ?p ?a ?c ?e ?\{ ?2 ?0 ?p ?t ?\} escape])
;(define-key evil-normal-state-map (kbd "f x") 'vspace)

;; Open Inbox
(fset 'inbox
   [?\C-c ?m ?\C-s ?i ?n ?b ?o ?x return ?\C-b ?\C-b ?\C-b ?\C-b ?\C-b return])
(global-set-key (kbd "C-c i") 'inbox)
;; alt Open Inbox (does not require 'C-c m' to open notmuch)
;;(fset 'inbox2
;;   "\C-[xnotmuch\C-m\C-[[B\C-[[B\C-[[B\C-[[B\C-[[C\C-[[C\C-[[C\C-[[C\C-[[C\C-[[C\C-[[C\C-[[C\C-[[C\C-[[C\C-[[C\C-[[C\C-[[C\C-m")
;;(global-set-key (kbd "C-c i") 'inbox2)

;; Search Mail (not working)
;;(fset 'notmuchsearch
;;   "\C-[xnotmuch-search")
;;(define-key notmuch-search-mode-map (kbd "/") 'notmuchsearch)
;;(define-key notmuch-show-mode-map (kbd "/") 'notmuchsearch)
;;(define-key notmuch-hello-mode-map (kbd "/") 'notmuchsearch)

;;;* Outline mode in .emacs
(add-hook 'emacs-lisp-mode-hook 
          (lambda ()
            (make-local-variable 'outline-regexp)
            (setq outline-regexp ";;;\\*+\\|\\`")
            (make-local-variable 'outline-heading-end-regexp)
            (outline-minor-mode 1)
            ))

;;;* Emacs autostuff

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mail-host-address "thinkpad")
 '(notmuch-saved-searches
   (quote
    ((:name "inbox" :query "tag:inbox" :key "i" :sort-order newest-first)
     (:name "unread" :query "tag:unread" :key "u" :sort-order newest-first)
     (:name "flagged" :query "tag:flagged" :key "f" :sort-order newest-first)
     (:name "sent" :query "tag:sent" :key "t" :sort-order newest-first)
     (:name "drafts" :query "tag:draft" :key "d" :sort-order newest-first)
     (:name "all mail" :query "*" :key "a"))))
 '(notmuch-search-oldest-first nil)
 '(org-agenda-files (quote ("~/Documents/school/ee/ee.org")))
 '(org-export-backends (quote (ascii beamer html icalendar latex odt)))
 '(org-export-headline-levels 5)
 '(org-export-with-toc nil)
 '(package-selected-packages
   (quote
    (dmenu mc-extras multiple-cursors company-ycmd ycmd slime-company slime company org xclip ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((type x)) (:inherit nil :stipple nil :background "#292b2e" :foreground "#b2b2b2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "PfEd" :family "DejaVu Sans Mono"))))
 '(cursor ((t (:background "#e3dedd"))))
 '(highlight ((t (:background "#444444"))))
 '(message-header-subject ((t (:foreground "color-23" :weight bold))))
 '(message-header-to ((t (:foreground "color-23" :weight bold))))
 '(mode-line ((t (:background "#222226" :foreground "#b2b2b2" :box nil :height 1.0))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#222226" :foreground "#b2b2b2" :box nil :weight light))))
 '(notmuch-message-summary-face ((t nil)))
 '(notmuch-tag-face ((t (:foreground "brightblue" :weight bold))))
 '(region ((t (:background "#444444")))))
 ;not terminal friendly;'(region ((t (:background "#444155")))))

;; enabled functions
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
