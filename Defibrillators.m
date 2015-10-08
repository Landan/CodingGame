#include <Foundation/Foundation.h>

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
 
double findDistance(double longitudeA, double longitudeB, double latitudeA, double latitudeB) {


    // NSLog(@"longitudeA = %f", longitudeA);
    // NSLog(@"longitudeB = %f", longitudeB);
    // NSLog(@"latitudeA = %f", latitudeA);
    // NSLog(@"latitudeB = %f", latitudeB);

    if (longitudeB == longitudeA && latitudeA == latitudeB)
    return 0;
    double x = (longitudeB - longitudeA) * cos((latitudeA + latitudeB) / 2);
    //NSLog(@"%f", x);
    double y = (latitudeB - latitudeA);
    double d = sqrt(x*x + y*y) * 6371;
    return (d);
}
 
int main(int argc, const char * argv[]) {
    char LON[50];
    scanf("%s", LON); fgetc(stdin);
    char LAT[50];
    scanf("%s", LAT); fgetc(stdin);
    int N;
    scanf("%d", &N); fgetc(stdin);
    
    double minDistance = 0.0f;
    
    NSString * res = @"";
    
    NSString *lonA =  [NSString stringWithCString:LON encoding:NSASCIIStringEncoding];
    NSString *latA =  [NSString stringWithCString:LAT encoding:NSASCIIStringEncoding];
    
    lonA = [lonA stringByReplacingOccurrencesOfString:@"," withString:@"."];
    latA = [latA stringByReplacingOccurrencesOfString:@"," withString:@"."];

    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSMutableArray *array = [NSMutableArray new];
    
    for (int i = 0; i < N; i++) {
        char DEFIB[256];
        gets(DEFIB);
        
        NSString *string =  [NSString stringWithCString:DEFIB encoding:NSASCIIStringEncoding];
        NSArray *elements = [string componentsSeparatedByString:@";"];
        [array addObject: elements];
    }
    
    for (int i=0; i<array.count; i++){
        NSArray * tempArray = [array objectAtIndex:i];
        
        id lonB = [tempArray objectAtIndex:tempArray.count - 2];
        id latB = [tempArray objectAtIndex:tempArray.count - 1];
        
        lonB = [lonB stringByReplacingOccurrencesOfString:@"," withString:@"."];
        latB = [latB stringByReplacingOccurrencesOfString:@"," withString:@"."];
       
       if([lonA floatValue] == [lonB floatValue] && [latA floatValue] == [latB floatValue]){
            //NSLog(@"%.20lf %.20lf %.20lf %.20lf", [lonA floatValue], [lonB floatValue], [latA floatValue], [latB floatValue]);
            res = [tempArray objectAtIndex:1];
            break;
       }
       
        double tempDistance;

        tempDistance = findDistance([lonA doubleValue], [lonB doubleValue], [latA doubleValue], [latB doubleValue]);
        
        if(tempDistance < minDistance || minDistance==0){
            minDistance = tempDistance;
            res = [tempArray objectAtIndex:1];
        }
    }
    
    printf([res UTF8String]);
}

