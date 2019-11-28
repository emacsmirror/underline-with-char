;;; underline-with-char-test.el --- tests for underline-with-char.el  -*- lexical-binding: t ; eval: (view-mode 1) -*-

;; Concrete tests
;; :PROPERTIES:
;; :ID:       77b1e4f7-2257-4e5a-80b2-b698ba75f0ed
;; :END:


;; [[file:~/p/elisp/mw/underline-with-char/underline-with-char.org::*Concrete tests][Concrete tests:1]]
(require 'underline-with-char)

(ert-deftest 00e3c5a96043b3c097e3aed45a7b6025b785cee4 ()
  "Underlining."
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

(ert-deftest e4ae03c8136e975f0aa150114691df12e3102443 ()
  "Point position after underlining."
  (should
   (= 10
    (with-temp-buffer
      (let ((underline-with-char-fill-char ?-))
       (insert "lala
")
       (call-interactively #'underline-with-char)
       (point))))))

(ert-deftest 234becd70fa5970239b1579660d2b2055ae2b68e ()
  "Partial underlining."
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

(ert-deftest 19d8326c90bd01b85f54171e4a84798924052aaa ()
  "Point position after underlining."
  (should
   (= 10
      (with-temp-buffer
        (let ((underline-with-char-fill-char ?-))
          (insert "lala
la")
          (call-interactively #'underline-with-char)
          (point))))))
;; Concrete tests:1 ends here

;;; underline-with-char-test.el ends here
