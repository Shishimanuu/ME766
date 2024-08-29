% Function to plot the links

function [] = plotLinks(x,y)

plot([x(1) x(2)],[y(1) y(2)],'Color','red',LineWidth=5);
hold on
plot([x(2) x(3)],[y(2) y(3)],'Color','green',LineWidth=5);
hold off
axis([-2 2 -2 2]);
grid on;
xlabel('X')
ylabel('Y')