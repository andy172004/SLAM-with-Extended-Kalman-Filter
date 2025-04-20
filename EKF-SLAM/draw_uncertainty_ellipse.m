function draw_uncertainty_ellipse(mu, Sigma)
    [V, D] = eig(Sigma);
    t = linspace(0, 2*pi, 100);
    a = (sqrt(D(1,1)) * cos(t));
    b = (sqrt(D(2,2)) * sin(t));
    ellipse = V * [a; b];
    plot(mu(1) + ellipse(1,:), mu(2) + ellipse(2,:), 'r--');
end