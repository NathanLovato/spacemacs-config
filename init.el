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
     pandoc
     (ranger :variables
              ranger-show-preview t
              ranger-enter-with-minus t
              ranger-show-hidden t)
     markdown
     org
     (python :variables python-backend 'lsp)
     lsp
     yaml
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-help-tooltip t
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t
                      )
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
   dotspacemacs-additional-packages '()
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
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'nil
   dotspacemacs-startup-lists '((agenda . 5)
                                (todos . 5)
                                (projects . 5))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'org-mode
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 22
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

   dotspacemacs-loading-progress-bar nil
   dotspacemacs-fullscreen-at-startup t

   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t

   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90

   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-mode-line-theme 'spacemacs

   dotspacemacs-smooth-scrolling t

   dotspacemacs-line-numbers '(:relative t
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         pdf-view-mode
                                         text-mode
                                         :size-limit-kb 1000)


   dotspacemacs-folding-method 'evil

   dotspacemacs-smartparens-strict-mode t

   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server t
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil

   dotspacemacs-whitespace-cleanup 'trailing

   dotspacemacs-zone-out-when-idle nil

   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
  This function is called at the very end of Spacemacs initialization after
  layers configuration.
  This is the place where most of your configurations should be done. Unless it is
  explicitly specified that a variable should be set before a package is loaded,
  you should place your code here."
  (setq company-show-numbers t)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))

  ;; Org mode settings
  (setq org-agenda-files
        (quote
         ("~/Dropbox/org/krita.org" "~/Dropbox/org/videos.org" "~/Dropbox/org/godot-3-course.org" "~/Dropbox/org/godot.org" "~/Dropbox/org/todo_next.org" "~/Dropbox/org/todo.org" "~/Dropbox/org/kickstarter.org")))
  (setq org-todo-keywords
        '((sequence "TODO" "PROGRESS" "NEXT" "|" "DONE" "DELEGATED" "CANCELLED")))
  (setq org-support-shift-select t)
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
 '(package-selected-packages
   (quote
    (google-translate forge centered-cursor-mode counsel swiper ivy window-purpose helm lsp-mode treemacs ace-window hydra yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-evil toml-mode toc-org tagedit symon string-inflection spaceline-all-the-icons smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs ranger rainbow-mode rainbow-identifiers rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements pfuture persp-mode pcre2el password-generator paradox pandoc-mode ox-pandoc overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file nameless multi-term move-text mmm-mode markdown-toc magithub magit-svn magit-gitflow macrostep lsp-ui lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-navigator json-mode js2-refactor js-doc insert-shebang indent-guide importmagic impatient-mode imenu-list hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-gitignore helm-git-grep helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag golden-ratio gnuplot gitignore-templates github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy font-lock+ flyspell-popup flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-bashate flx-ido fish-mode fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emojify emoji-cheat-sheet-plus emmet-mode elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline diminish diff-hl define-word cython-mode csv-mode counsel-projectile company-web company-tern company-statistics company-shell company-quickhelp company-lsp company-emoji company-anaconda column-enforce-mode color-identifiers-mode closql clean-aindent-mode cargo browse-at-remote auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
