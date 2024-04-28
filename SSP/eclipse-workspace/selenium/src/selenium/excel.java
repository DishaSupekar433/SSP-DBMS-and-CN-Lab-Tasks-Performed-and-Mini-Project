package selenium;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.net.HttpURLConnection;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class excel {
	public static void main(String[] args) throws IOException {
		String path = "C:\\Users\\DISHA\\OneDrive\\Desktop\\ex.xlsx";
		File f = new File(path);
		FileInputStream file = new FileInputStream(f);
		XSSFWorkbook wb = new XSSFWorkbook(file);
		XSSFSheet sh = wb.getSheet("ex");
		XSSFRow r = sh.getRow(1);
		XSSFCell c = r.getCell(1);
		System.out.println(c.getStringCellValue());
	}
}
/*
package selenium;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

public class excel {
    public static void main(String[] args) throws IOException {
        String url = "https://d.docs.live.net/3bad5cbc0dd35bee/Documents/ex.xlsx";

        // Open a connection to the URL
        URL excelUrl = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) excelUrl.openConnection();

        // Set up the connection
        connection.setRequestMethod("GET");

        // Get the input stream to read the data
        InputStream inputStream = connection.getInputStream();

        try {
            // Create a Workbook instance from the input stream
            Workbook workbook = WorkbookFactory.create(inputStream);

            // Now you can work with the workbook as needed
        } catch (Exception e) {
            // Handle the exception, e.g., log an error message or print it
            e.printStackTrace();
        } finally {
            // Close the input stream and the connection
            inputStream.close();
            connection.disconnect();
        }
    }
}*/

/*
 package excelfirst;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class read {

	public static void main (String args[]) throws IOException
	{
		String path="C:\\Users\\DISHA\\OneDrive\\Desktop\\Selenium workshop\\excel.xlsx";
		File f = new File(path);
		FileInputStream file=new FileInputStream(f);
		XSSFWorkbook wb=new XSSFWorkbook(file);
		XSSFSheet sh=wb.getSheet("Sheet1");
		//sh.getRow(1);
		XSSFRow r=sh.getRow(0);
		XSSFCell c=r.getCell(0);
		
		XSSFRow r2 = sh.getRow(1); // Row 1
        XSSFCell c2 = r2.getCell(0); // Column 1
        System.out.println(c.getStringCellValue());
		System.out.println(c2.getStringCellValue());
		
	}

}*/
