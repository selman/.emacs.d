;; Need to set resense-home
(eval-after-load 'ruby-mode
  '(progn
     ;; Flymake
     (require 'flymake)

     (defun flymake-ruby-init ()
       (let* ((temp-file (flymake-init-create-temp-buffer-copy
                          'flymake-create-temp-inplace))
              (local-file (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
         (list "ruby" (list "-c" local-file))))

     (defun flymake-ruby-enable ()
       (when (and buffer-file-name
                  (file-writable-p
                   (file-name-directory buffer-file-name))
                  (file-writable-p buffer-file-name)
                  (if (fboundp 'tramp-list-remote-buffers)
                      (not (subsetp
                            (list (current-buffer))
                            (tramp-list-remote-buffers)))
                    t))
         (local-set-key (kbd "C-c d")
                        'flymake-display-err-menu-for-current-line)
         (flymake-mode t)))

     (setq rsense-home (expand-file-name (concat slmn-src-dir "/rsense")))
     (add-to-list 'load-path (concat rsense-home "/etc"))
     (require 'rsense)

     (defun slmn-ruby-setup ()
       (setq ac-sources
             (append
              '(ac-source-rsense ac-source-yasnippet) ac-sources))
       (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
       (push '(".+\\.rake$" flymake-ruby-init) flymake-allowed-file-name-masks)
       (push '(".+\\.gemspec$" flymake-ruby-init) flymake-allowed-file-name-masks)
       (push '(".+\\.ru$" flymake-ruby-init) flymake-allowed-file-name-masks)
       (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
       (push '("Gemfile$" flymake-ruby-init) flymake-allowed-file-name-masks)
       (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)
             flymake-err-line-patterns)
       (flymake-ruby-enable)
       (ruby-electric-mode t))

     (add-hook 'ruby-mode-hook 'slmn-ruby-setup)))

(provide 'slmn-ruby)
