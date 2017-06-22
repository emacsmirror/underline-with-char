;;; underline-with-char.el --- Underline with a char  -*- lexical-binding: t ; eval: (view-mode 1) -*-

;; THIS FILE HAS BEEN GENERATED.

;; Program
;; :PROPERTIES:
;; :ID:       17c5897e-3413-4576-aa83-3869e0cb1053
;; :END:

;; [[file:~/p/elisp/mw/underline-with-char/underline-with-char.org::*Program][Program:1]]

;; THIS FILE HAS BEEN GENERATED.


;;; Commentary:

;; Version: 1.0.0

;; E.g. with `underline-with-char-fill-char' set to '-' and point
;; symbolized as <!> and starting with
;;
;; ;; Commentary:
;; ;; <!>
;;
;; M-x underline-with-char yields
;;
;; ;; Commentary:
;; ;; -----------
;;


;;; Code:


(defcustom underline-with-char-fill-char ?-
  "The character for the underline."
  :group 'underline-with-char
  :type 'character)


(defun underline-with-char ()
  "Underline the line above with a certain character.

The character is defined by `underline-with-char-fill-char'.

Fill what's remaining if not at the first position.

E.g. with `underline-with-char-fill-char' set to '-' and point
symbolized as <!> and starting with

;; Commentary:
;; <!>

get

;; Commentary:
;; -----------
"
  (interactive)
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
    underline-with-char-fill-char)))

(defun underline-with-char-space ()
  "Underline the line above with a spaces."
  (interactive)
  (let ((underline-with-char-fill-char ? ))
    (underline-with-char)))


(provide 'underline-with-char)

;; Program:1 ends here

;;; underline-with-char.el ends here
