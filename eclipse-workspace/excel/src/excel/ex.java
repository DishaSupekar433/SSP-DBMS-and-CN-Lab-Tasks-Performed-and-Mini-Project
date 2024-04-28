package excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.net.HttpURLConnection;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ex {
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
