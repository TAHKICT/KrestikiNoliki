<%@ page import="DBLogic.getResults" %>
<%@ page import="java.util.List" %>
<%@ page import="DBLogic.winners" %>
<%--
  Created by IntelliJ IDEA.
  User: админ
  Date: 18.11.14
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Game Results</title>

</head>
<body>
<table>
    <tr>
        <td>id</td>
        <td>winner</td>
        <td>player #1</td>
        <td>plater #2</td>
    </tr>
</table>
<%
    getResults getResults = new getResults();
    List <winners> winnersList = getResults.get();
    System.out.println(winnersList.size());
    for(int i = 0; i < winnersList.size(); i++){  %>
<table>
    <tr>
        <td><%=winnersList.get(i).getId()%> </td>
        <td><%=winnersList.get(i).getWinner()%></td>
        <td><%=winnersList.get(i).getPlayer1()%></td>
        <td><%=winnersList.get(i).getPlayer2()%></td>
    </tr>
</table>
<%
    }
%>
</body>
</html>