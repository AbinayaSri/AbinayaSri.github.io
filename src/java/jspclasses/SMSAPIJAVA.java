package jspclasses;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLConnection;
import java.net.URL; 

/**
 *
 * @author MKS
 */
public class SMSAPIJAVA {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
     
      func();
      
        
    }
   public static void func()
    {
        try {
           
            URL url = new URL("https://smsapi.engineeringtgr.com/send/?Mobile=9444999732&Password=welcome123&Message=hellooo&To=9444999732&Key=abiakW7OaNiybFcMokn14SG");
            URLConnection urlcon = url.openConnection();
            InputStream stream = urlcon.getInputStream();
            int i;
            String response="";
            while ((i = stream.read()) != -1) {
                response+=(char)i;
            }
            if(response.contains("success")){
                System.out.println("Successfully send SMS");
               
            }else{
                System.out.println(response);
               
            }
        } catch (IOException e) {
            System.out.println(e.getMessage());
            System.out.println("hello");
        }
    }
}

               