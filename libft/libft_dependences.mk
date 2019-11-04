# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    libft_dependences.mk                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ggwin-go <ggwin-go@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/04 20:48:15 by ggwin-go          #+#    #+#              #
#    Updated: 2019/11/04 21:01:00 by ggwin-go         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LIBFT_SRCS_DIR=sources
LIBFT_OBJS_DIR=objects

LIBFT_SRCS_WITHOUT_DIR=\
libft_test.c	libft_test1.c

LIBFT_SOURCES=$(LIBFT_SRCS_WITHOUT_DIR)

LIBFT_SRCS=$(addprefix $(LIBFT_SRCS_DIR)/, $(LIBFT_SOURCES))
LIBFT_OBJS=$(addprefix $(LIBFT_OBJS_DIR)/, $(LIBFT_SOURCES:%.c=%.o))

LIBFT_OBJS_CLEAN=$(strip $(foreach f,$(LIBFT_OBJS),$(wildcard $(f))))
