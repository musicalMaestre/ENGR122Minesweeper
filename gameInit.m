mineTable = zeros(handles.X,handles.Y); %creates a table where of zeros where the bombs and numbers will be placed
mineTable = placeBombs(handles.X, handles.Y, bombs, mineTable); %runs a function to place the bombs on the mineTable
clear mineOverlay;
mineTable = numSet(mineTable, handles.X, handles.Y); %adds the numbers that go around it

function mineTable = placeBombs(handles.X, handles.Y, bombs, mineTable) %creates the place of the bombs
count = 0; %initalize a count which will allow us to place bombs until there are enough bombs
while count < bombs %while there are less bombs then needed
    row = randi([1, handles.X]);
    col = randi([1, handles.Y]); %choose a random x and y
    if mineTable(row, col) ~= 9 %if there are no bombs on that spot
        mineTable(row,col) = 9; %(9 = bomb) place a bomb there
        count = count + 1; %and remember that there is one more bomb on the map
    end
end

function mineTable = numSet(mineTable, handles.X, handles.Y) %creates the numbers around the bombs
for n = 1:handles.X
    for m = 1:handles.Y
        if mineTable(n, m) == 9 %finds the bombs
            for row = n-1:n+1
                for col = m-1:m+1 %for each spot around it
                    if row >= 1 && row <= handles.X && col >= 1 && col <= handles.Y && mineTable(row, col) ~= 9 %if the spot exists and is not a bomb
                        mineTable(row, col) = mineTable(row, col) + 1; %add one to the value of that spot
                    end
                end
            end
        end
    end
end