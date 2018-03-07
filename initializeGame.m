function [mineTable, gameMap] = initializeGame(X, Y, bombs)
    uncovered = imread('facingDown.jpg'); %graphs the block image X * Y times in a 
    for i = 0:X
        for j = 0:Y
            image([0+i 1+i], [0+j 1+j], uncovered);
            hold on
        end
    end
    axis([0 X 0 Y]);
    mineTable = zeros(X, Y); %creates a table where of zeros where the bombs and numbers will be placed
    mineTable = placeBombs(X, Y, bombs, mineTable); %runs a function to place the bombs on the mineTable
    clear mineOverlay;
    mineTable = numSet(mineTable, X, Y); %adds the numbers that go around it
    
    gameMap = zeros(X, Y)
    gameMap(:,:) = 10; %gameMap is now full of uncovered squares (10)
end