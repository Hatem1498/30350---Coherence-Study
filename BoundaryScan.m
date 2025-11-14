function [boundary_vals] = BoundaryScan(fileName, N)
    
    run(fileName);
    T = (T11 + T22) /2;
    phi = linspace(0, pi, N);  % 0 to pi
    
    boundary_vals = zeros(length(phi), 2);  % preallocate
    
    for k = 1:length(phi)
        % Hermitian part of phase-rotated O12
        A = (O12*exp(1j*phi(k)) + (O12*exp(1j*phi(k)))')/2;
    
        % Generalized eigenproblem
        [V,D] = eig(A, T);
    
        % Max and min Re(γ)
        [~, id_max] = max(real(diag(D)));
        [~, id_min] = min(real(diag(D)));
    
        w_max = V(:, id_max);
        w_min = V(:, id_min);
    
        % Normalized gamma
        gamma_max = (w_max' * O12 * w_max) / sqrt( (w_max' * T11 * w_max) * (w_max' * T22 * w_max) );
        gamma_min = (w_min' * O12 * w_min) / sqrt( (w_min' * T11 * w_min) * (w_min' * T22 * w_min) );
    
        boundary_vals(k,1) = gamma_min;
        boundary_vals(k,2) = gamma_max;
    end

end