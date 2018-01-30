function [winRate, bestTime, numberOfWins] = minesweeper(rows, columns, mines)    
%Initialize GUI with user defined grid size, maybe max out at 50x50, MAKE
%SURE THAT MINES IS LESS THAN ROWS * COLUMNS

%Then, randomize the bomb placement and initialize the grid inside the GUI

%Each square inside the grid has to have multiple properties that need to
%be tracked the entire time (EX: whether or not its revealed; whether or
%not it contains a bomb, number, or nothing; whether or not its been marked
%as a bomb, and the coordinates of the square)