function [x_est, P] = ekf_localization(x_est, P, u, z, landmark, Q, R, dt)
    [x_pred, F] = motion_model(x_est, u, dt);
    P_pred = F * P * F' + Q;

    [z_pred, H] = measurement_model(x_pred, landmark);
    K = P_pred * H' / (H * P_pred * H' + R);
    
    x_est = x_pred + K * (z - z_pred);
    P = (eye(3) - K * H) * P_pred;
end
