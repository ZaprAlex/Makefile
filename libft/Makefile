# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ggwin-go <ggwin-go@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/20 21:55:04 by ggwin-go          #+#    #+#              #
#    Updated: 2019/11/04 21:09:51 by ggwin-go         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=libft.a

CC=clang
FLAGS=-Wall -Wextra -Werror
# FLAGS+=-g

LIBFT_INCLUDES=-I includes

include libft_dependences.mk

NAME_CLEAN=$(strip $(NAME))

LIBFT_OBJS_SUBDIRS=$(LIBFT_OBJS_DIR)

all: $(NAME)

$(NAME): $(LIBFT_OBJS_SUBDIRS) $(LIBFT_OBJS)
	@ar rc $(NAME) $(LIBFT_OBJS)
	@ranlib $(NAME)
	@printf "$(NAME) is ready to use!\n"

-include $(LIBFT_OBJS:.o=.d)

$(LIBFT_OBJS_SUBDIRS):
	@mkdir -p $@

$(LIBFT_OBJS_DIR)/%.o: $(LIBFT_SRCS_DIR)/%.c
	@$(CC) $(FLAGS) $(LIBFT_INCLUDES) -c $< -o $@ -MMD

clean:
ifneq ($(LIBFT_OBJS_CLEAN),)
	@rm -rf $(LIBFT_OBJS_DIR)
endif

fclean: clean
ifneq ($(NAME),)
	@rm -rf $(LIBFT_OBJS_DIR)
	@rm -rf $(NAME)
endif

re: fclean all

.PHONY: all clean fclean re
