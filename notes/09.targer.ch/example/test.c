int i = 0x11223344;
int j = 0;
char str1[64] = {"This is a string."};
char str2[128];

int main()
{
	int k;
	k = i + j;
	strcpy(str2, "Test string to be copied.");
	printf("%s\n", str1);
	return k;
}
