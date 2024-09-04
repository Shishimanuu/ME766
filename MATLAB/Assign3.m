% Define start and goal
start = [0, 0];
goal = [-1.5,1.5];
% Defining obstacles as polygons
obs1 = polyshape([1.2 0.5 0.7],[0.5 0 0.9]);
obs2 = polyshape([0.4 0 -0.3 -0.1],[-0.7 -1 -0.8 -1.5]);
obs3 = nsidedpoly(1000, 'Center', [-1 0.8], 'Radius', 0.3);

obs = [obs1;obs2;obs3];
        
% Define potential field parameters
gain = 2; % Repulsive force gain
cutoff = 0.5;

% Current position (initialize to start)
current = start;
path = [current];
step = 0;

% Loop until reaching the goal or stopping if the step count exceeds 10000
while norm(goal-current) > 0.01 && step < 10000
    % Calculate attractive force
    if norm(current - goal) > 1
        attractive_force = 2*norm(goal - current)*(goal-current);
    else
        attractive_force = 1/norm(goal - current)*(goal-current);
    end
    % Calculate repulsive force
    repulsive_force = repulsion(obs,current,gain,cutoff);
    
    % Get total force
    total_force = attractive_force + repulsive_force;
    
    % Update robot position (small step size for smooth movement)
    step_size = 0.01;
    new_pos = current + step_size * total_force;
    
    current = new_pos;
    path = [path; current];
    path(end,:);
    step = step+1;
end

% Plot workspace, obstacles, and robot path
    plot(obs(1),'FaceColor','red','FaceAlpha',1)
    hold on
    plot(obs(2),'FaceColor','green','FaceAlpha',1)
    hold on
    plot(obs(3),'FaceColor','blue','FaceAlpha',1)
    hold on
    axis([-2 2 -2 2]);
    grid on;
    plot(path(:,1), path(:,2), '.-', 'Color', 'blue', 'LineWidth', 2);  % Robot path
    xlabel('X');
    ylabel('Y');
    title('Potential Field Path Planning');
    hold off






