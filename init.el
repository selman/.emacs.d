(add-to-list 'load-path user-emacs-directory)

(setq slmn-src-dir (concat user-emacs-directory "src")
      custom-file (concat user-emacs-directory "custom.el"))

(when (file-exists-p slmn-src-dir)
  (add-to-list 'load-path slmn-src-dir)
  (mapc 'load (directory-files slmn-src-dir nil "^[^#].*el$")))

(require 'slmn-elpa)
(require 'slmn-misc)
(require 'slmn-ruby)
(require 'slmn-haskell)

(when (file-exists-p custom-file) (load custom-file))
