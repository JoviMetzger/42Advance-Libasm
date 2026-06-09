#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>

// your assembly functions
size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t	ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s);

int main(void)
{
	// ft_strlen
	size_t len = ft_strlen("Hello world!");
	printf("ft_strlen: %zu\n", len);

	// ft_strcpy
	char src[] = "Hello world! - COPY";
	char dst[50];
	printf("ft_strcpy BEFORE: %s\n", dst);
	ft_strcpy(dst, src);
	printf("ft_strcpy AFTER: %s\n", dst);

	// ft_strcmp
	printf("ft_strcmp: %d\n", ft_strcmp("hello", "helllo"));

	// ft_write
	ft_write(1, "ft_write:\n", 11);
	ft_write(1, "Hello World\n", 13);

	// ft_strdup
	char str[] = "Hello world! - DUP";
	char *dup = ft_strdup(str);
	printf("ft_strdup Original str: %s\n", str);
	printf("ft_strdup Duplicated str: %s\n", dup);
	free(dup);

	// ft_read
	char buff[100];
	int fd = open("test.txt", O_RDONLY);
	ssize_t line = ft_read(fd, buff, 99);
	buff[line] = '\0';
	printf("ft_read:\n%s\n", buff);
	close(fd);

	return 0;
}