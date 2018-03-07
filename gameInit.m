%foo
mineTable = zeros(X,Y); %creates a table where of zeros where the bombs and numbers will be placed
[height, width] = size(mineTable); %grab sizes for the table for later use (may be unnessary in retrospect)

mineTable = placeBombs(height, width, bombs, mineTable); %runs a function to place the bombs on the mineTable
clear mineOverlay;
mineTable = numSet(mineTable, height, width); %adds the numbers that go around it

function mineTable = placeBombs(height, width, bombs, mineTable) %creates the place of the bombs
count = 0; %initalize a count which will allow us to place bombs until there are enough bombs
while count < bombs %while there are less bombs then needed
    row = randi([1, height]);
    col = randi([1, width]); %choose a random x and y
    if mineTable(row, col) ~= 9 %if there are no bombs on that spot
        mineTable(row,col) = 9; %(9 = bomb) place a bomb there
        count = count + 1; %and remember that there is one more bomb on the map
    end
end
end

function mineTable = numSet(mineTable, height, width) %creates the numbers around the bombs
for n = 1:height
    for m = 1:width
        if mineTable(n, m) == 9 %finds the bombs
            for row = n-1:n+1
                for col = m-1:m+1 %for each spot around it
                    if row >= 1 && row <= height && col >= 1 && col <= width && mineTable(row, col) ~= 9 %if the spot exists and is not a bomb
                        mineTable(row, col) = mineTable(row, col) + 1; %add one to the value of that spot
                    end
                end
            end
        end
    end
end
end