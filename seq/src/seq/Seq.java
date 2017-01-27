/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package seq;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

/**
 *
 * @author flzauleck
 * via NetBeans
 */
public class Seq {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String inputFile = "input1.txt";
        String outputFile = "output1.txt";
        ArrayList<String> list = new ArrayList<>();
        BufferedReader bufferedReader = null;
        BufferedWriter bufferedWriter = null;

        try {
            
            String name;
            int ctr = 1;
          
            bufferedReader = new BufferedReader(new FileReader(inputFile));
            bufferedWriter = new BufferedWriter(new FileWriter(outputFile));
            
              
            while((name = bufferedReader.readLine()) != null) {
                list.add(name);
                ++ctr;
            }   
                //list.add("Steven");
            System.out.println("Enter name of person to be added:");
            Scanner sc = new Scanner(System.in);
            String newName = sc.nextLine();
                
            list.add(newName);
                              
            Collections.sort(list);
            System.out.println(list);
            
            int i = 0;
            while(i != ctr){
                bufferedWriter.write(list.get(i));
                bufferedWriter.newLine();
                i++;
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
}
    

    

