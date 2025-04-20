function [x_next, F] = motion_model(x, u, dt)
    theta = x(3);
    v = u(1);
    omega = u(2);

    % Avoid division by zero if omega is very small (straight line motion)
    if abs(omega) < 1e-6
        dx = v * dt * cos(theta);
        dy = v * dt * sin(theta);
        dtheta = 0;
    else
        dx = (v / omega) * (sin(theta + omega * dt) - sin(theta));
        dy = (v / omega) * (-cos(theta + omega * dt) + cos(theta));
        dtheta = omega * dt;
    end

    x_next = x + [dx; dy; dtheta];

    % Normalize angle to [-pi, pi]
    x_next(3) = wrapToPi(x_next(3));

    % Jacobian F (approximate linearization)
    F = eye(3);
    if abs(omega) < 1e-6
        F(1,3) = -v * dt * sin(theta);
        F(2,3) = v * dt * cos(theta);
    else
        F(1,3) = (v / omega) * (cos(theta + omega*dt) - cos(theta));
        F(2,3) = (v / omega) * (sin(theta + omega*dt) - sin(theta));
    end
end

