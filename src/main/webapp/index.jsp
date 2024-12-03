<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.tictactoe.TicTacToe" %>
<%
    TicTacToe game = (TicTacToe) session.getAttribute("game");
    if (game == null) {
        game = new TicTacToe();
        session.setAttribute("game", game);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tic Tac Toe</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Tic Tac Toe</h1>
    <div class="wrapper">
        <div class="container">
            <% for (int i = 0; i < 9; i++) { %>
                <form method="post" action="move.jsp" style="display:inline;">
                    <input type="hidden" name="position" value="<%= i %>">
                    <button class="button-option"><%= game.getBoard()[i] %></button>
                </form>
            <% } %>
        </div>
        <form method="post" action="reset.jsp">
            <button id="restart">Restart</button>
        </form>
    </div>
    <% if (game.isGameWon() || game.getMoveCount() == 9) { %>
        <div class="popup">
            <p id="message">
                <%= game.isGameWon() ? (game.isXTurn() ? "O Wins!" : "X Wins!") : "It's a Draw!" %>
            </p>
            <form method="post" action="reset.jsp">
                <button id="new-game">New Game</button>
            </form>
        </div>
    <% } %>
</body>
</html>