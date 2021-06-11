image: 
	docker build --tag html-studio-test --file ./docker/Dockerfile "."

destroy:
	docker image rm html-studio-test

test:
	docker run -d --name html-studio-container-test -e "PORT=8081" -p 8081:8081 html-studio-test
	docker exec -it html-studio-container-test nginx -v | grep "nginx/1.20.0"
	docker container stop html-studio-container-test
	docker container rm html-studio-container-test

run: 
	docker run -d -e "PORT=8081" -p 8081:8081 --name html-studio-container-test html-studio-test 

stop:
	docker container stop html-studio-container-test
	docker container rm html-studio-container-test
