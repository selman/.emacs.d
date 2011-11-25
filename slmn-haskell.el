(eval-after-load 'haskell-mode
  '(progn
     (autoload 'ghc-init "ghc" nil t)

     (defun haskell-unicode ()
       (substitute-patterns-with-unicode
        (list (cons "\\(<-\\)" 'left-arrow)
              (cons "\\(->\\)" 'right-arrow)
              (cons "\\(==\\)" 'identical)
              (cons "\\(/=\\)" 'not-identical)
              (cons "\\(()\\)" 'nil)
              (cons "\\<\\(sqrt\\)\\>" 'square-root)
              (cons "\\(&&\\)" 'logical-and)
              (cons "\\(||\\)" 'logical-or)
              (cons "\\<\\(not\\)\\>" 'logical-neg)
              (cons "\\(>\\)\\[^=\\]" 'greater-than)
              (cons "\\(<\\)\\[^=\\]" 'less-than)
              (cons "\\(>=\\)" 'greater-than-or-equal-to)
              (cons "\\(<=\\)" 'less-than-or-equal-to)
              (cons "\\<\\(alpha\\)\\>" 'alpha)
              (cons "\\<\\(beta\\)\\>" 'beta)
              (cons "\\<\\(gamma\\)\\>" 'gamma)
              (cons "\\<\\(delta\\)\\>" 'delta)
              (cons "\\(''\\)" 'double-prime)
              (cons "\\('\\)" 'prime)
              (cons "\\(!!\\)" 'double-exclamation)
              (cons "\\(\\.\\.\\)" 'horizontal-ellipsis))))

     (defun slmn-haskell-setup ()
       (setq ac-sources
             (append
              '(ac-source-yasnippet ac-source-ghc-mod) ac-sources))
       (turn-on-haskell-doc-mode)
       (turn-on-haskell-indent)
       (ghc-init)
       (flymake-mode)
       (haskell-unicode))

     (add-hook 'haskell-mode-hook 'slmn-haskell-setup)))

(provide 'slmn-haskell)
