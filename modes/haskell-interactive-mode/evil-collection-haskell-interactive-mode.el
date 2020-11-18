;;; evil-collection-haskell-interactive-mode.el --- Evil bindings for haskell-interactive-mode  -*- lexical-binding: t -*-
(require 'evil-collection)
(require 'haskell-interactive-mode)

(defun evil-collection-term-escape-stay ()
  "Go back to normal state but don't move cursor backwards.
Moving cursor backwards is the default Vim behavior but
it is not appropriate in some cases like terminals."
  (setq-local evil-move-cursor-back nil))
;;;###autoload
(defun evil-collection-haskell-interactive-mode-setup ()
  "Set up `evil' bindings for `term'."
  (evil-set-initial-state 'haskell-interactive-mode 'insert)

  (add-hook 'haskell-interactive-mode-hook 'evil-collection-term-escape-stay)

  (evil-collection-define-key 'normal 'haskell-interactive-mode-map
    (kbd "C-c C-k") 'evil-collection-term-char-mode-insert
    (kbd "RET") 'haskell-interactive-mode-return
    "dd" 'haskell-interactive-mode-kill-whole-line
    ;; motion
    "[[" 'haskell-interactive-mode-prompt-next
    "]]" 'haskell-interactive-mode-prompt-previous
    (kbd "C-k") 'haskell-interactive-mode-prompt-next
    (kbd "C-j") 'haskell-interactive-mode-prompt-previous
    "gk" 'haskell-interactive-mode-prompt-next
    "gj" 'haskell-interactive-mode-prompt-previous
    "0" 'haskell-interactive-mode-bol ; "0" is meant to really go at the beginning of line.
    "^" 'haskell-interactive-mode-bol))
(provide 'evil-collection-haskell-interactive-mode)
;; eof
