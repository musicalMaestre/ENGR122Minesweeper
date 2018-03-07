function [gameMap, gamesWon, gamesLost, gameTime, winStreak] = gamePlay(mineTable, gameMap, height, width, bombs, gamesWon, gamesLost, winStreak, xIndex, yIndex, clickType) %this is the actual game there are currently a couple of peices missing because I removed them, but I'll say what they are and where they should go
endGame = 0; %this initializes the end of game variable, it also is the marker for whether you win or lose
tic; %starts the game timer for statistical purposes
while endGame < bombs && endGame >= 0 %the actual game and this keeps going until you click on a bomb or flag all of them
    endGame = 0; %reset the end of game so that there isn't an early win
    %here you need to add the input for which spot is choosen and flag or a
    %regular click
    if yIndex >= 1 && yIndex <= height && xIndex >= 1 && xIndex <= width %if it is a legal move (should be less needed with GUI) (row and col can be changed)
        if clickType == 3 %if flag was choosen
            if gameMap(xIndex, yIndex) ~= 11 %and there is no flag
                gameMap(xIndex, yIndex) = 11; %flag that spot (nothing then stops you from choosing it though)
            else
                gameMap(xIndex, yIndex) = 10; %if there is a flag, remove it
            end
        else %if the spot was choosen to be clicked
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
                gameMap = openSpots(yIndex, xIndex, mineTable, gameMap, height, width); %reveal all zeros near it
            else
                gameMap(xIndex, yIndex) = mineTable(xIndex, yIndex); %otherwise just reveal that spot
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