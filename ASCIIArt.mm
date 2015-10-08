#include <Foundation/Foundation.h>

int GetPosition(char c) {
   if (c >= 'a' && c <= 'z') {
      return c - 'a';
   } else if (c >= 'A' && c <= 'Z') {
      return c - 'A';
   } else  {
      // Indicate that it isn't a letter.
      return -2;
   }
}
 
int main(int argc, const char * argv[]) {
    int L;
    scanf("%d", &L); fgetc(stdin);
    int H;
    scanf("%d", &H); fgetc(stdin);
    char T[256];
    gets(T);

    NSString *stringForCounting =  [NSString stringWithCString:T encoding:NSASCIIStringEncoding];
  
    for (int j = 0; j < H; j++) {
    	char ROW[1024];
        gets(ROW);
        
        NSString *rowString =  [NSString stringWithCString:ROW encoding:NSASCIIStringEncoding];

         for (int k=0; k<stringForCounting.length; k++){
             for(int i=0; i<rowString.length/L; i++){
              	if  (GetPosition(T[k])==-2){
                    NSString *string = [rowString substringWithRange:NSMakeRange(rowString.length - L, L)];
                    printf([[NSString stringWithFormat:@"%@", string] UTF8String]);
                    break;
               	}

                if (i == GetPosition(T[k])){
                    NSString *string2 = [rowString substringWithRange:NSMakeRange(i * L, L)];
                    printf([[NSString stringWithFormat:@"%@", string2] UTF8String]);
                } 
            }
        }
        
        printf([@"\n" UTF8String]);
    }
}
