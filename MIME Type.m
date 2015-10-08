#include <Foundation/Foundation.h>

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
 
int main(int argc, const char * argv[]) {
    int N; // Number of elements which make up the association table.
    scanf("%d", &N); fgetc(stdin);
    int Q; // Number Q of file names to be analyzed.
    scanf("%d", &Q); fgetc(stdin);
    
    NSMutableDictionary *templates = [NSMutableDictionary new];
    NSMutableDictionary *templatesCopy = [NSMutableDictionary new];
    NSMutableArray *files = [NSMutableArray new];
    
    for (int i = 0; i < N; i++) {
        char EXT[100]; // file extension
        char MT[500]; // MIME type.
        scanf("%s%s", EXT, MT); fgetc(stdin);
    
        NSString *extension =  [NSString stringWithCString:EXT encoding:NSASCIIStringEncoding];
        NSString *mime =  [NSString stringWithCString:MT encoding:NSASCIIStringEncoding];
        
        [templates setObject:mime forKey:extension];
    } 
    
    
    for (int i = 0; i < Q; i++) {
        char FNAME[500]; // One file name per line.
        gets(FNAME); // One file name per line.
        
        NSString *file =  [NSString stringWithCString:FNAME encoding:NSASCIIStringEncoding];
        NSString *name;
        
        NSArray *separatedFile = [file componentsSeparatedByString:@"."];
        if ([file rangeOfString:@"."].location != NSNotFound) {
            name = [separatedFile objectAtIndex:separatedFile.count-1];
        } else {
           name = @"";
        }
            
        fprintf(stderr, [[NSString stringWithFormat:@"file = %@\n", name] UTF8String]);
            
        [files addObject:name];
    }

    //fprintf(stderr, [[NSString stringWithFormat:@"Q = %d\n", Q] UTF8String]);

    int counter = 0;

    for (int i = 0; i<files.count; i++){
        NSString* tempFileName = [files objectAtIndex: i];
        
        //fprintf(stderr, [[NSString stringWithFormat:@"count = %d\n", tempFileNameArray.count] UTF8String]);
        
        NSArray *separatedFile = [tempFileName componentsSeparatedByString:@"."];
        NSString *value = [templates objectForKey:[separatedFile objectAtIndex:0]];
        
        if(!value.length){
            value = [templates objectForKey:[[separatedFile objectAtIndex:0] uppercaseString]];
            if(!value.length){
                value = [templates objectForKey:[[separatedFile objectAtIndex:0] lowercaseString]];
            } 
        } 

        if (value){
            counter++;
            printf([[NSString stringWithFormat: @"%@\n", value] UTF8String]);
        }
        
        if (counter == 0) {
            printf([@"UNKNOWN\n" UTF8String]);
        }
        
        counter = 0;
    }

    // Write an action using printf(). DON'T FORGET THE TRAILING NEWLINE \n
    // To debug: fprintf(stderr, [@"Debug messages\n" UTF8String]);

    //printf([@"UNKNOWN\n" UTF8String]); // For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.
}