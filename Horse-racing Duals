import java.util.*;
import java.io.*;
import java.math.*;

class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();
        
        int Pi = 0;
        
        int prevInt = N;
        int res = 500;
        
        Integer[] a  = new Integer[N];
        int count = 0;
        
        for (int i = 0; i < N; i++) {
            a[i] = in.nextInt();
        }
        
        // Bad solution        
        // for (int i = 0; i < N; i++) {
        //     for (int j = 0; j < N; j++) {
        //         if (a[i]!=a[j]){
        //             if  (a.length>i+1){
        //                 if (Math.abs(a[i] - a[j]) < res) {
        //                     res = Math.abs(a[i] - a[j]);
        //                 }
        //             }
        //         }
        //     }
        // }
        
        // Good solution
        Arrays.sort(a, new Comparator<Integer>()
        {
            @Override
            public int compare(Integer x, Integer y)
            {
             return x - y;
            }
        });
        
        for (int i = 0; i < N; i++) {
            if  (a.length>i+1){
                if  (Math.abs(a[i] - a[i+1])<res) {
                    res = Math.abs(a[i] - a[i+1]);  
                }
            }
        }
        
        System.out.println(res);
    }
}
