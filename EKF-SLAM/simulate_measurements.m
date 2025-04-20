function [z, ids] = simulate_measurements(x, landmarks, Q)
    x_r = x(1); y_r = x(2); theta = x(3);
    max_range = 15; % sensor range

    z = [];
    ids = [];
    for i = 1:size(landmarks,1)
        dx = landmarks(i,1) - x_r;
        dy = landmarks(i,2) - y_r;
        r = sqrt(dx^2 + dy^2);
        b = wrapToPi(atan2(dy, dx) - theta);

        if r <= max_range
            noise = sqrtm(Q) * randn(2,1);
            z = [z, [r; b] + noise];
            ids = [ids, i];
        end
    end
end
