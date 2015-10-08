import java.util.*;
import java.io.*;
import java.math.*;

class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt(); // the number of temperatures to analyse
        String TEMPS = in.nextLine(); // the N temperatures expressed as integers ranging from -273 to 5526

        int res = 50000;
        if  (N==0) res = 0;
        Integer[] a  = new Integer[N];
       
        for (int i = 0; i < N; i++) {
            a[i] = in.nextInt(); 
        }
        
        if (a.length==1) {
            res = a[0];
        } else {
            for (int i = 0; i < a.length; i++) {
                if (i+1<a.length){
                    if  (Math.abs(a[i])<Math.abs(res)){
                     res = a[i];
                    }
                }
            }
        }

        if (Arrays.asList(a).contains(Math.abs(res))) {
            res = Math.abs(res);
        }

        System.out.println(res);
    }
}