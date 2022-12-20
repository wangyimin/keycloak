
<%
    Cookie killMyCookie = new Cookie("JSESSIONID", null);
     killMyCookie.setMaxAge(0);
     killMyCookie.setPath("/");
     response.addCookie(killMyCookie);
     request.logout();
     //response.setHeader("Cache-Control","no-cache");
     //response.setHeader("Pragma","no-cache");
     response.sendRedirect("http://localhost/");
     //response.setHeader("Cache-Control","no-cache");
     //response.setHeader("Pragma","no-cache");
%>

