function numSet(X, Y) %creates the numbers around the bombs
global mineTable
for n = 1:X
    for m = 1:Y
        if mineTable(n, m) == 9 %finds the bombs
            for row = n-1:n+1
                for col = m-1:m+1 %for each spot around it
                    if row >= 1 && row <= X && col >= 1 && col <= Y && mineTable(row, col) ~= 9 %if the spot exists and is not a bomb
                        mineTable(row, col) = mineTable(row, col) + 1; %add one to the value of that spot
                    end
                end
            end
        end
    end
end
end