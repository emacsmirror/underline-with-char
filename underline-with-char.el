;;; underline-with-char.el --- Underline with a char  -*- lexical-binding: t ; eval: (view-mode 1) -*-

;; THIS FILE HAS BEEN GENERATED.

;; Program
;; :PROPERTIES:
;; :ID:       17c5897e-3413-4576-aa83-3869e0cb1053
;; :END:


;; [[id:17c5897e-3413-4576-aa83-3869e0cb1053][Program:1]]
;; THIS FILE HAS BEEN GENERATED.


;;; Commentary:

;; Version: 1.0.0
;; Package-Requires: ((emacs "24"))
;; Keywords: convenience

;; There are two functions
;;
;; 1. `underline-with-char' uses the internal setting for the fill-char.
;; 2. `underline-with-char-choose' allows to choose the fill-char.

;; E.g. with `underline-with-char-fill-char' set to '-' and point
;; symbolized as <!> and starting with
;;
;; ;; Worthy to be underlined
;; ;; <!>
;;
;; then
;;
;; M-x underline-with-char
;;
;; yields
;;
;; ;; Worthy to be underlined
;; ;; -----------------------

;; You can also set a character for the next underline using function
;; `underline-with-char-choose'.

;; Example
;; _______

;; ;; Worthy to be underlined
;; ;; <!>
;;
;; then
;;
;; M-x underline-with-char-choose _
;;
;; yields
;;
;; ;; Worthy to be underlined
;; ;; _______________________

;; You can also set the underline character for subsequent calls to `underline-with-char'.
;; Example
;; _______

;; Worthy to be underlined two times
;; <!>
;;
;; then
;;
;; C-u M-x underline-with-char-choose X
;; RET
;; M-x underline-with-char

;; yields
;;
;; Worthy to be underlined two times
;; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
;; XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


;;; Code:


(defcustom underline-with-char-fill-char ?-
  "The character for the underline."
  :group 'underline-with-char
  :type 'character)


;;;###autoload
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
;; -----------"
  (interactive)
  (underline-with-char-choose nil underline-with-char-fill-char))

;;;###autoload
(defun underline-with-char-choose (arg char)
  "Underline the line above with a certain character.

Fill what's remaining if not at the first position.

With prefix ARG use the CHAR for subsequent calls to
`underline-with-char'"
  (interactive  "cchar: \nP")
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
    char))
    (if (equal '(4) arg)
      (setq underline-with-char-fill-char char)))


(provide 'underline-with-char)
;; Program:1 ends here


;;; underline-with-char.el ends here
