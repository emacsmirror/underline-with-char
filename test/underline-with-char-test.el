;;; underline-with-char-test.el --- tests for underline-with-char.el  -*- lexical-binding: t ; eval: (view-mode 1) -*-

;; Concrete tests
;; :PROPERTIES:
;; :ID:       17c5897e-3413-4576-aa83-3869e0cb1053
;; :END:


;; [[file:~/p/elisp/mw/underline-with-char/underline-with-char.org::*Concrete%20tests][Concrete tests:1]]
(require 'underline-with-char)

(ert-deftest 146ef8c4c45a15619b234214db2a214a0b197285 ()

  (should
   (equal
    "lala
----"
    (with-temp-buffer
      (let ((underline-with-char-fill-char ?-))
       (insert "lala
")
       (call-interactively #'underline-with-char)
       (buffer-substring (point-min) (point-max)))))))

(ert-deftest 37c1ae9a5a52091dd4090e1ee371ab60805b0d2c ()
  (should
   (equal
    "lala
la--"
    (with-temp-buffer
      (let ((underline-with-char-fill-char ?-))
        (insert "lala
la")
        (call-interactively #'underline-with-char)
        (buffer-substring (point-min) (point-max)))))))
;; Concrete tests:1 ends here

;;; underline-with-char-test.el ends here
