# makefile version 1.2

script = 'nstest'
version = ` grep -m1 'version=' $(script) | cut -d'=' -f2 `

all: lint badge
	@ echo "  make $(script) $(version)"
	@ echo
#~ 	@ echo '  make pack    : shellcheck & makerun (makeself)'
	@ echo '  make lint    : shellcheck'
	@ echo '  make git     : git tag <version> & add . & commit -m <version> & git push --tag'
	@ echo
	@ echo "  simulation:"
	@ git add -n .
	@ echo
	@ echo "  git status:"
	@ git status
	@ echo
	@ echo " commiter manuellement tout ce qui ne concerne pas directement $(script)"
	@ echo

pack: lint
	@ echo "  make release $(version)"
	@ echo
	@ ./makerun
	@ echo '  pour finir, git add & git commit & make git'
	@ echo
	@ git status
	@ echo

git: lint badge
	@ echo
	@ echo "  make git $(version)"
	@ echo
	@ git tag $(version)		# permet de vérifier aussi si le versioning n'est pas existant

	@ git add .
	@ git commit -m "release $(version)"
	@ git push --tags 
	@ echo "  git tag <version> & add . & commit -m <version> & git push --tag : OK"
	@ echo

badge: 
	@ sed -Ei "s#^!\[version:.*shields\.io.*#![version: $(version)](https://img.shields.io/badge/version-$(version)-blue.svg?longCache=true\&style=for-the-badge)#" README.md

lint: 
	@ echo
	@ shellcheck -x $(script)
	@ echo '  shellcheck ok'
	@ echo
