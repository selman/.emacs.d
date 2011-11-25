(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(add-to-list 'load-path (concat slmn-src-dir "/yasnippet"))
(require 'yasnippet)
(setq yas/snippet-dirs '("~/.emacs.d/mysnippets"
                         "~/.emacs.d/src/snippets"
                         "~/.emacs.d/src/yasnippet/snippets"))
(mapc 'yas/load-directory yas/snippet-dirs)
(setq yas/trigger-key "<C-tab>")
(yas/global-mode)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             (concat package-user-dir "/auto-complete-1.4.20110207/dict"))
(ac-config-default)
(ac-flyspell-workaround)                ;to fix auto-complete when flyspell-mode on

;; filename completion for eshell-mode
(add-to-list 'ac-modes 'eshell-mode)
(add-hook 'eshell-mode-hook
	  (lambda ()
            (add-to-list 'ac-sources 'ac-source-files-in-current-dir)))

(defun unicode-symbol (name)
  "Translate a symbolic name for a Unicode character -- e.g., LEFT-ARROW
 or GREATER-THAN into an actual Unicode character code. "
  (decode-char 'ucs (case name
                      (left-arrow 8592)
                      (up-arrow 8593)
                      (right-arrow 8594)
                      (down-arrow 8595)
                      (double-vertical-bar #X2551)
                      (equal #X003d)
                      (not-equal #X2260)
                      (identical #X2261)
                      (not-identical #X2262)
                      (less-than #X003c)
                      (greater-than #X003e)
                      (less-than-or-equal-to #X2264)
                      (greater-than-or-equal-to #X2265)
                      (logical-and #X2227)
                      (logical-or #X2228)
                      (logical-neg #X00AC)
                      ('nil #X2205)
                      (horizontal-ellipsis #X2026)
                      (double-exclamation #X203C)
                      (prime #X2032)
                      (double-prime #X2033)
                      (for-all #X2200)
                      (there-exists #X2203)
                      (element-of #X2208)
                      (square-root #X221A)
                      (squared #X00B2)
                      (cubed #X00B3)
                      (lambda #X03BB)
                      (alpha #X03B1)
                      (beta #X03B2)
                      (gamma #X03B3)
                      (delta #X03B4))))

(defun substitute-pattern-with-unicode (pattern symbol)
  "Add a font lock hook to replace the matched part of PATTERN with the
     Unicode symbol SYMBOL looked up with UNICODE-SYMBOL."
  (font-lock-add-keywords
   nil `((,pattern
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(unicode-symbol symbol)
                                    'decompose-region)
                    nil))))))

(defun substitute-patterns-with-unicode (patterns)
  "Call SUBSTITUTE-PATTERN-WITH-UNICODE repeatedly."
  (mapcar #'(lambda (x)
              (substitute-pattern-with-unicode (car x)
                                               (cdr x)))
          patterns))


(provide 'slmn-misc)
