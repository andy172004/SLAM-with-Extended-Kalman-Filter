function [mu, Sigma] = initialize_landmark(mu, Sigma, pose, z, R, id)
    x_r = pose(1); y_r = pose(2); theta_r = pose(3);
    r = z(1); b = z(2);
    x_l = x_r + r * cos(theta_r + b);
    y_l = y_r + r * sin(theta_r + b);

    mu = [mu; x_l; y_l];
    Sigma = blkdiag(Sigma, R);
end