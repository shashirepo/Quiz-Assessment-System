


package Bean;
import java.util.LinkedHashMap;
public class MyBean {
  
	
LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
private String answer,question;
private String userid;
  
  public String getAnswer()
   {
    return answer;
   }
  public void setAnswer(String ans)
    {
             this.answer=ans;    
    }
  public void setQuestion(String ques)
  {
	  this.question=ques;
  }
  public String getQuestion()
  {
	  return this.question;
  }
  public void setanswer()
  {
	  map.put(question,answer);
  }
  public void setUserid(String userid)
  {
	  
  }
  } 
