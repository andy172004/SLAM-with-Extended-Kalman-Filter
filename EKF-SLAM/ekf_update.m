function [x, P] = ekf_update(x, P, z, Q, id)
    idx = 3 + 2*id - 1;
    lx = x(idx);
    ly = x(idx+1);

    dx = lx - x(1);
    dy = ly - x(2);
    q = dx^2 + dy^2;
    r = sqrt(q);
    b = atan2(dy, dx) - x(3);
    z_hat = [r; wrapToPi(b)];

    % Jacobians
    H = zeros(2, length(x));
    H(:, 1:3) = [-dx/r, -dy/r, 0;
                  dy/q, -dx/q, -1];
    H(:, idx:idx+1) = [ dx/r, dy/r;
                       -dy/q, dx/q];

    % EKF update
    S = H * P * H' + Q;
    K = P * H' / S;
    innovation = z - z_hat;
    innovation(2) = wrapToPi(innovation(2));
    x = x + K * innovation;
    P = (eye(length(x)) - K * H) * P;
end
