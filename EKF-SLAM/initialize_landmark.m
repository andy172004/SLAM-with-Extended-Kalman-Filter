function [x, P] = initialize_landmark(x, P, z, Q, id)
    r = z(1); b = z(2);
    theta = x(3);
    lx = x(1) + r * cos(theta + b);
    ly = x(2) + r * sin(theta + b);

    x = [x; lx; ly];

    n = length(x);
    P = blkdiag(P, 1e3*eye(2));  % Large uncertainty
end
