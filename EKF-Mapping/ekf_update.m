function [mu, Sigma] = ekf_update(mu, Sigma, pose, z, Q, id)
    x_r = pose(1); y_r = pose(2); theta_r = pose(3);
    idx = 2*id - 1;
    x_l = mu(idx); y_l = mu(idx+1);

    dx = x_l - x_r;
    dy = y_l - y_r;
    q = dx^2 + dy^2;
    sqrt_q = sqrt(q);

    z_hat = [sqrt_q;
             atan2(dy, dx) - theta_r];

    H = (1/sqrt_q) * [dx, dy;
                      -dy/q, dx/q];

    Sigma_i = Sigma(idx:idx+1, idx:idx+1);
    K = Sigma_i * H' / (H * Sigma_i * H' + Q);
    innovation = z - z_hat;
    innovation(2) = wrapToPi(innovation(2));

    mu(idx:idx+1) = mu(idx:idx+1) + K * innovation;
    Sigma(idx:idx+1, idx:idx+1) = (eye(2) - K * H) * Sigma_i;
end