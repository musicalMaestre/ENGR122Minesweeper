question = ('Please choose difficulty, Beginner (9x9, 10 bombs), Intermediate (16x16, 40 bombs), Expert (24x24, 99 bombs) or Custom\n');
choice = input(question, 's');
if strcmpi(choice, 'Beginner')
    X = 9; Y = 9;
    bombs = 10;
elseif strcmpi(choice, 'Intermediate')
    X = 16; Y = 16;
    bombs = 40;
elseif strcmpi(choice, 'Expert')
    X = 24; Y = 24;
    bombs = 99;
elseif strcmpi(choice, 'Custom')
    heightPrompt = 'Height\n'; widthPrompt = 'Width\n'; bombPrompt = 'Bombs\n';
    X = input(heightPrompt);
    Y = input (widthPrompt);
    bombs = input(bombPrompt);
end

endGame = 0;
minePlace = zeros(X,Y);
[height, width] = size(minePlace);
colPrompt = ('Chose a row\n');
rowPrompt = ('Unknow spaces are represented by 100 \n\nChose a column\n');
typePrompt = ('For a flag type "F", to click type "C" (Flags are represented by 70)\n');

mineOverlay = placeBombs(height, width, bombs, minePlace);
minePlace = placeOnMap(minePlace, mineOverlay);
mineMap = numSet(minePlace, height, width);
sprintf("done")
clear count; clear mineOverlay; clear bombPromt; clear heightPrompt; clear question; clear widthPrompt;

gameMap = zeros(X, Y);
for n = 1:X
    for m = 1:Y
        gameMap(n,m) = 'd';
    end
end
gameMap = gamePlay(mineMap, minePlace, gameMap, rowPrompt, colPrompt, typePrompt, height, width, bombs);
disp(gameMap)


function mineOverlay = placeBombs(height, width, bombs, minePlace)
mineOverlay = minePlace;
count = 0;
while count < bombs
    row = randi([1, height]);
    col = randi([1, width]);
    if mineOverlay(row, col) ~= 9
        mineOverlay(row,col) = 9; %9 = bomb
        count = count + 1;
    end
end
end

function minePlace = placeOnMap(minePlace, mineOverlay)
[heightOver, widthOver] = size(mineOverlay);
for n = 1:heightOver
    for m = 1:widthOver
        minePlace(n,m) = mineOverlay(n,m);
    end
end
end

function mineMap = numSet(minePlace, height, width)
mineMap = minePlace;
for n = 1:height
    for m = 1:width
        if minePlace(n, m) == 9
            for row = n-1:n+1
                for col = m-1:m+1
                    if row >= 1 && row <= height && col >= 1 && col <= width && minePlace(row, col) ~= 9
                        mineMap(row, col) = mineMap(row, col) + 1;
                    end
                end
            end
        end
    end
end
end

function gameMap = openSpots(row, col, mineMap, gameMap, height, width, x) %this function needs fixing, it is supposed to reveal all spots that are zero and every spot around them. preferably without recursion.
    gameMap(col, row) = mineMap(col, row);
    while x <= length(gameMap)*2
        for m = row-1:row+1
            for n = col-1:col+1
                if m >= 1 && m <= height && n >= 1 && n <= width && mineMap(m, n) ~= 9 && mineMap(n,m) ~= gameMap(n,m)
                    gameMap(n, m) = mineMap(n, m);
                    gameMap
                    x = x+1;
                end
            end
        end
        m = m-1:m+1;
        n = n-1:n+1;
    end
end


function gameMap = gamePlay(mineMap, minePlace, gameMap, rowPrompt, colPrompt, typePrompt, height, width, bombs)
endGame = 0;
while endGame < bombs
    disp(gameMap)
    row = input(rowPrompt);
    col = input(colPrompt);
    type = input(typePrompt, 's');
    endGame = 0;
    if row <= height && col <= width
        if strcmpi(type, 'F')
            if gameMap(col, row) ~= 'F'
                gameMap(col, row) = 'F';
            else
                gameMap(col, row) = "F";
            end
        else
            if mineMap(col, row) == 9
                for n = 1:height
                    for m = 1:width
                        if minePlace(m,n) == 9
                            gameMap(m,n) = minePlace(m,n);
                            endGame = endGame + 1;
                        end
                    end
                end
            elseif mineMap(col, row) == 0
                x = 0;
                gameMap = openSpots(row, col, mineMap, gameMap, height, width, x);

            else
                gameMap(col, row) = mineMap(col, row);
            end
        end
        if endGame < bombs
            endGame = 0;
            for n = 1:height
                for m = 1:width
                    if gameMap(m, n) == 70 && minePlace(m, n) == 9
                        endGame = endGame + 1;
                    elseif gameMap(m, n) == 70 && minePlace(m, n) ~=9
                        endGame = endGame - 1;
                    end
                end
            end
        end
    end
end
end
