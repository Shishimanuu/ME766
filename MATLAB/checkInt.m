% Function to check the intersection between links and obstacles

function color = checkInt(obs,l)
    colorAr = ["white";"red";"green";"blue"];
    color = colorAr(1);
    for i = 1:3
        intL1 = intersect(obs(i),l(1));
        intL2 = intersect(obs(i),l(2));

        if intL1.NumRegions ~= 0 || intL2.NumRegions~=0
            color = colorAr(i+1);
        end
    end