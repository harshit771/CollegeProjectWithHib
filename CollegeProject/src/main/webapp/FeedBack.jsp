<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="infinite.collegeproject.CollegeDAO" />
<form method="get" action="FeedBack.jsp" style="text-align: center">
  <h2>Select Instructor</h3>
 Instructor:
  <select name="instructor">
    <option>Select Instructor</option>
    <c:forEach var="i" items="${dao.showInstructor()}">
    <option value="${i}">
     <c:out value="${i}" />
    </option>
    </c:forEach>
  </select><br/><br/>
  <input type="submit" value="Next" /><br/><br/>
</form>
<c:if test="${param.instructor != null}">
<c:set var="inst" value="${param.instructor}" />
<form method="get" action="FeedBack.jsp" style="text-align: center">

  Student Name:
  <input type="text" name="studentName" /><br/><br/>
  Instructor:
  <input type="text" name="instructor" value="${inst}" readonly/><br/><br/>
  Subject:
   <select name="subject">
    <option>Select Subject</option>
    <c:forEach var="s" items="${dao.showSubjects(inst)}">
    <option value="${s}">
     <c:out value="${s}" />
    </option>
    </c:forEach>
  </select><br/><br/>
  FeedBack Value:
  <input type="radio" name="fbValue" value="Poor" />Poor
  <input type="radio" name="fbValue" value="Fair" />Fair
  <input type="radio" name="fbValue" value="Good"/>Good
  <input type="radio" name="fbValue" value="Excellent"/>Excellent
  <br/><br/>
  
  <input type="submit" value="Submit" />
</form>
</c:if>

<c:if test="${param.studentName != null  }">
<jsp:useBean id="fb" class="infinite.collegeproject.FeedBack" />
<jsp:setProperty property="*" name="fb"/>
<c:out value="${dao.addFeedBack(fb)}" />

</c:if>
</body>
</html>