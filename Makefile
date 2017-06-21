LITERATE_SOURCE=underline-with-char.org

ELISP_FILES=underline-with-char.el tests/underline-with-char-test.el

all: compile test package

compile: $(ELISP_FILES)

$(ELISP_FILES): $(LITERATE_SOURCE)
	emacs --batch --eval '(progn (find-file "$(LITERATE_SOURCE)") (org-babel-tangle))'

test: compile
	cask exec ert-runner -L .

package: compile
	cask package

clean:
	rm $(ELISP_FILES)
	-rm -r dist

.PHONY: test clean
