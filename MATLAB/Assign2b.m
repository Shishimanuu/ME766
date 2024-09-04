for i = 0:0.1:2*pi+0.1
    for j = 0:0.1:2*pi+0.1
        [x,y,z] = Linkcord([i;j;0]);
        
        % Dimensions of the links
        linkDim = [1 0 0 1;
           -0.025 -0.025 0.025 0.025];

        % Pose of the links
        r1 = [cos(i) -sin(i);
              sin(i) cos(i)];
        r2 = [cos(i+j) -sin(i+j);
              sin(i+j) cos(i+j)];
        
        % Defining links as polygons
        polyl1 = r1*linkDim;
        polyl2 = r2*linkDim + [x(2);y(2)];

        l1 = polyshape(polyl1(1,:),polyl1(2,:));
        l2 = polyshape(polyl2(1,:),polyl2(2,:));
        l = [l1;l2];

        % Defining obstacles as polygons
        obs1 = polyshape([1.2 0.5 0.7],[0.5 0.7 0.9]);
        obs2 = polyshape([0.4 0 -0.3 -0.1],[-0.7 -1 -0.8 -1.5]);
        obs3 = nsidedpoly(1000, 'Center', [-1.5 0.8], 'Radius', 0.3);

        obs = [obs1;obs2;obs3];
        
        %% Plots    
        % Can only plot only on of the below, comment the other one while
        % running the program

        % Animation of the workspace
        plotWS(x,y,l,obs);
        pause(0.001)
        
        % Plotting the Configuration space
        % color = checkInt(obs,l);    % Function to check intersection of links with obstacles
        % scatter(i,j,color,"filled")
        % hold on
        % axis([0 2*pi 0 2*pi]);
    end
end