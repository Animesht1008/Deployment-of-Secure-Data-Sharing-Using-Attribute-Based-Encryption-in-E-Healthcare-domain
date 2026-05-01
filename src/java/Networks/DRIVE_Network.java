
package Networks;

import java.io.File;
import java.io.FileInputStream;
import org.apache.commons.net.ftp.FTPClient;

public class DRIVE_Network {
    
FTPClient client = new FTPClient();
    FileInputStream fis = null;
    boolean status;

    public boolean upload(File file) {
        try {
            
            client.connect("ftp.drivehq.com");
            client.login("srishiva2462002", "Ss@12345");
            System.out.print("\nLogin Success");
            client.enterLocalPassiveMode();
            fis = new FileInputStream(file);
            status = client.storeFile("/" + file.getName(), fis);
            System.out.print("\nUploaded");
            
            //file path of drive storage
            client.logout();
            fis.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        if (status) {
            System.out.println("success");
            return true;
        } else {
            System.out.println("failed");
            return false;

        }

    }
}