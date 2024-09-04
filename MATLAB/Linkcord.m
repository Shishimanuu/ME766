% Function to find the link coordinates

function [x,y,z] = Linkcord(theta)

% Defining the DH table:
dh = [0 0 0 theta(1);
      1 0 0 theta(2);
      1 0 0 theta(3)];

% Calculating the cosines and sines of the relavant angles:
c = cos(dh(:,4));
s = sin(dh(:,4));

ca = cos(dh(:,2));
sa = sin(dh(:,2));


% Computing the transformation matrices:
for n = 1:3
    t(:,:,n) = [c(n) -s(n) 0 dh(n,1);
                s(n)*ca(n) c(n)*ca(n) -sa(n) -dh(n,3)*sa(n);
                s(n)*sa(n) c(n)*sa(n) ca(n) dh(n,3)*ca(n);
                0 0 0 1]; 
end

% Computing the final transformation matrix:
tf(:,:,1) = t(:,:,1);
n = 2;

while n<4
    tf(:,:,n) = tf(:,:,n-1)*t(:,:,n);
    n = n+1;
end

% Coordinates of the Links:
x = tf(1,4,:);
y = tf(2,4,:);
z = tf(3,4,:);
end