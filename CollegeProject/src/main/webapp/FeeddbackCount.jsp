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
<form action="FeeddbackCount.jsp" style="text-align: center" name="fbform">
 
  <c:if test="${param.instructor == null }">
  Intructor:
  <select name="instructor" id="instructor" onchange="submit()">
    <option>Select Instructor</option>
    <c:forEach var="i" items="${dao.showInstructor()}">
    <option value="${i}">${i}
    </option>
    </c:forEach>
  </select><br/><br/>
  </c:if>
  <c:if test="${param.instructor != null }">
  Intructor:
    <select name="instructor">
       <option value="${param.instructor }">${param.instructor }</option>
    </select><br/><br/>
     Subject:
    <select id="subject" name="subject" onchange="submit()">
  
   <option>Select</option>
     <c:forEach var="s" items="${dao.showSubjects(param.instructor)}">
         <option value="${s}">${s}</option>
    </c:forEach>
    </select>
  </c:if>
  
  </form>
  <c:if test="${param.instructor != null && param.subject != null }">
    <br/><br/><table border="3" align="center">
      <tr>
        <th>Feedback Value</th>
        <th>Count</th>
      </tr>
     <c:set var="inst" value="${param.instructor}" />
     <c:set var="subj" value="${param.subject}" />
     <c:forEach var="fb" items="${dao.countFbValue(inst,subj)}">
     <tr>
       <td>${fb[0]}</td>
       <td>${fb[1]}</td>
     </tr>
     </c:forEach>
    </table>
  </c:if>
 <script type="text/javascript">
   function submit(){
        doucument.fbform.submit()
	   }
 </script>
</body>
</html>