(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit
                      starter-kit-bindings
                      starter-kit-lisp
                      starter-kit-ruby
                      htmlize
                      flymake-ruby
                      auto-complete
                      markdown-mode
                      ghc)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path user-emacs-directory)

(setq slmn-src-dir (concat user-emacs-directory "src")
      custom-file (concat user-emacs-directory "custom.el"))

(when (file-exists-p slmn-src-dir)
  (add-to-list 'load-path slmn-src-dir)
  (mapc 'load (directory-files slmn-src-dir nil "^[^#].*el$")))

(require 'slmn-misc)
(require 'slmn-ruby)
(require 'slmn-haskell)

(when (file-exists-p custom-file) (load custom-file))
