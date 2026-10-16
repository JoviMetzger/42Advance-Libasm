# Executable
NAME 		= libasm.a
TEST        = testC

# Compiler and flags
NASM		= nasm
NASMFLAGS	= -f elf64
AR			= ar
ARFLAGS		= rcs
CC			= gcc
CFLAGS		= -Wall -Wextra -Werror

# Colors
BOLD		= \033[1m
ITALIC		= \033[3m
UNDER 		= \033[4m
GREEN		= \033[32;1m
CORAL		= \033[38;2;255;127;80m
RESET		= \033[0m

# Sources files
SRC_DIR		= src
SRC			=	$(SRC_DIR)/ft_strlen.s \
				$(SRC_DIR)/ft_write.s \
				$(SRC_DIR)/ft_read.s \
				$(SRC_DIR)/ft_strcpy.s \
				$(SRC_DIR)/ft_strcmp.s \
				$(SRC_DIR)/ft_strdup.s

# Objects files
OBJ_DIR		= obj
OBJ			= $(SRC:$(SRC_DIR)/%.s=$(OBJ_DIR)/%.o)

INPUTFILE	= touch test.txt && echo "Hello World\nTry Me test file!\nSpecial: @@-$%?" >> test.txt

# Default Targets
all: $(NAME)

# Create Library
$(NAME): $(OBJ) 
	$(AR) $(ARFLAGS) $(NAME) $(OBJ)
	@echo "$(CORAL) $(UNDER) $(BOLD) $(ITALIC) ✨Library created:$(RESET) $(NAME)"
      
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

# Compile with main.c (C file) and link with libray
$(TEST): main.c $(NAME)
	@$(CC) $(CFLAGS) main.c -L. -lasm -o $@

test: $(TEST)
	@rm -rf test.txt
	@$(INPUTFILE)
	@echo "$(GREEN)Created:$(RESET) test.txt -> For Input File"
	@./$(TEST)

# Clean
clean:
		@rm -rf $(OBJ_DIR)
		@echo "$(GREEN) $(ITALIC) ✅ Cleaned object files ✅$(RESET)"

fclean: clean
		@rm -f $(NAME) testC main.o test.txt
		@echo "$(GREEN) $(ITALIC)  ✅ Removed executable ✅$(RESET)"

re:		fclean all

.PHONY: all clean fclean re test
