docker-build:
	docker build --progress=plain -t registry.digitalocean.com/p4ifg5pt729znwbo/socket-p2p-test:latest . 

docker-run: docker-build
	docker run -p 3030:3030 registry.digitalocean.com/p4ifg5pt729znwbo/socket-p2p-test

docker-push: docker-build
	docker push registry.digitalocean.com/p4ifg5pt729znwbo/socket-p2p-test