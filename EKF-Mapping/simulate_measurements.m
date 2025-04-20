function [z, ids] = simulate_measurements(pose, landmarks, Q)
    x_r = pose(1); y_r = pose(2); theta_r = pose(3);
    ids = 1:size(landmarks, 1);
    z = zeros(2, length(ids));

    for i = 1:length(ids)
        dx = landmarks(i,1) - x_r;
        dy = landmarks(i,2) - y_r;
        r = sqrt(dx^2 + dy^2) + randn * sqrt(Q(1,1));
        b = atan2(dy, dx) - theta_r;
        b = wrapToPi(b) + randn * sqrt(Q(2,2));
        z(:,i) = [r;b];
    end
end