#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <string.h>
#include <errno.h>


// This can serve as the ls command implementation in c language

int main(int argc, int *argv[])
{
    /* DIR: -Opaque data type representing directory in stream*/

    DIR *dp;

    struct dirent *dirp;
    
    if (argc != 2)
    {
        printf("please provide the directory to list out! \n");
        exit(1);
    }
    if ((dp = opendir(argv[1])) == NULL)
    {
        printf("Cannot open directory error=%s\n",strerror(errno));
        exit(1);
    }

    while(( dirp = readdir(dp)) != NULL)
    {
        printf("%s\n",dirp->d_name);
    }
    closedir(dp);
    exit(0);
}