slide.pdf : slide.tex debug.tex refactoring.tex tuning.tex
	platex -shell-escape slide.tex
	platex -shell-escape slide.tex
	dvipdfmx slide

clean:
	rm -f slide.pdf slide.dvi slide.log slide.aux slide.nav slide.out slide.snm slide.toc
