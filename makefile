# makefile version 1.4

script = 'nstest'
version = ` grep -m1 'version=' $(script) | cut -d'=' -f2 `

all: lint badge
	@ echo "  make $(script) $(version)"
	@ echo
	@ if [ -x ./makerun ]; then echo '  make pack    : shellcheck & makerun makeself'; fi
	@ echo '  make lint    : shellcheck'
	@ echo '  make git     : badge readme & git tag <version> & add . & commit -m <version> & git push --tag'
	@ echo
#~ 	@ echo "  simulation:"
#~ 	@ git add -n .
#~ 	@ echo
	@ echo "  git status:"
	@ git status
	@ echo
	@ echo " commiter manuellement tout ce qui ne concerne pas directement $(script)"
	@ echo

pack: lint
	@ echo "  make release $(version)"
	@ echo
	@ if [ -x ./makerun ]; then ./makerun ; fi
	@ if [ -x ./makerun ]; then echo '  pour finir, git add & git commit & make git' ; fi
	@ if [ ! -x ./makerun ]; then echo '  no .run file' ; fi
	@ echo
	@ git status
	@ echo

git: lint badge
	@ echo
	@ echo "  make git $(version)"
	@ echo
	@ git add .
	@ git commit -m "release $(version)"
	@ git push
	@ echo "  git add . & commit -m <version> & git push : OK"
	@ git tag $(version)
	@ git push --tags 
	@ echo "  git tag <version> & git push --tag : OK"
	@ echo

badge: 
	@ sed -Ei "s#^!\[version:.*shields\.io.*#![version: $(version)](https://img.shields.io/badge/version-$(version)-blue.svg?longCache=true\&style=for-the-badge)#" README.md
	@ echo '  bagde updated in readme'
	@ echo

lint: 
	@ echo
	@ shellcheck -x $(script)
	@ echo '  shellcheck ok'
	@ echo
