NAME	=	inception

up:
	@mkdir -p ./srcs/requirements/data
	@mkdir -p ./srcs/requirements/code
	@echo "Starting services..."
	@docker-compose --project-directory srcs -f srcs/docker-compose.yml up --build -d
	@echo "\033[32m\nSuccess !\033[0m"

down:
	@echo "Stopping services...\n"
	@docker-compose --project-directory srcs -f srcs/docker-compose.yml down 
	@echo "\033[32mSuccess.\033[0m"

volume:
	@echo -n "\nVolume suppression in Docker ...\n    "
	@docker volume  rm -f srcs_data1
	@echo "\033[32mSuccess.\033[0m"

	@echo -n "    "
	@docker volume  rm -f srcs_data2
	@echo "\033[32mSuccess.\033[0m"

	@echo "\nRecreated local volume ... "
	@sudo rm -rf ./srcs/requirements/data
	@sudo rm -rf ./srcs/requirements/code
	@mkdir -p ./srcs/requirements/data
	@mkdir -p ./srcs/requirements/code
	@echo "\033[32mSuccess.\033[0m"

clean: down volume

fclean: clean
	@echo "\nSystem prune ..."
	@docker system prune -af
	@echo "\033[32mSuccess.\033[0m"

re: clean up

.PHONY:	up down volume clean fclean re 
