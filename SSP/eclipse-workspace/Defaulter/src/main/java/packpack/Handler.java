package packpack;
//pass an attribute no in a tag and print the multiplication table of that number
import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class Handler extends TagSupport{
	private static final long serialVersionUID = 1L;
	private int number;
	public void setNumber(int number) {
        this.number = number;
    }
	public int doStartTag() throws JspException {
		// TODO Auto-generated method stub
		try {
			JspWriter out = pageContext.getOut();
			out.println("<h3>Fibonacci series: </h3>");
			 int n1=0,n2=1,n3,i;    
			 out.print(n1+", "+n2);//printing 0 and 1    
			    
			 for(i=2;i<number;++i)//loop starts from 2 because 0 and 1 are already printed    
			 {    
			  n3=n1+n2;    
			  out.print(", "+n3);    
			  n1=n2;    
			  n2=n3;    
			 }    
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SKIP_BODY;
	}
}