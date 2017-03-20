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

(defconst comment-dwim-2-packages
  '(comment-dwim-2))

(defun comment-dwim-2/init-comment-dwim-2 ()
  (use-package comment-dwim-2
    :ensure t
    :bind (("M-;" . comment-dwim-2))
    :init (setq comment-dwim-2--inline-comment-behavior 'reindent-comment)))

;;; packages.el ends here
