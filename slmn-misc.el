(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(add-to-list 'load-path (concat slmn-src-dir "/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat slmn-src-dir "/yasnippet/snippets"))
(setq yas/prompt-functions '(yas/ido-prompt))
(setq yas/also-auto-indent-first-line t)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (concat package-user-dir "/auto-complete-1.4.20110207/dict"))
(ac-config-default)
(setq ac-auto-start t)                  ;automatically start
(setq ac-dwim 3)                        ;Do what i mean
(ac-flyspell-workaround)                ;to fix auto-complete when flyspell-mode on

;; filename completion for eshell-mode
(add-to-list 'ac-modes 'eshell-mode)
(add-hook 'eshell-mode-hook
	  (lambda ()
            (add-to-list 'ac-sources 'ac-source-files-in-current-dir)))

;; completions for (feature/cucumber)-mode
;; (add-to-list 'ac-modes 'feature-mode)
;; (add-hook 'feature-mode-hook
;; 	  (lambda ()
;;             (add-to-list 'ac-sources 'ac-source-yasnippet)))


(provide 'slmn-misc)
