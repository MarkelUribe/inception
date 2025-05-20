DUMMIES = DB_PWD WP_ADMIN_N WP_ADMIN_P WP_ADMIN_E WP_U_PASS

all: SSL $(DUMMIES)

SSL:
	mkdir -p secrets
	openssl req -x509 -nodes -days 365 -subj  "/C=CA/ST=QC/O=C Inc/CN=e.com" -newkey rsa:2048 -keyout ./secrets/selfsigned.key -out ./secrets/selfsigned.crt

$(DUMMIES):
	echo "$(@F)=" > $(addsuffix .txt, $(addprefix secrets/, $(@)))

build:
	docker-compose -f srcs/docker-compose.yml up --build

down: 
	docker-compose -f ./srcs/docker-compose.yml down 
	docker-compose -f srcs/docker-compose.yml down --volumes

clean: down
	docker system prune -af
	docker volume prune -f
	rm -fr secrets
	sudo rm -fr /home/$(USER)/data


fclean: clean

re: clean all