<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("usernm");

    if (username != null && !username.isEmpty()) {
        Cookie cookie = new Cookie("username", username);
        cookie.setMaxAge(60 * 60); // 1 hour
        response.addCookie(cookie);
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Result</title>
</head>
<body>

<h2>Cookie Stored Successfully</h2>

<%
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("username")) {
%>
                <p>Welcome, <%= c.getValue() %>!</p>
<%
            }
        }
    }
%>

</body>
</html>