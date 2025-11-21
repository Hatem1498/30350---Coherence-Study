function groundPoints = findGround(P, CP)
    % Solve equations
    syms x y
    eqn = [P(1) + P(2)*x == y, sqrt(x^2 + y^2) == 1];
    sol = solve(eqn, [x, y]);

    % Extract solutions
    x1 = double(sol.x(1)); 
    y1 = double(sol.y(1));
    x2 = double(sol.x(2)); 
    y2 = double(sol.y(2));

    % Distances to CP(1)
    dsum1 = sqrt( (x1 - real(CP(1)))^2 + (y1 - imag(CP(1)))^2 );
    dsum2 = sqrt( (x2 - real(CP(1)))^2 + (y2 - imag(CP(1)))^2 );

    % Distances to CP(2)
    ddiff1 = sqrt( (x1 - real(CP(2)))^2 + (y1 - imag(CP(2)))^2 );
    ddiff2 = sqrt( (x2 - real(CP(2)))^2 + (y2 - imag(CP(2)))^2 );

    % Choose solution
    if ddiff1 > dsum1
        groundPoints = [x1, y1];
    else
        groundPoints = [x2, y2];
    end
end
