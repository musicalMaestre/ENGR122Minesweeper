%before this you need to run gameInit this all the function generating the
%game maps, comments for it or on the file

load('statistics'); %load the file 'statistics' before so that it's variables can be used (if that file doesn't exist run resetStats
[gameMap, gamesWon, gamesLost, gameTime, winStreak] = gamePlay(mineTable, gameMap, height, width, bombs, gamesWon, gamesLost, winStreak); %this is the actual gameplay, comments on actual play below.
allTimes = [allTimes, gameTime]; %these are generation of random statistics 
bestTime = min(allTimes);
avgTime = sum(allTimes)/numel(allTimes);
totalGames = gamesWon + gamesLost;
percentWin = (gamesWon / totalGames) * 100;
percentLoss = (gamesLost / totalGames) * 100; %which ends here

save('statistics.mat', 'gamesWon', 'gamesLost', 'allTimes', 'winStreak'); %saves the stats that everything is calculated from for the next go around
                                                                          %if you want to reset that stats run resetStats

function gameMap = openSpots(row, col, mineTable, gameMap, height, width) %this function checks all spots and opens the spots around blank slots
for n = 1:height
    for m = 1:width %for each spot
        for Row = n-1:n+1
            for Col = m-1:m+1 %for each spot around it
                if Row >= 1 && Row <= height && Col >= 1 && Col <= width %if the spot being checked is within bounds
                    if gameMap(m, n) == 0
                        gameMap(Col, Row) = mineTable(Col, Row); %then reveal the spots around it
                    end
                end
            end
        end
    end
end
for n = height:-1:1 %do it again but going the other way. this is too avoid recursive function because whenever I tried it like that it would return a stack overflow
    for m = width:-1:1 %the first half does everything to the bottom and left of the point, and the second half does everything to the top and right
        for Row = n-1:n+1
            for Col = m-1:m+1
                if Row >= 1 && Row <= height && Col >= 1 && Col <= width
                    if gameMap(m, n) == 0
                        gameMap(Col, Row) = mineTable(Col, Row);
                    end
                end
            end
        end
    end
end
end 


function [gameMap, gamesWon, gamesLost, gameTime, winStreak] = gamePlay(mineTable, gameMap, height, width, bombs, gamesWon, gamesLost, winStreak) %this is the actual game there are currently a couple of peices missing because I removed them, but I'll say what they are and where they should go
endGame = 0; %this initializes the end of game variable, it also is the marker for whether you win or lose
tic; %starts the game timer for statistical purposes
while endGame < bombs && endGame >= 0 %the actual game and this keeps going until you click on a bomb or flag all of them
    endGame = 0; %reset the end of game so that there isn't an early win
    %here you need to add the input for which spot is choosen and flag or a
    %regular click
    if row >= 1 && row <= height && col >= 1 && col <= width %if it is a legal move (should be less needed with GUI) (row and col can be changed)
        if strcmpi(type, 'F') %if flag was choosen
            if gameMap(col, row) ~= 'F' %and there is no flag
                gameMap(col, row) = 'F'; %flag that spot (nothing then stops you from choosing it though)
            else
                gameMap(col, row) = 'd'; %if there is a flag, remove it
            end
        else %if the spot was choosen to be clicked
            if mineTable(col, row) == 9 %if it is a nine(bomb)
                for n = 1:height
                    for m = 1:width
                        if mineTable(m,n) == 9
                            gameMap(m,n) = mineTable(m,n); %reveal all the bombs (and no new info)
                        end
                    end
                end
                endGame = -1; %and set endGame to -1 so that the game ends with a loss
            elseif mineTable(col, row) == 0 %if the spot is a zero
                gameMap = openSpots(row, col, mineTable, gameMap, height, width); %reveal all zeros near it
            else
                gameMap(col, row) = mineTable(col, row); %otherwise just reveal that spot
            end
        end
        if endGame < bombs && endGame >= 0 %if you haven't lost yet
            endGame = 0;
            for n = 1:height
                for m = 1:width
                    if gameMap(m, n) == 70 && mineTable(m, n) == 9 %check each bomb for a flag
                        endGame = endGame + 1; %and add one to the endGame counter
                    elseif gameMap(m, n) == 70 && mineTable(m, n) ~=9 %if there is a flag with no bomb
                        endGame = endGame - 1; %remove one from the endGame counter so that you don't win unless only the bombs are flaged
                    end
                end
            end
        end
    end
end
%the game ending loop
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
end
