function plot_map(mu, Sigma, pose, t)
    plot(pose(1), pose(2), 'bo', 'MarkerSize', 8, 'DisplayName', 'Robot');
    for i = 1:length(mu)/2
        x = mu(2*i-1);
        y = mu(2*i);
        plot(x, y, 'rx', 'MarkerSize', 10, 'LineWidth', 2);
        draw_uncertainty_ellipse([x; y], Sigma(2*i-1:2*i, 2*i-1:2*i));
    end
    title(['Step ', num2str(t)]);
end