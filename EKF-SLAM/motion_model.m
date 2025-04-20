function [x_next, F] = motion_model(x, u, dt)
    theta = x(3);
    v = u(1);
    w = u(2);

    if abs(w) > 1e-5
        x_next = x + [ -(v/w)*sin(theta) + (v/w)*sin(theta + w*dt);
                        (v/w)*cos(theta) - (v/w)*cos(theta + w*dt);
                        w*dt ];
    else
        x_next = x + [ v*dt*cos(theta);
                       v*dt*sin(theta);
                       w*dt ];
    end

    % Jacobian w.r.t. state
    F = eye(3);
    F(1,3) = -v/w*cos(theta) + v/w*cos(theta + w*dt);
    F(2,3) = -v/w*sin(theta) + v/w*sin(theta + w*dt);
end


