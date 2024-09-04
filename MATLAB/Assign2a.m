% Input for the DH table:
theta1 = input("Input theta1: ");
theta2 = input("Input theta2: ");
theta3 = input("Input theta3: ");

theta = [theta1; theta2; theta3];

[x,y,z] = Linkcord(theta);  % Function to find the link coodinates for 
                              % the corresponding thetas

plotLinks(x,y); % Function to plot the robot links