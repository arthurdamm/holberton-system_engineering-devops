#include <unistd.h>
#include <stdio.h>

/**
 * infinite_while - loops forever
 * Return: always 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - entry point
 * Return: 0 on success, 1 on failure.
 */
int main(void)
{
	pid_t pid;
	size_t i;

	for (i = 0; i < 5; i++)
	{
		pid  = fork();
		if (!pid)
			return (0);
		printf("Zombie process created, PID: %d\n", pid);
	}
	infinite_while();
	return (0);
}
