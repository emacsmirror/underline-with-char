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
      (let ((underline-with-char-fill-char ?-))
       (insert "lala
")
       (call-interactively #'underline-with-char)
       (buffer-substring (point-min) (point-max)))))))

(ert-deftest 1cf806ca781aba4a68e248c4a3c5a0bd3017ea75 ()
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

(ert-deftest eb74280b23db3a9ac18032d641aa280a6cb2c4c1 ()
  (should
   (equal
    "lala
    "
    (with-temp-buffer
      (insert "lala
")
      (underline-with-char-choose nil ? )
      (buffer-substring (point-min) (point-max))))))

(ert-deftest 69756cd95b0b4ad224f728d57799253664e1c79c ()
  (should
   (equal
    "lala
++++
++++"
    (with-temp-buffer
      (insert "lala
")
      (underline-with-char-choose '(4) ?+)
      (insert "\n")
      (underline-with-char)
      (buffer-substring (point-min) (point-max))))))
;; Concrete tests:1 ends here

;;; underline-with-char-test.el ends here
