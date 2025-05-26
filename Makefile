SECRET_VALS = db_pwd wp_admin_n wp_admin_p wp_admin_e wp_user_p
SECRET_FILES = $(addsuffix .txt, $(addprefix secrets/, $(SECRET_VALS)))
ENVIRONMENT = srcs/.env
SSL_CRT = secrets/selfsigned.crt
SSL_KEY = secrets/selfsigned.key

all: $(SSL_CRT) $(SECRET_FILES) $(ENVIRONMENT)

$(SSL_CRT): $(SSL_KEY)

$(SSL_KEY):
	@mkdir -p secrets
	@openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=C Inc/CN=e.com" -newkey rsa:2048 -keyout $(SSL_KEY) -out $(SSL_CRT)

secrets/%.txt:
	@printf "$$(printf $* | tr a-z A-Z)=<value>" > $@

$(ENVIRONMENT):
	@mkdir -p $(dir $@)
	@printf "#Mariadb variables\n\
	DB_USER=<value>\n\
	DB_NAME=<value>\n\
	\n\
	#Wordpress variables\n\
	DOMAIN_NAME=<value>\n\
	WP_TITLE=<value>\n\
	\n\
	WP_USER_N=<value>\n\
	WP_USER_E=<value>\n\
	WP_USER_R=<value>\n" > $@

up:
	docker-compose -f srcs/docker-compose.yml up --build -d

down: 
	docker-compose -f ./srcs/docker-compose.yml down 
	docker-compose -f srcs/docker-compose.yml down --volumes

clean: down
	docker system prune -af
	docker volume prune -f


fclean: clean
	rm -fr secrets
	sudo rm -fr /home/$(USER)/data
	rm srcs/.env

re: clean up

.PHONY: all up down clean fclean re