;;; packages.el --- visual-regexp layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author:  <jp@parkouss>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; Simple layer for the excellent visual-regexp package.

;;; Code:

(defconst visual-regexp-packages
  '(visual-regexp))

(defun visual-regexp/init-visual-regexp ()
  (use-package visual-regexp
    :ensure t
    :bind (("C-c r" . vr/replace)
           ("C-c q" . vr/query-replace))))

;;; packages.el ends here
