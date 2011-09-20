;; Need to set resense-home
(eval-after-load 'ruby-mode
  '(progn
     (setq rsense-home (expand-file-name (concat slmn-src-dir "/rsense")))
     (add-to-list 'load-path (concat rsense-home "/etc"))
     (require 'rsense)

     (defun slmn-ruby-setup ()
       (setq ac-sources
             (append
              '(ac-source-rsense ac-source-yasnippet) ac-sources))
       (require 'flymake-ruby)
       (flymake-ruby-load)
       (esk-prog-mode-hook)
       (ruby-electric-mode t))

     (add-hook 'ruby-mode-hook 'slmn-ruby-setup)))

(provide 'slmn-ruby)
