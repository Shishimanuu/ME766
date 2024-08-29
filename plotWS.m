% Function to plot the Workspace

function [] = plotWS(x,y,l,obs)

plot([x(1) x(2)],[y(1) y(2)],'Color','red',LineWidth=1);
hold on
plot([x(2) x(3)],[y(2) y(3)],'Color','green',LineWidth=1);
hold on
plot(l(1))
hold on
plot(l(2))
hold on
plot(obs(1),'FaceColor','red','FaceAlpha',1)
hold on
plot(obs(2),'FaceColor','green','FaceAlpha',1)
hold on
plot(obs(3),'FaceColor','blue','FaceAlpha',1)
hold off
axis([-2 2 -2 2]);
grid on;

