#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>

// Assembly functions
size_t  ft_strlen(const char *s);
char    *ft_strcpy(char *dst, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char    *ft_strdup(const char *s);

int main(void)
{
	// ft_strlen
	{
		puts("\n\n=== ft_strlen ===\n");

		static const char *cases[] = {
			"",
			"a",
			"hello",
			"Hello, world!",
			"string with spaces",
			"0123456789",
			"a longer string used to test scanning"
		};

		for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i)
		{
			int mine = ft_strlen(cases[i]);
			int original = strlen(cases[i]);

			printf("%u - %u \n", mine, original);
		}
	}

	// ft_strcpy
	{
		puts("\n\n=== ft_strcpy ===\n");

		static const char *cases[] = {
			"",
			"a",
			"hello",
			"Hello, world!",
			"string with spaces",
			"copy this string"
		};

		for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i)
		{
			char mine[100];
			char original[100];

			printf("ft_strcpy: %s \n", ft_strcpy(mine, cases[i]));
			printf("OG strcpy: %s \n\n", strcpy(original, cases[i]));
		}
	}

	// ft_strcmp
	{
		puts("\n\n=== ft_strcmp ===\n");

		static const struct {
			const char *s1;
			const char *s2;
		} cases[] = {
			{"", ""},
			{"hello", "hello"},
			{"hello", "world"},
			{"abc", "abd"},
			{"abd", "abc"},
			{"abc", "abcd"},
			{"abcd", "abc"},
			{"A", "a"},
			{"same", "same"}
		};

		for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i)
		{
			int mine = ft_strcmp(cases[i].s1, cases[i].s2);
			int original = strcmp(cases[i].s1, cases[i].s2);

			printf("%d - %d \n", mine, original);
		}
	}

	// ft_write
	{
		puts("\n\n=== ft_write ===\n");

		const char *message = "Hello from ft_write!\n";
		size_t len = strlen(message);

		puts(" --- ft_write: ---");
		ssize_t mine = ft_write(STDOUT_FILENO, message, len);
		printf("%ld", mine);

		puts("\n\n--- OG write: ---");
		ssize_t original = write(STDOUT_FILENO, message, len);
		printf("%ld", original);

		
		// Test an invalid file descriptor
		puts("\n\n--- Invalid file descriptor ---");
		errno = 0;
		mine = ft_write(-1, message, len);
		printf("%zd | errno: %d\n", mine, errno);

		errno = 0;
		original = write(-1, message, len);
		printf("%zd | errno: %d\n", original, errno);
	}

	// ft_read
	{
		puts("\n\n=== ft_read ===\n");

		int fd = open("test.txt", O_RDONLY);

		char mine_buf[20];
		char original_buf[20];

		ssize_t mine = ft_read(fd, mine_buf, sizeof(mine_buf));

		ssize_t original = read(fd, original_buf, sizeof(original_buf));
		
		close(fd);

		printf("ft_read: %zd \n", mine); 
		printf("OG read: %zd \n", original);

		// Test an invalid file descriptor
		puts("\n--- Invalid file descriptor ---");
		char buffer[20];

		errno = 0;
		ssize_t mine_n = ft_read(-1, buffer, sizeof(buffer));
		int errno_mine = errno;
		printf("%zd | errno: %d\n", mine_n, errno_mine);

		errno = 0;
		ssize_t original_n = read(-1, buffer, sizeof(buffer));
		int errno_original = errno;
		printf("%zd | errno: %d\n", original_n, errno_original);
	}

	// ft_strdup
	{
		puts("\n\n=== ft_strdup ===\n");

		static const char *cases[] = {
			"",
			"a",
			"hello",
			"Hello, world!",
			"string with spaces",
			"a longer string used to test duplication"
		};

		for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i)
		{
			char *mine = ft_strdup(cases[i]);
			char *original = strdup(cases[i]);

			if (mine && original)
			{
				printf("ft_strdup: %s \n", mine);
				printf("OG strdup: %s \n\n", original);
			}
			else
				puts("Allocation failed\n");

			free(mine);
			free(original);
		}
	}

	return 0;
}#include <stdio.h>
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
	ft_write(1, "ft_write: ", 10);
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
	printf("ft_read:\n%s", buff);
	close(fd);

	return 0;
}
