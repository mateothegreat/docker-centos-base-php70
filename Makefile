NAME	        = appsoa/docker-centos-base-php70
ALIAS	        = nginx-php7
VERSION 	= 1.0

GIT_COMMIT 	= $(strip $(shell git rev-parse --short HEAD))
CODE_VERSION 	= $(strip $(shell cat VERSION))

.PHONY:	all build test tag_latest release

all:	clean build 
clean:	docker-current-clean-images docker-current-clean-volumes docker-global-clean-images
build:

	@echo "Building an image with the current tag $(NAME):$(VERSION).."
	@docker build 	--rm \
			--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` 		\
			--build-arg VERSION=$(VERSION) 					\
			--build-arg VCS_URL=`git config --get remote.origin.url` 	\
			--build-arg VCS_REF=$(GIT_COMMIT) 				\
			--tag $(NAME):$(VERSION)					\
			.

run:

	docker run --rm -it $(PWD):/www $(NAME):$(VERSION)

tag_latest:

	docker tag $(NAME):$(VERSION) $(NAME):latest

release:

	docker push $(NAME)

docker-current-clean-containers:

	@echo "Deleting container(s) with the current tag $(NAME):$(VERSION).."
	@docker ps -a | grep $(ALIAS) | xargs --no-run-if-empty docker rm -f

docker-current-clean-images:

	@echo "Deleting image(s) with the current tag $(NAME):$(VERSION).."
	@docker images -a | grep $(NAME):$(VERSION) | xargs --no-run-if-empty docker rmi -f

docker-current-clean-volumes:

	@echo "Deleting volumes(s) with the current tag $(NAME):$(VERSION).."
	@docker volume ls -q | grep $(NAME):$(VERSION) | xargs -r docker volume rm || true

docker-global-clean-images:

	@echo "Deleting images that are not tagged.."
	@docker images | grep \<none\> | awk -F " " '{print $3}' | xargs --no-run-if-empty docker rmi

docker-images-list:

	@echo "Listing image(s) matching the current repo \"$(NAME)\" and the tag \"$(VERSION)\".."
	@docker images -a | grep $(NAME) | grep $(VERSION) || true

	@echo "Listing any other images matching current repo \"$(NAME)\":"
	@docker images -a | grep $(NAME) | grep -v $(VERSION) || true
