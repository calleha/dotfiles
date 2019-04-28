; Emacs config

;;;* Extensions
;;;** el-get

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;;;** melpa
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;;;** evil
(add-to-list 'load-path "~/.emacs.d/el-get/evil")
(require 'evil)
(evil-mode 1)

;; replace insert state with emacs state (old)
;;(evil-define-state emacs
;;  "Emacs state that can be exited with the escape key."
;;  :message "-- INSERT --"
;;  :input-method t
;;  ;; :intercept-esc nil)
;;  )
;;(defadvice evil-insert-state (around emacs-state-instead-of-insert-state activate)
;;  (evil-emacs-state))

;;replace insert state with emacs state
(defalias 'evil-insert-state 'evil-emacs-state)
;(define-key evil-emacs-state-map [escape] 'evil-normal-state)
;(define-key evil-emacs-state-map (kbd "C-[") 'evil-normal-state)

;; show evil state in modeline
(setq evil-normal-state-tag "NORMAL")
(setq evil-insert-state-tag "INSERT")
(setq evil-visual-state-tag "VISUAL")
(setq evil-replace-state-tag "REPLACE")
(setq evil-emacs-state-tag "EMACS")

;; exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-emacs-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;; map <TAB> to org-cycle when in org-mode
(evil-define-key 'normal org-mode-map
  (kbd "TAB") 'org-cycle
  ">" 'org-shiftmetaright
  "<" 'org-shiftmetaleft)

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
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))

;; BibTeX
;;(require 'org)
;;(require 'ox-bibtex)
;;(setq org-latex-pdf-process '("texi2dvi -p -b -V %f"))
;;(define-key org-mode-map (kbd "C-c [") 'org-reftex-citation)

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


;;;* Settings

; display lines
(global-display-line-numbers-mode)

(add-hook 'notmuch-search-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'notmuch-show-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'notmuch-hello-mode-hook (lambda () (display-line-numbers-mode -1)))

; disable menu bar and other stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

;; scroll line by line
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)

;; remove fringes
(fringe-mode '(0 . 0))

;; colors
(set-background-color "#292b2e")
(set-foreground-color "#b2b2b2")
(set-cursor-color "#e3dedd")

;; modeline
(column-number-mode 1)
(set-face-attribute 'mode-line           nil :background "#222226" :foreground "#b2b2b2" :box nil)  

;;#1A1A1B

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
 '(package-selected-packages (quote (org xclip ##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "#444444"))))
 '(message-header-subject ((t (:foreground "color-23" :weight bold))))
 '(message-header-to ((t (:foreground "color-23" :weight bold))))
 '(mode-line ((t (:background "#222226" :foreground "#b2b2b2" :box nil :height 1.1))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#222226" :foreground "#b2b2b2" :box nil :weight light))))
 '(notmuch-message-summary-face ((t nil)))
 '(notmuch-tag-face ((t (:foreground "brightblue" :weight bold))))
 '(region ((t (:background "#444444")))))
 ;not terminal friendly;'(region ((t (:background "#444155")))))

;;;* Bindings

;; vim keys in insert mode by holding ctrl
(define-key evil-insert-state-map (kbd "C-h") 'backward-char)
(define-key evil-insert-state-map (kbd "C-j") 'next-line)
(define-key evil-insert-state-map (kbd "C-k") 'previous-line)
(define-key evil-insert-state-map (kbd "C-l") 'forward-char)
(define-key evil-insert-state-map (kbd "C-w") 'forward-word)
(define-key evil-insert-state-map (kbd "C-b") 'backward-word)

;; emacs keys for moving to start and end of line
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-visual-state-map (kbd "C-e") 'move-end-of-line)

;; vim keys in notmuch
(define-key notmuch-search-mode-map (kbd "h") 'backward-char)
(define-key notmuch-search-mode-map (kbd "j") 'next-line)
(define-key notmuch-search-mode-map (kbd "k") 'previous-line)
(define-key notmuch-search-mode-map (kbd "l") 'forward-char)
(define-key notmuch-search-mode-map (kbd "gg") 'beginning-of-buffer)
(define-key notmuch-search-mode-map (kbd "G") 'end-of-buffer)
(define-key notmuch-show-mode-map (kbd "h") 'backward-char)
(define-key notmuch-show-mode-map (kbd "j") 'next-line)
(define-key notmuch-show-mode-map (kbd "k") 'previous-line)
(define-key notmuch-show-mode-map (kbd "l") 'forward-char)
(define-key notmuch-show-mode-map (kbd "gg") 'beginning-of-buffer)
(define-key notmuch-show-mode-map (kbd "G") 'end-of-buffer)
(define-key notmuch-hello-mode-map (kbd "h") 'backward-char)
(define-key notmuch-hello-mode-map (kbd "j") 'next-line)
(define-key notmuch-hello-mode-map (kbd "k") 'previous-line)
(define-key notmuch-hello-mode-map (kbd "l") 'forward-char)
(define-key notmuch-hello-mode-map (kbd "gg") 'beginning-of-buffer)
(define-key notmuch-hello-mode-map (kbd "G") 'end-of-buffer)

;; esc to quit in M-x
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;;;* Macros

;; Opening HTML tag
(fset 'tag
   [?0 ?i ?< ?> ?\C-\[ ?\[ ?D])
(define-key evil-normal-state-map (kbd "t t") 'tag)

;; Closing HTML tag
(fset 'ctag
   [?A ?< escape ?? ?> escape ?v ?i ?> ?\" ?m ?y escape ?/ ?< escape ?A ?/ escape ?\" ?m ?$ ?p ?A ?> escape])
(define-key evil-normal-state-map (kbd "T T") 'ctag)

;; Insert vertical space
(fset 'vspace
   [?i ?# ?+ ?L ?A ?T ?E ?X ?: ?  ?\\ ?v ?s ?p ?a ?c ?e ?\{ ?2 ?0 ?p ?t ?\} escape])
(define-key evil-normal-state-map (kbd "f x") 'vspace)

;; Open Inbox
(fset 'inbox
   "\C-cm\C-sinbox\C-m\C-[[D\C-[[D\C-[[D\C-[[D\C-[[D\C-m")
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

;;; Local variables:
;;; outline-regexp: ";;;\\*+\\|\\`"
;;; eval: (outline-minor-mode 1)
;;; End:

(add-hook 'emacs-lisp-mode-hook 
          (lambda ()
            (make-local-variable 'outline-regexp)
            (setq outline-regexp ";;;\\*+\\|\\`")
            (make-local-variable 'outline-heading-end-regexp)
            (outline-minor-mode 1)
            ))
