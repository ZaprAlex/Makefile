# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ggwin-go <ggwin-go@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/10 17:38:22 by ggwin-go          #+#    #+#              #
#    Updated: 2019/11/04 21:08:41 by ggwin-go         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=a.out

CC=clang
FLAGS=-Wall -Wextra -Werror
FLAGS+=-g

INCLUDES:=\
	-I includes\
	-I libft/includes

SRCS_DIR=sources
OBJS_DIR=objects

LIBFT_DIR=libft

include $(LIBFT_DIR)/libft_dependences.mk

SRCS_WITHOUT_DIR=\
	main.c

SUBDIR_DIR=subdir

SRCS_SUBDIR=\
	test.c

SOURCES=$(SRCS_WITHOUT_DIR)\
	$(addprefix $(SUBDIR_DIR)/, $(SRCS_SUBDIR))

SRCS=$(addprefix $(SRCS_DIR)/, $(SOURCES))
OBJS=$(addprefix $(OBJS_DIR)/, $(SOURCES:.c=.o))

OBJS_CLEAN=$(strip $(foreach f,$(OBJS),$(wildcard $(f))))
NAME_CLEAN=$(strip $(NAME))

LIBFT_A=$(LIBFT_DIR)/libft.a

OBJS_SUBDIRS=$(OBJS_DIR)\
	$(OBJS_DIR)/$(SUBDIR_DIR)

.PHONY: all clean fclean re vg

LIBFT_OBJS_DEPENDS=$(addprefix $(LIBFT_DIR)/, $(LIBFT_OBJS))

all: $(NAME)

$(NAME): $(LIBFT_A) $(LIBFT_OBJS_DEPENDS) $(OBJS_SUBDIRS) $(OBJS)
	@$(CC) $(OBJS) $(LIBFT_A) $(INCLUDES) $(FLAGS) -o $(NAME)
	@printf "$(NAME) is ready to use!\n"

-include $(OBJS:.o=.d)
-include $(LIBFT_OBJS_DEPENDS:.o=.d)

$(LIBFT_A):
	@make -C $(LIBFT_DIR)

$(LIBFT_DIR)/$(LIBFT_OBJS_DIR)/%.o: $(LIBFT_DIR)/$(LIBFT_SRCS_DIR)/%.c
	@make -C $(LIBFT_DIR)

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.c
	@$(CC) $(INCLUDES) $(FLAGS) -o $@ -c $< -MMD

$(OBJS_SUBDIRS):
	@mkdir -p $@

clean:
ifneq ($(OBJS_CLEAN),)
	@make clean -C $(LIBFT_DIR)
	@rm -rf $(OBJS_DIR)
endif

fclean: clean
ifneq ($(NAME_CLEAN),)
	@make fclean -C $(LIBFT_DIR)
	@rm -rf $(OBJS_DIR)
	@rm -rf $(NAME)
endif

vg:
	valgrind --leak-check=full --sigill-diagnostics=yes ./$(NAME) $(ARG)

re: fclean all
