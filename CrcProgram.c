
#include <stdio.h>
#include <string.h>

char t[28], cs[28], g[28];
int N, a, e, c, b;

void xor()
{
    for(c = 1; c < N; c++)
    {
        cs[c] = ((cs[c] == g[c]) ? '0' : '1');
    }
}

void crc()
{
    for(e = 0; e < N; e++)
    {
        cs[e] = t[e];
    }

    do
    {
        if(cs[0] == '1')
            xor();

        for(c = 0; c < N - 1; c++)
            cs[c] = cs[c + 1];

        cs[c] = t[e++];
    }
    while(e <= a + N - 1);
}

int main()
{
    int flag = 0;

    do
    {
        printf("\n1. CRC 12");
        printf("\n2. CRC 16");
        printf("\n3. CRC CCIP");
        printf("\n4. Exit");

        printf("\nEnter your option: ");
        scanf("%d", &b);

        switch(b)
        {
            case 1:
                strcpy(g, "1100000001111");
                break;

            case 2:
                strcpy(g, "11000000000000101");
                break;

            case 3:
                strcpy(g, "10001000000100001");
                break;

            case 4:
                return 0;
        }

        N = strlen(g);

        printf("\nEnter data: ");
        scanf("%s", t);

        printf("\n--------------------------------\n");
        printf("\nGenerating polynomial: %s", g);

        a = strlen(t);

        for(e = a; e < a + N - 1; e++)
            t[e] = '0';

        printf("\n--------------------------------\n");
        printf("Modified data is: %s", t);

        printf("\n--------------------------------\n");

        crc();

        printf("CRC code is: %s", cs);

        for(e = a; e < a + N - 1; e++)
            t[e] = cs[e - a];

        printf("\n--------------------------------\n");
        printf("Final codeword is: %s", t);

        printf("\nReceiver side ------------------\n");

        printf("\nTest error detection 0 (yes) 1 (no)? ");
        scanf("%d", &e);

        if(e == 0)
        {
            do
            {
                printf("\nEnter the position where error is to be inserted: ");
                scanf("%d", &e);
            }
            while(e == 0 || e > a + N - 1);

            t[e - 1] = (t[e - 1] == '0') ? '1' : '0';

            printf("\n--------------------------------\n");
            printf("\nErroneous data: %s\n", t);
        }

        crc();

        for(e = 0; (e < N - 1) && (cs[e] != '1'); e++);

        if(e < N - 1)
            printf("\nError detected\n\n");
        else
            printf("\nNo error detected\n\n");

        printf("\n--------------------------------\n");

    }
    while(flag != 1);

    return 0;
}
