function mineTable = placeBombs(X, Y, bombs, mineTable) %creates the place of the bombs
count = 0; %initalize a count which will allow us to place bombs until there are enough bombs
while count < bombs %while there are less bombs then needed
    row = randi([1, X]);
    col = randi([1, Y]); %choose a random x and y
    if mineTable(row, col) ~= 9 %if there are no bombs on that spot
        mineTable(row,col) = 9; %(9 = bomb) place a bomb there
        count = count + 1; %and remember that there is one more bomb on the map
    end
end
end