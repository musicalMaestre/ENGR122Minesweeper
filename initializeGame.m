function initializeGame(X, Y, bombs)
    global mineTable
    global gameMap
    uncovered = imread('facingDown.jpg');
    for i = 1:X
        for j = 1:Y
            image([i-1 i], [j-1 j], uncovered);
            set(gca,'YDir','reverse');
            hold on
        end
    end
    axis([-1 X+1 -1 Y+1]);
    tic;
    mineTable = zeros(X, Y); %creates a table where of zeros where the bombs and numbers will be placed
    placeBombs(X, Y, bombs); %runs a function to place the bombs on the mineTable
    clear mineOverlay;
    numSet(X, Y); %adds the numbers that go around it
    
    gameMap = zeros(X, Y);
    gameMap(:,:) = 10; %gameMap is now full of uncovered squares (10)
end