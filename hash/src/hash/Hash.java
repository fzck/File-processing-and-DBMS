/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hash;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 *
 * @author flzauleck
 * via NetBeans
 */
public class Hash {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        
        String inputFile = "inputs.txt";
        String outputFile = "hashes.txt";
        BufferedReader bufferedReader = null;
        BufferedWriter bufferedWriter;
       
        try {
            
            String name;    
            bufferedReader = new BufferedReader(new FileReader(inputFile));                                 
            bufferedWriter = new BufferedWriter(new FileWriter(outputFile));
            
            int x;
            while((name = bufferedReader.readLine()) != null) {
                x = hash(name);                   
                System.out.println(x);
                bufferedWriter.write(x);
                bufferedWriter.newLine();
            }
            bufferedWriter.close();
      
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }    
   
    }
     public static int hash(String st) {
        int value = 0;
        for ( int i = 0; i < st.length(); i++ )
            value = 31*value + st.charAt(i);
        return value;
    }
    
}
    

