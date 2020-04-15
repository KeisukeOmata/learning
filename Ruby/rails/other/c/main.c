#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "hoge.h"

int main(
    int argc,
    char* argv[]
)
{
    int n = 0;
    char msg[25 + 1];
    char name[4 + 1];
    int age = 0;

    memset(msg, 0, sizeof(msg));
    memset(name, 0, sizeof(name));

    switch (argc)
    {
    case 3:
        strcpy(name, argv[1]);
        age = atoi(argv[2]);    
        break;
    case 2:
        strcpy(name, argv[1]);
        break;
    default:
        break;
    }

    n = hoge(name, age, msg);
    if (n != 0){
        printf("%s\n", msg);
        return n;
    }

    return 0;
}