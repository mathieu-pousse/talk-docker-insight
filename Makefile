.PHONY: all
# TODO run this from a well tuned docker container
all: 
	emacs index.org --batch -f org-html-export-to-html --kill

