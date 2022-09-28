all: build/DdE.mpackage

LUAS = $(wildcard src/scripts/DdE/*.lua)
build/DdE.mpackage: src/scripts/DdE/scripts.json $(LUAS)
	docker run -it --rm -u "$(shell id -u):$(shell id -g)" -v "$(shell pwd):/x" -w /x demonnic/muddler 

push: build/DdE.mpackage
	rsync -Pavessh ./build/DdE.mpackage moylen@scw-boring-joliot:/srv/moylen.eu/
