#include <Foundation/Foundation.h>

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
 
int GetPosition(char c)
{
   if (c >= 'a' && c <= 'z') {
      return c - 'a';
   }
   else if (c >= 'A' && c <= 'Z') {
      return c - 'A';
   }
   else if(c == ' ') {
      return 32;
   }
   else  {
      // Indicate that it isn't a letter.
      return -2;
   }
}
 
int main(int argc, const char * argv[]) {
    int L;
    scanf("%d", &L); fgetc(stdin);
    int H;
    scanf("%d", &H); fgetc(stdin);
    char T[1024];
    gets(T);

    int span = 0;
  
    NSString *stringForCounting =  [NSString stringWithCString:T encoding:NSASCIIStringEncoding];
  
        for (int j = 0; j < H; j++) {
            char ROW[2048];
            gets(ROW);
        
            NSString *mime =  [NSString stringWithCString:ROW encoding:NSASCIIStringEncoding];
            span = mime.length / L;

            for (int k=0; k<stringForCounting.length; k++){
                for(int i=0; i<mime.length / L; i++){
                if  (GetPosition(T[k])==-2){
                    NSString *string = [mime substringWithRange:NSMakeRange(mime.length - L, L)];
                    printf([[NSString stringWithFormat:@"%@", string] UTF8String]);
                    break;
                }

                if (i == GetPosition(T[k])){
                    NSString *string2 = [mime substringWithRange:NSMakeRange(i * L, L)];
                    printf([[NSString stringWithFormat:@"%@", string2] UTF8String]);
                    } 
                }
            }
        
            printf([@"\n" UTF8String]);
            
            }
}
