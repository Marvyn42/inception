NAME	=	inception

all:	$(NAME)

$(NAME):
	docker-compose --project-directory srcs -f srcs/docker-compose.yml up -d

clean:
	docker-compose --project-directory srcs -f srcs/docker-compose.yml down

fclean: clean
	docker system prune -af

re: fclean all

.PHONY:	all clean fclean re
