image: 
	docker build --tag html-studio-test --file ./docker/Dockerfile "."

destroy:
	docker image rm html-studio-test

test:
	docker run -d --name html-studio-container-test html-studio-test
	docker exec -it html-studio-container-test nginx -v | grep "nginx version: nginx/1.20.0"
	docker container stop html-studio-container-test
	docker container rm html-studio-container-test

run: 
	docker run -d -p 80:80 --name html-studio-container-test html-studio-test
