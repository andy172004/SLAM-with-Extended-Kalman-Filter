function [z_pred, H] = bearing_model(x, landmark)
    dx = landmark(1) - x(1);
    dy = landmark(2) - x(2);
    q = dx^2 + dy^2;

    range = sqrt(q);
    bearing = wrapToPi(atan2(dy, dx) - x(3));

    % Predicted measurement: [range; bearing]
    z_pred = [range; bearing];

    % Jacobian H (2x3) for [range; bearing]
    sqrt_q = sqrt(q);
    H = [ -dx/sqrt_q, -dy/sqrt_q, 0;
           dy/q,      -dx/q,     -1 ];
end
