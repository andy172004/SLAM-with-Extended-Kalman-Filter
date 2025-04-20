function [z_pred, H] = measurement_model(x, landmark)
    dx = landmark(1) - x(1);
    dy = landmark(2) - x(2);
    range = sqrt(dx^2 + dy^2);
    
    z_pred = range;

    % Jacobian w.r.t state
    H = [-dx / range, -dy / range, 0];
end
