function gameMap = openSpots(mineTable, gameMap, height, width) %this function checks all spots and opens the spots around blank slots
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