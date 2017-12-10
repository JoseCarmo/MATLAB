clc; clear;
NumberOfPoints = 1000;
PointLocation = zeros(NumberOfPoints, 2);
h = figure;
squareSide = 5;
axis ([-squareSide squareSide -squareSide squareSide]);
axis tight;
filename = 'test.gif';
hold on

for iterations = 1:1:NumberOfPoints
    
    PointLocation(iterations, :) = [ -squareSide + ((10).*rand(1)), -squareSide + ((10).*rand(1))];
    if ( (PointLocation(iterations, 1).^2 + PointLocation(iterations, 2).^2) < (squareSide).^2 )
        plot(PointLocation(iterations, 1), PointLocation(iterations, 2), '*', 'color', 'r');
    else
        plot(PointLocation(iterations, 1), PointLocation(iterations, 2), '*', 'color', 'b');
    end
    
    drawnow;
    hold on
    frame = getframe(h);
    image = frame2im(frame);
    [data,map] = rgb2ind(image,256);
    
    if iterations == 1 %f or the 1st iteration
        imwrite(data,map,filename,'gif', 'Loopcount',inf);
    else %f or other iterations
        imwrite(data,map,filename,'gif','WriteMode','append','DelayTime',1e-6);
    end
    
end
