dcbuild:
	docker compose -f docker-compose.local.yml build
dcup:
	docker compose -f docker-compose.local.yml up -d
dcstop:
	docker compose -f docker-compose.local.yml stop
dcbash:
	docker compose -f docker-compose.local.yml exec -it api sh
dclogs:
	docker compose -f docker-compose.local.yml logs -f
dcrs:
	docker compose -f docker-compose.local.yml restart api && $(MAKE) dclogs
printenv:
	docker compose -f docker-compose.local.yml exec api sh -c printenv
prune:
	docker system prune -a -f
stop:
	docker stop $$(docker ps -a -q) && docker rm $$(docker ps -a -q)
coca:
	$(MAKE) dcstop && $(MAKE) prune && $(MAKE) dcup && $(MAKE) dclogs
git_log:
	git log --all --decorate --oneline --graph
update:
	poetry add $( cat requirements.txt )
create_base:
	docker run -it -v $(pwd):/app python:3.9.16-slim-buster /bin/sh
requirements:
	docker compose -f docker-compose.local.yml exec -it api sh -c 'poetry add $$( cat requirements.txt )'
remove:
	docker compose -f docker-compose.local.yml exec -it api sh -c 'poetry lock --no-update && poetry remove $(name)'
