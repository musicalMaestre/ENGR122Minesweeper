function [bestTime, avgTime, totalGames, percentWin, percentLoss] = updateStatistics(allTimes, gameTime, gamesWon, gamesLost, winStreak)
allTimes = [allTimes, gameTime]; %these generate statistics 
bestTime = min(allTimes);
avgTime = sum(allTimes)/numel(allTimes);
totalGames = gamesWon + gamesLost;
percentWin = (gamesWon / totalGames) * 100;
percentLoss = (gamesLost / totalGames) * 100; %which ends here

save('statistics.mat', 'gamesWon', 'gamesLost', 'allTimes', 'winStreak'); %saves the stats that everything is calculated from for the next go around
end