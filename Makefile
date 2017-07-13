LITERATE_SOURCE=underline-with-char.org

ELISP_FILES=underline-with-char.el test/underline-with-char-test.el

all: compile test package

compile: $(ELISP_FILES)

$(ELISP_FILES): $(LITERATE_SOURCE)
	emacs --batch --eval '(progn (find-file "$(LITERATE_SOURCE)") (org-babel-tangle))'

test: clean compile
	cask exec ert-runner -L .

package: compile
	cask package

clean:
	-rm $(ELISP_FILES) *.elc
	-rm -r dist

.PHONY: test clean
