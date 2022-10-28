<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script>
function corc(){
    var sub= document.getElementById("s").value;

    if(sub =="PC Architecture"){
    	addSub.theory.value="42";
    	addSub.practical.value="14";
    	addSub.instructor.value="Lt Col Pankaj Verma";
    }
    
    if(sub =="PC Hardware 1"){
    	addSub.theory.value="90";
    	addSub.practical.value="50";
    	addSub.instructor.value="Lt Col Pankaj Verma";
    }
      
    if(sub =="PC Hardware 2"){
    	addSub.theory.value="69";
    	addSub.practical.value="41";
    	addSub.instructor.value="Maj Abhishek Rai";
    }
    
    if(sub =="Microprocessor Interfacing"){
    	addSub.theory.value="107";
    	addSub.practical.value="93";
    	addSub.instructor.value="Maj Dinesh Dahiya";
    }
    
    if(sub =="C#"){
    	addSub.theory.value="84";
    	addSub.practical.value="56";
    	addSub.instructor.value="NIIT Instr";
    }
    if(sub =="Data Structures"){
    	addSub.theory.value="60";
    	addSub.practical.value="0";
    	addSub.instructor.value="Lt Col Ajay Kacker";
    }
    
    if(sub =="Operating System"){
    	addSub.theory.value="80";
    	addSub.practical.value="70";
    	addSub.instructor.value="Lt Col KP Krishna Kumar";
    }
    
    if(sub =="SQL Server"){
    	addSub.theory.value="66";
    	addSub.practical.value="34";
    	addSub.instructor.value="NIIT Instr";
    }
    
    if(sub =="Networking"){
    	addSub.theory.value="94";
    	addSub.practical.value="156";
    	addSub.instructor.value="Lt Col Pankaj Verma";
    }

    if(sub =="Advance Computer Concept & Data Security"){
    	addSub.theory.value="65";
    	addSub.practical.value="45";
    	addSub.instructor.value="Lt Col Ajay Kacker";
    }

    if(sub =="Value Added Services"){
    	addSub.theory.value="27";
    	addSub.practical.value="11";
    	addSub.instructor.value="Maj Abhishek Rai";
    }
    
 }
  

</script>
<body>
<form method="post" action="AddSubject.jsp" name="addSub">
Subject Id:
<input type="number" name="subjectId" /><br/><br/>

Subject:
<select name="subject" id="s" onchange="corc()">
<option value="s"> select </option>
<option value="PC Architecture">PC Architecture</option>
<option value="PC Hardware 1">PC Hardware 1</option>
<option value="PC Hardware 2">PC Hardware 2</option>
<option value="Microprocessor Interfacing devices & Embedded System">Microprocessor Interfacing devices & Embedded System</option>
<option value="C#">C#</option>
<option value="Data Structures">Data Structures</option>
<option value="Operating System">Operating System</option>
<option value="SQL Server">SQL Server</option>
<option value="Networking">Networking</option>
<option value="Advance Computer Concept & Data Security">Advance Computer Concept & Data Security</option>
<option value="Value Added Services">Value Added Services</option>
</select><br/><br/>

Theory:
<input type="number" name="theory" /><br/><br/>
Practical:
<input type="number" name="practical" /><br/><br/>
Instructor:
<input type="text" name="instructor" /><br/><br/>
Year:
<input type="number" name="year" /><br/><br/>

<input type="submit" value="Add" /><br/><br/>
</form>
<c:if test="${param.subjectId != null }">
<jsp:useBean id="sub" class="infinite.collegeproject.Subjects"/>
<jsp:setProperty property="*" name="sub"/>
<jsp:useBean id="dao" class="infinite.collegeproject.CollegeDAO" />
<c:out value="${dao.addSubject(sub)}"/>
</c:if>

</body>
</html>