function [gamesWon, gamesLost, winStreak, gameTime, bestTime, avgTime, totalGames, percentWin, percentLoss] = gameEnd(endGame, allTimes, gamesWon, gamesLost, winStreak, bombs)
if endGame == bombs %if all the bombs are flagged
    gamesWon = gamesWon + 1; %add one to the amount of games one(for statistics)
    disp('You Win') %say that you win
    winStreak = winStreak + 1; %and up the win streak
    gameTime = toc; %end the timer and store the time
elseif endGame < 0 %if you lose
    gamesLost = gamesLost + 1; %add one to the amount of games lost (for statistics)
    disp('You Lose') %say that you lost
    winStreak = 0; %and reset the win streak
    gameTime = toc; %end the timer and store the time
end
[bestTime, avgTime, totalGames, percentWin, percentLoss] = updateStatistics(allTimes, gameTime, gamesWon, gamesLost, winStreak);
end