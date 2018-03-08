function updateGUI()
global gameMap
zero = imread('0.jpg');     one = imread('1.jpg');
two = imread('2.jpg');      three = imread('3.jpg');
four = imread('4.jpg');     five = imread('5.jpg');
six = imread('6.jpg');      seven = imread('7.jpg');
eight = imread('8.jpg');    bomb = imread('bomb.jpg');
uncovered = imread('facingDown.jpg');
flagged = imread('flagged.jpg');

for i = 1:numel(gameMap)
    [x, y] = ind2sub(size(gameMap), i);
    xCorner = x - 1; yCorner = y - 1;
    switch gameMap(i)
        case 0
            image([xCorner x], [yCorner y], zero);
            colormap(gray(256));
            set(gca,'YDir','reverse');
        case 1
            image([xCorner x], [yCorner y], one);
            set(gca,'YDir','reverse');
        case 2
            image([xCorner x], [yCorner y], two);
            set(gca,'YDir','reverse');
        case 3
            image([xCorner x], [yCorner y], three);
            set(gca,'YDir','reverse');
        case 4
            image([xCorner x], [yCorner y], four);
            set(gca,'YDir','reverse');
        case 5
            image([xCorner x], [yCorner y], five);
            set(gca,'YDir','reverse');
        case 6
            image([xCorner x], [yCorner y], six);
            set(gca,'YDir','reverse');
        case 7
            image([xCorner x], [yCorner y], seven);
            set(gca,'YDir','reverse');
        case 8
            image([xCorner x], [yCorner y], eight);
            set(gca,'YDir','reverse');
        case 9
            image([xCorner x], [yCorner y], bomb);
            set(gca,'YDir','reverse');
        case 10
            image([xCorner x], [yCorner y], uncovered);
            set(gca,'YDir','reverse');
        case 11
            image([xCorner x], [yCorner y], flagged);
            set(gca,'YDir','reverse');
    end
end
end