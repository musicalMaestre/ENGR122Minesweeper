clear;clc;
global allTimes; allTimes = [];
global gamesWon; gamesWon = 0;
global gamesLost; gamesLost = 0;
global winStreak; winStreak = 0;
save('statistics.mat', 'gamesWon', 'gamesLost', 'allTimes', 'winStreak');