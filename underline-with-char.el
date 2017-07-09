;;; underline-with-char.el --- Underline with a char  -*- lexical-binding: t ; eval: (view-mode 1) -*-

;; THIS FILE HAS BEEN GENERATED.

;; Program
;; :PROPERTIES:
;; :ID:       17c5897e-3413-4576-aa83-3869e0cb1053
;; :END:


;; [[file:~/p/elisp/mw/underline-with-char/underline-with-char.org::*Program][Program:1]]
;; THIS FILE HAS BEEN GENERATED.


;;; Commentary:

;; Version: 2.0.0
;; Package-Requires: ((emacs "24"))
;; Keywords: convenience

;; This program provides just command `underline-with-char'.

;; Example:
;;
;; Let <!> be the location of the Emacs cursor aka point.
;;
;; ;; Worthy to be underlined
;; ;; <!>
;;
;; then
;;
;; M-x underline-with-char -
;;
;; yields
;;
;; ;; Worthy to be underlined
;; ;; -----------------------


;;; Code:


;;;###autoload
(defun underline-with-char (char)
  "Underline the line above with a certain character."
  (interactive  "cchar: ")
  (insert
   (make-string
    (save-excursion
      (let ((col (current-column)))
        (forward-line -1)
        (end-of-line)
        (when (< col (current-column))
          (beginning-of-line)
          (forward-char col)))
      (let ((old-point (point)))
        (- (progn (end-of-line) (point)) old-point)))
    char)))


(provide 'underline-with-char)
;; Program:1 ends here


;;; underline-with-char.el ends here
