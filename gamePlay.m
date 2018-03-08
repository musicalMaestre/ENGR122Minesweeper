function [gamesWon, gamesLost, gameTime, winStreak, bestTime, avgTime, totalGames, percentWin, percentLoss] = gamePlay(bombs, gamesWon, gamesLost, winStreak, xIndex, yIndex, clickType, allTimes) %this is the actual game there are currently a couple of peices missing because I removed them, but I'll say what they are and where they should go
global gameMap
global mineTable
height = size(gameMap, 1);
width = size(gameMap, 2);
endGame = 0; %this initializes the end of game variable, it also is the marker for whether you win or lose
%here you need to add the input for which spot is choosen and flag or a regular click
if yIndex >= 1 && yIndex <= height && xIndex >= 1 && xIndex <= width %if it is a legal move (should be less needed with GUI) (row and col can be changed)
    if clickType == 3 %if flag was choosen
        if gameMap(xIndex, yIndex) ~= 11 %and there is no flag
            gameMap(xIndex, yIndex) = 11; %flag that spot (nothing then stops you from choosing it though)
        else
            gameMap(xIndex, yIndex) = 10; %if there is a flag, remove it
        end
    else %if the spot was chosen to be clicked
        if mineTable(xIndex, yIndex) == 9 %if it is a nine(bomb)
            for n = 1:height
                for m = 1:width
                    if mineTable(m,n) == 9
                        gameMap(m,n) = mineTable(m,n); %reveal all the bombs (and no new info)
                    end
                end
            end
            endGame = -1; %and set endGame to -1 so that the game ends with a loss
        elseif mineTable(xIndex, yIndex) == 0 %if the spot is a zero
            gameMap(xIndex, yIndex) = mineTable(xIndex, yIndex);
            openSpots(height, width); %reveal all zeros near it
        else
            gameMap(xIndex, yIndex) = mineTable(xIndex, yIndex); %otherwise just reveal that spot
        end
    end
    if endGame < bombs && endGame >= 0 %if you haven't lost yet
        endGame = 0;
        for n = 1:height
            for m = 1:width
                if gameMap(m, n) == 11 && mineTable(m, n) == 9 %check each bomb for a flag
                    endGame = endGame + 1; %and add one to the endGame counter
                elseif gameMap(m, n) == 11 && mineTable(m, n) ~=9 %if there is a flag with no bomb
                    endGame = endGame - 1; %remove one from the endGame counter so that you don't win unless only the bombs are flaged
                end
            end
        end
    end
end
gameTime = 0; bestTime = 0; avgTime = 0; totalGames = 0; percentWin = 0; percentLoss = 0; % Define variables to avoid errors
if endGame < 0 || endGame >= bombs
    [gamesWon, gamesLost, winStreak, gameTime, bestTime, avgTime, totalGames, percentWin, percentLoss] = gameEnd(endGame, allTimes, gamesWon, gamesLost, winStreak, bombs);
end
end