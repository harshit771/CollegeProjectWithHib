<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<form action="AddCourse.jsp">
  Duration:
  <input type="number" name="duration" /><br/><br/>
  Start Date:
  <input type="date" name="startDate" /><br/><br/>
  End Date:
  <input type="date" name="endDate" /><br/><br/>
  HOD:
  <input type="text" name="hod" /><br/><br/>
  <input type="submit" value="Add" />
</form>
<c:if test="${ param.startDate != null}">
<jsp:useBean id="course" class="infinite.collegeproject.CourseList" />
<jsp:setProperty property="duration" name="course"/>

<fmt:parseDate value="${param.startDate}" pattern="yyyy-MM-dd" var="sdate" />
<c:set var="sqlDate1" value="${dao.convertDate(sdate)}" />
	
<fmt:parseDate value="${param.endDate}" pattern="yyyy-MM-dd" var="edate" />
<c:set var="sqlDate2" value="${dao.convertDate(edate)}" />
	
<jsp:setProperty property="startDate" name="course" value="${sqlDate1}"/>
<jsp:setProperty property="endDate" name="course" value="${sqlDate2}"/>

<jsp:setProperty property="hod" name="course"/>

<c:out value="${dao.addCourse(course)}" />

</c:if>
</body>
</html>