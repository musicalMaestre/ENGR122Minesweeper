function updateStatistics(allTimes, gameTime, gamesWon, gamesLost)
allTimes = [allTimes, gameTime]; %these generate statistics 
bestTime = min(allTimes);
avgTime = sum(allTimes)/numel(allTimes);
totalGames = gamesWon + gamesLost;
percentWin = (gamesWon / totalGames) * 100;
percentLoss = (gameLost / totalGames) * 100; %which ends here

set(handles.bestTimeDisplay, 'String', bestTime);
set(handles.avgTimeDisplay, 'String', avgTime);
set(handles.totalGameDisplay, 'String', totalGames);
set(handles.percentWinDisplay, 'String', percentWin);
set(handles.percentLossDisplay, 'String', percentLoss);
guidata(hObjects, handles);

save('statistics.mat', 'gamesWon', 'gamesLost', 'allTimes', 'winStreak'); %saves the stats that everything is calculated from for the next go around
end