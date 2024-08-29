function Rf = repulsion(obs,current,gain,cutoff)
    Rf = zeros(1, 2);
    for i = 1:numel(obs)
        if numel(obs(i).Vertices) > 8 
            [cx,cy] = centroid(obs(i));
            c = [cx cy];
            distance = (current - c);
            if norm(distance) > cutoff
                repulsion_circle = 0;
            else
                repulsion_circle = gain / ((norm(distance))- norm(c-obs(i).Vertices(1,:)));
            end
            Rf = Rf + repulsion_circle*distance;
        else  
            min_distance = intmax;
            for v = 1:numel(obs(i).Vertices)/2
                distance = current - obs(i).Vertices(v,:);
                if min_distance > norm(distance)
                    minv = v;
                    min_distance = norm(distance);
                end
            end
            if min_distance > cutoff
                rep = 0;
            else
                rep = gain / min_distance^2;
            end
            Rf = Rf + rep*(current - obs(i).Vertices(minv,:));
        end
    end