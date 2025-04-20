function plot_map(x, P, x_true, step)
    clf;
    plot(x_true(1), x_true(2), 'go', 'MarkerSize', 8, 'LineWidth', 2); hold on;
    plot(x(1), x(2), 'rx', 'MarkerSize', 8, 'LineWidth', 2);

    if length(x) > 3
        landmarks = reshape(x(4:end), 2, [])';
        plot(landmarks(:,1), landmarks(:,2), 'bo', 'MarkerSize', 8, 'LineWidth', 2);
    end

    title(sprintf('EKF SLAM Step %d', step));
    axis equal; grid on;
    drawnow;
end
