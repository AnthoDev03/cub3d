NAME = cub3d

SRCS = SRCS/main.c\
	SRCS/exit/esc_exit.c\
	SRCS/exit/free.c\
	SRCS/game/actions.c\
	SRCS/game/deplacements.c\
	SRCS/game/draw.c\
	SRCS/game/look.c\
	SRCS/game/print_line.c\
	SRCS/game/print_line_orientation.c\
	SRCS/game/raycasting.c\
	SRCS/game/ray_x.c\
	SRCS/game/ray_y.c\
	SRCS/game/utils.c\
	SRCS/parsing/gnl.c\
	SRCS/parsing/map_check_info.c\
	SRCS/parsing/map_gesture.c\
	SRCS/parsing/map_get_info.c\
	SRCS/parsing/map_parsing_utils.c\
	SRCS/parsing/map_spawn.c\
	SRCS/parsing/split.c\
	SRCS/parsing/utils.c\
	SRCS/parsing/xpm_gesture.c\
	SRCS/parsing/xpm_utils.c

OBJS = $(SRCS:.c=.o)

CC = gcc

CFLAGS_MLX = -lXext -lX11 -lm -o
CFLAGS = -Wall -Werror -Wextra
RM = rm -f

MLX_PATH  = includes/minilibx-linux/
MLX_COMPILE = make -C $(MLX_PATH)
MLX_EXEC = libmlx.a
MLX = $(MLX_PATH)$(MLX_EXEC)

all:			$(NAME)

$(NAME):		$(OBJS)
				$(MLX_COMPILE)
				$(CC) $(SRCS) $(MLX) $(CFLAGS_MLX) $(NAME) -g -O3
				
clean:
			$(RM) $(OBJS)
			
fclean:		clean
			$(RM) $(NAME)
			
re:			fclean all

.PHONY:		all clean fclean re
