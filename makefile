# makefile version 1.0 

script = 'nstest'
version = ` grep -m1 'version=' $(script) | cut -d'=' -f2 `

all: lint
	@ echo "  make $(script) $(version)"
	@ echo
	@ echo '  make pack    : shellcheck & makerun (makeself)'
	@ echo '  make lint    : shellcheck'
	@ echo '  make git     : git tag <version> & git push'
	@ echo '  make gitall  : git add . & commit -m <version> & tag <version> & push'
	@ echo
	@ git status
	@ echo

pack: lint
	@ echo "  make release $(version)"
	@ echo
	@ ./makerun
#~ 	@ [ -x ./makerun ] && ./makerun
#~ 	@ [ -x ./makerun ] && echo '  makerun fait'
	@ echo '  pour finir, git add & git commit & make git'
	@ echo
	@ git status
	@ echo

git:
	@ echo
	@ echo "  make git $(version)"
	@ echo
	@ git tag $(version)
	@ git push --tags 
	@ echo "  git tag $(version) ; git push --tag : OK"
	@ echo

gitall: 
	@ echo
	@ echo "  make gitall $(version)"
	@ echo
	@ git add .
	@ git commit -m "$(version)"
	@ echo "  git add . & commit -m $(version) : OK"
	@ echo
	@ make git 
	@ echo

lint: 
	@ echo
	@ shellcheck -x $(script)
	@ echo '  shellcheck ok'
	@ echo

