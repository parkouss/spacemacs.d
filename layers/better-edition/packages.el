;;; packages.el --- comment-dwim-2 layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <jp@parkouss>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Commentary:

;; better comment behavior.

;;; Code:

(defconst better-edition-packages
  '(comment-dwim-2
    whole-line-or-region
    visual-regexp))

(defun better-edition/init-comment-dwim-2 ()
  (use-package comment-dwim-2
    :ensure t
    :bind (("M-;" . comment-dwim-2))
    :init (setq comment-dwim-2--inline-comment-behavior 'reindent-comment)))

(defun better-edition/init-whole-line-or-region ()
  (use-package whole-line-or-region
    :ensure t
    :diminish whole-line-or-region-mode
    :init (whole-line-or-region-mode 1)))

(defun better-edition/init-visual-regexp ()
  (use-package visual-regexp
    :ensure t
    :bind (("C-c r" . vr/replace)
           ("C-c q" . vr/query-replace))))

;; configuration not relative to a package

(setq-default auto-fill-function 'do-auto-fill)
(global-set-key (kbd "M-ç") 'ispell-word)
(delete-selection-mode t)

(spacemacs|use-package-add-hook helm
  :post-config
  (defun my-helm-yank-pop (&optional arg)
    (interactive "*p")
    (if (not (eq last-command 'yank))
        (helm-show-kill-ring)
      (yank-pop arg)))
  (global-set-key (kbd "M-y") 'my-helm-yank-pop))

(spacemacs|use-package-add-hook projectile
  :post-config
  (setq projectile-use-git-grep t))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)


;;; packages.el ends here
