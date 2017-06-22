;;; underline-with-char-test.el --- tests for underline-with-char.el  -*- lexical-binding: t ; eval: (view-mode 1) -*-

;; Concrete tests
;; :PROPERTIES:
;; :ID:       17c5897e-3413-4576-aa83-3869e0cb1053
;; :END:


;; [[id:17c5897e-3413-4576-aa83-3869e0cb1053][Concrete tests:1]]
(require 'underline-with-char)

(ert-deftest f2149b5d7e74f04715435e3767bb5b28eb973ab6 ()
  (should
   (equal
    "lala
----"
    (with-temp-buffer
      (insert "lala
")
      (call-interactively #'underline-with-char)
      (buffer-substring (point-min) (point-max))))))

(ert-deftest 1cf806ca781aba4a68e248c4a3c5a0bd3017ea75 ()
  (should
   (equal
    "lala
la--"
    (with-temp-buffer
      (insert "lala
la")
      (call-interactively #'underline-with-char)
      (buffer-substring (point-min) (point-max))))))

(ert-deftest 88bded2c526dcf44116420e7a33eb7ab58b905ee ()
  (should
   (string=
    "a
a"
    (with-temp-buffer
      (let ((underline-with-char-fill-char ?a))
        (insert "a
")
        (call-interactively #'underline-with-char))
        (buffer-substring (point-min) (point-max))))))

(ert-deftest f3c73d8e5d16ed6dc6855c7fe36160ba030c9f91 ()
  (should
   (equal
    "lala
    "
    (with-temp-buffer
      (insert "lala
")
      (call-interactively #'underline-with-char-space)
      (buffer-substring (point-min) (point-max))))))
;; Concrete tests:1 ends here

;;; underline-with-char-test.el ends here
