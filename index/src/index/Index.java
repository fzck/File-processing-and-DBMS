/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package index;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author flzauleck
 * via NetBeans
 */

public class Index {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        String indexFile = "index.txt";
        String dataFile = "data.txt";
        BufferedReader bufferedReader = null;
        
        List<String> nameList = new ArrayList<>();
       
        
        try {
           String name;
           int index;
           
           //name to search
            Scanner sc = new Scanner(System.in);
            System.out.println("Enter Name of person to be searched: ");
            String nameToSeek = sc.nextLine();
                                
            bufferedReader = new BufferedReader(new FileReader(dataFile));
            
            //add names to list
            while((name = bufferedReader.readLine()) != null) {                    
                nameList.add(name);                
            }        
            
            //for indices
            bufferedReader = new BufferedReader(new FileReader(indexFile));           
            String curr;            
            while ((curr = bufferedReader.readLine()) != null) {
                if (curr.charAt(0)== nameToSeek.charAt(0)){
                    index = curr.charAt(2) - 48;
                    break;                                      
                }
                
            }
            
            boolean foundName = false;
            for (int i = 0; i < nameList.size(); i++) {
                if (nameList.get(i).equals(nameToSeek)) {
                    foundName = true;
                    System.out.println("Name found at index "+i);
                    break;
                }
              
            }
            if (!foundName){
                System.out.println("Name not found");
            }
           
            
            
           
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
    

        
        
        
        
        
        
   
    