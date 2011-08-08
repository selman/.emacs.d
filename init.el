(add-to-list 'load-path user-emacs-directory)

(setq slmn-src-dir (concat user-emacs-directory "src"))
(add-to-list 'load-path slmn-src-dir)
(when (file-exists-p slmn-src-dir)
  (dolist (l (directory-files slmn-src-dir nil "^[^#].*el$"))
    (load l)))

(require 'slmn-elpa)
(require 'slmn-misc)
(require 'slmn-ruby)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
