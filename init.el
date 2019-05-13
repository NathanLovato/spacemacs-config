;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup. It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
  This function should only modify configuration layer settings."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(rust
     javascript
     csv
     emacs-lisp
     emoji
     git
     github
     helm
     html
     (mu4e :variables
           ;; Base config
           mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e/"

           mu4e-get-mail-command "offlineimap -q"
           mu4e-update-interval 28800
           mu4e-confirm-quit nil
           mu4e-view-show-images t
           mu4e-view-show-addresses t
           mu4e-compose-signature-auto-include t

           ;; Sending email
           send-mail-function 'smtpmail-send-it
           message-send-mail-function 'smtpmail-send-it
           smtpmail-default-smtp-server "SSL0.OVH.NET"
           smtpmail-smtp-server "SSL0.OVH.NET"
           smtpmail-stream-type 'ssl
           smtpmail-smtp-service 465

           ;; Mail folders
           mu4e-sent-folder "/INBOX.Sent"
           mu4e-trash-folder "/INBOX.Trash"
           mu4e-refile-folder "/INBOX.Archives"
           mu4e-drafts-folder "/INBOX.Drafts"
           mu4e-attachment-dir "~/Downloads"

           mu4e-use-fancy-chars t
           mu4e-use-maildirs-extension t

           ;; User config
           ;; Not using a context at the moment
           mu4e-user-mail-address-list '("nathan@gdquest.com" "natlovato@orange.fr")
           mu4e-reply-to-address "nathan@gdquest.com"
           user-mail-address "nathan@gdquest.com"
           smtpmail-smtp-user "nathan@gdquest.com"
           user-full-name  "Nathan GDquest"
           mu4e-compose-signature
           "Nathan\nhttps://www.youtube.com/c/gdquest/\n")
     pandoc
     (elfeed :variables
             rmh-elfeed-org-files (list "~/.emacs.d/private/rss-feeds.org"))
     (ranger :variables
             ranger-show-preview t
             ranger-enter-with-minus t
             ranger-show-hidden t)
     markdown
     (org :variables
          org-want-todo-bindings t
          org-enable-reveal-js-support t
          org-re-reveal-root "file:///home/gdquest/Applications/reveal.js-3.8.0/")
     spacemacs-org

     (python :variables
             python-backend 'anaconda
             python-shell-interpreter "python3"
             flycheck-python-pycompile-executable "python3")
     lsp
     yaml
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-idle-delay 0.05
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)
     (colors :variables
             colors-colorize-identifiers 'variables)
     shell-scripts
     (shell :variables
            shell-default-height 50
            shell-default-position 'bottom
            shell-default-shell 'ansi-term)
     (spell-checking :variables
                     spell-checking-enable-auto-dictionary t
                     enable-flyspell-auto-completion t
                     spell-checking-enable-by-default nil)
     (syntax-checking :variables
                      syntax-checking-enable-by-default t)
     )
   dotspacemacs-additional-packages '(evil-mu4e
                                      auto-dim-other-buffers
                                      ggtags
                                      (godot-gdscript :location local)
                                      anki-editor)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
  This function is called at the very startup of Spacemacs initialization
  before layers configuration.
  You should not put any user code in there besides modifying the variable
  values."
  (setq-default
   dotspacemacs-enable-emacs-pdumper nil

   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5

   dotspacemacs-gc-cons '(100000000 0.1)

   dotspacemacs-use-spacelpa nil
   dotspacemacs-verify-spacelpa-archives nil

   dotspacemacs-check-for-update nil

   dotspacemacs-elpa-subdirectory 'emacs-version

   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'nil
   dotspacemacs-startup-lists '((agenda . 5)
                                (todos . 5)
                                (projects . 5))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'markdown-mode
   dotspacemacs-themes '(dracula
                         spacemacs-dark
                         spacemacs-light)
   dotspacemacs-mode-line-theme 'spacemacs
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 24
                               :weight normal
                               :width normal)

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil

   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5

   dotspacemacs-enable-paste-transient-state t

   dotspacemacs-which-key-delay 0.2
   dotspacemacs-which-key-position 'bottom

   dotspacemacs-switch-to-buffer-prefers-purpose nil

   dotspacemacs-loading-progress-bar nil))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
  This function is called at the very end of Spacemacs initialization after
  layers configuration.
  This is the place where most of your configurations should be done. Unless it is
  explicitly specified that a variable should be set before a package is loaded,
  you should place your code here."
  (setq-default dotspacemacs-line-numbers 'relative)

  (require 'godot-gdscript "/home/gdquest/.emacs.d/private/local/godot-gdscript.el")

  (setq company-show-numbers t)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))

  ;; Org mode settings
  (setq org-directory "~/Dropbox/org/")
  (setq org-default-notes-file (concat org-directory "1.todo.org"))
  (setq org-agenda-files
        (quote
         ("~/Dropbox/org/7.company.org"
          "~/Dropbox/org/6.notes.org"
          "~/Dropbox/org/5.open-source.org"
          "~/Dropbox/org/4.ideas.org"
          "~/Dropbox/org/3.appointments.org"
          "~/Dropbox/org/2.godot-course-2019.org"
          "~/Dropbox/org/1.todo.org")))
  (setq org-todo-keywords '((sequence "TODO" "PROGRESS" "|" "DONE" "DELEGATED" "CANCELLED")))
  ;; FIXME: toggle autocomplete off for org mode as it gets in the way
  ;; (add-hook 'org-mode-hook 'spacemacs/toggle-auto-completion-off)

  (custom-set-faces
   '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
   '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
  )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(auto-dim-other-buffers-mode nil)
 '(evil-want-Y-yank-to-eol nil)
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("PROGRESS" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f"))))
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/tutorial.org" "~/Dropbox/org/7.company.org" "~/Dropbox/org/6.notes.org" "~/Dropbox/org/5.open-source.org" "~/Dropbox/org/4.ideas.org" "~/Dropbox/org/3.appointments.org" "~/Dropbox/org/2.godot-course-2019.org" "~/Dropbox/org/1.todo.org")))
 '(package-selected-packages
   (quote
    (lsp-ui lsp-treemacs helm-lsp company-lsp lsp-mode anki-editor ggtags blacken auto-dim-other-buffers evil-mu4e dracula-theme ac-ispell)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#b2b2b2" . "#292b2e")))
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work")))
 '(projectile-tags-backend (quote find-tag))
 '(projectile-tags-command "ctags-exuberant -Re -f \"%s\" %s \"%s\""))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-dim-other-buffers-face ((t (:background "#16171e"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
