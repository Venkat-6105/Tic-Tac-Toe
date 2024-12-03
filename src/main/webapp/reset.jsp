<%@ page import="com.tictactoe.TicTacToe" %>
<%
    TicTacToe game = new TicTacToe();
    session.setAttribute("game", game);
    response.sendRedirect("index.jsp");
%>