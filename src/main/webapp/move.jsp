<%@ page import="com.tictactoe.TicTacToe" %>
<%
    int position = Integer.parseInt(request.getParameter("position"));
    TicTacToe game = (TicTacToe) session.getAttribute("game");
    if (game != null) {
        game.makeMove(position);
    }
    response.sendRedirect("index.jsp");
%>