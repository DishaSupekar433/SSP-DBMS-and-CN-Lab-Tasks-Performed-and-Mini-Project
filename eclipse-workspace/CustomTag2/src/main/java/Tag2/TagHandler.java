package Tag2;
//pass an attribute no in a tag and print the multiplication table of that number
import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

public class TagHandler extends TagSupport{
	private static final long serialVersionUID = 1L;
	private int number;
	public void setNumber(int number) {
        this.number = number;
    }
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		try {
			JspWriter out = pageContext.getOut();
			out.println("<h3>Table of 5: </h3>");
			for(int i=1; i<=10; i++)
			{
				out.println(number+"*"+i+"="+number*i+"<br>");
			}
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:MM:SS");
			LocalDateTime now = LocalDateTime.now();
			out.println("\n<h3>Current date and time is: "+dtf.format(now)+"</h3>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SKIP_BODY;
	}
}
