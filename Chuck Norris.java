import java.util.*;
import java.io.*;
import java.math.*;
import java.lang.String.*;

class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        String MESSAGE = in.nextLine();

   
        byte[] b = MESSAGE.getBytes();
        MESSAGE = "";
         for (int i=0; i<b.length; i++) {
            String temp = Integer.toString(b[i],2);
            if (temp.length()%7 != 0) {
                temp = "0"+temp;
            }
            MESSAGE += temp; 
        }
        
        char prevChar='\0';
        int count = 0;
        
        List list = new ArrayList();

        for(int i=0; i<MESSAGE.length(); i++) {
            if  (i<MESSAGE.length()){
                count++;
                String wsp =  count<=1 ? "" : " ";
                
                if (MESSAGE.charAt(i)=='0') {
                    if  (prevChar!=MESSAGE.charAt(i)){
                        System.out.print(wsp+"00 0");
                    } else {
                        System.out.print("0");
                    }
                } else {
                    if  (prevChar!=MESSAGE.charAt(i)){
                        System.out.print(wsp+"0 0");
                    } else {
                        System.out.print("0");
                    }
                }
                prevChar = MESSAGE.charAt(i);
            }
        }
    }
}