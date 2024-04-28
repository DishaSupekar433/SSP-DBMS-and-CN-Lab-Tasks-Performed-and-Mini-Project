
/*
package selenium;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.Select;

public class c1 {
	public static void main(String[] args) {
		ChromeDriver driver = new ChromeDriver(); //launch the browser
		driver.manage().window().maximize(); //to maximize browser //method chaining
		driver.get("https://tutorialsninja.com/demo/index.php?route=account/login");//launch url
		WebElement UserID = driver.findElement(By.id("input-email")); //locator-id 
		UserID.sendKeys("dysupekarsvc406@gmail.com");
		WebElement Pass = driver.findElement(By.name("password")); //locator-name
		Pass.sendKeys("Disha_4303");
		driver.findElement(By.xpath("//input[@value='Login']")).click(); //locator-xpath 
		//to find x path -> inspect-> select some class or something -> ctrl+f -> enter -> //input[@class='form-control']
		//driver.findElement(By.linkText("Edit Account")).click(); //locator-linkText
		//driver.findElement(By.partiallinkText("Edit A")).click(); //locator-partiallinkText
		Actions act = new Actions(driver);
		WebElement mp3player = driver.findElement(By.xpath("(//*[@class='dropdown-toggle'])[5]"));
		act.moveToElement(mp3player).perform();
		mp3player.click();
		
	}
}*/

/*
public class c1 {
	public static void main(String[] args) throws InterruptedException {
		ChromeDriver driver = new ChromeDriver(); //launch the browser
		driver.manage().window().maximize(); //to maximize browser //method chaining
		driver.get("https://opensource-demo.orangehrmlive.com/web/index.php/auth/login");
		Thread.sleep(3000);
		driver.findElement(By.xpath("//*[@name='username']")).sendKeys("Admin");
		driver.findElement(By.xpath("//*[@type='password']")).sendKeys("admin123");
		driver.findElement(By.xpath("//button[@type='submit']")).click();
		driver.findElement(By.xpath("//span[text()='Admin']")).click();//locator-text
	}
}
*/

/*
public class c1 {
	public static void main(String[] args) throws InterruptedException {
		//ChromeDriver driver = new ChromeDriver(); //launch the browser
		ChromeDriver driver = new ChromeDriver();
		driver.manage().window().maximize(); //to maximize browser //method chaining
		driver.get("https://mbasic.facebook.com/reg/?cid=103&refsrc=deprecated&_rdr");
		List<WebElement> months = driver.findElements(By.xpath("//select[@id='month']//option"));
		for(WebElement month : months)
		{
			
			System.out.println(month.getText());
			if(month.getText().equals("Sep"))
			{
				month.click();
				break;
			}
		}
		//WebElement month = driver.findElement(By.xpath("//select[@id='month']"));
		//Select ss = new Select(month);
		//ss.selectByIndex(4);
		//ss.selectByValue("6");
		//ss.selectByVisibleText("Nov");
		
		WebElement fname = driver.findElement(By.xpath("//input[@name='firstname']"));
		fname.sendKeys("ABC");
		Thread.sleep(3000);
		Actions act = new Actions(driver);
		act.sendKeys(Keys.TAB).sendKeys("xyz").build().perform();
		act.sendKeys(Keys.TAB).perform();
		//EdgeDriver driver2 = new EdgeDriver();
		//act.moveToElement(target); //mouse hover
	}
}*/

