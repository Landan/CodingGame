import java.util.*;
import java.io.*;
import java.math.*;

class Player {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        
        int[] array = new int[8];
        
        // game loop
        while (true) {
            int SX = in.nextInt();
            int SY = in.nextInt();
            
            int max = 0;
            // get max height
            for (int i=0; i<array.length; i++){
                int MH = in.nextInt();
                array[i] = MH;
                if (array[i]>max) {
                    max = array[i];
                }
            }
            
            if (array[SX]==max) {
                System.out.println("FIRE");
            } else {
                System.out.println("HOLD");
            }
        }
    }
}