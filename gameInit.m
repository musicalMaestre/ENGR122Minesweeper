endGame = 0;
mineTable = zeros(X,Y);
[height, width] = size(mineTable);

mineOverlay = placeBombs(height, width, bombs, mineTable);
mineTable = placeOnMap(mineTable, mineOverlay);
clear mineOverlay;
mineTable = numSet(mineTable, height, width);

function mineOverlay = placeBombs(height, width, bombs, mineTable)
mineOverlay = mineTable;
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

function mineTable = placeOnMap(mineTable, mineOverlay)
[heightOver, widthOver] = size(mineOverlay);
for n = 1:heightOver
    for m = 1:widthOver
        mineTable(n,m) = mineOverlay(n,m);
    end
end
end

function mineTable = numSet(mineTable, height, width)
for n = 1:height
    for m = 1:width
        if mineTable(n, m) == 9
            for row = n-1:n+1
                for col = m-1:m+1
                    if row >= 1 && row <= height && col >= 1 && col <= width && mineTable(row, col) ~= 9
                        mineTable(row, col) = mineTable(row, col) + 1;
                    end
                end
            end
        end
    end
end
end