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

(when (configuration-layer/package-usedp 'helm)
  (defun my-helm-yank-pop (&optional arg)
    (interactive "*p")
    (if (not (eq last-command 'yank))
        (helm-show-kill-ring)
      (yank-pop arg)))
  (global-set-key (kbd "M-y") 'my-helm-yank-pop))

(when (configuration-layer/package-usedp 'projectile)
  (setq projectile-use-git-grep t))

;;; packages.el ends here
