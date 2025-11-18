function [gamma] = PhaseDiversityFunc(fileName)
    run(fileName);
    phi = pi/2 - angle(trace(O12));
    
    O12_hat = O12*exp(j*phi);
    
    A = (O12_hat + O12_hat');
    B = -j*(O12_hat - O12_hat');
    
    [W, D] = eig(A, B);
    
    
    gamma = complex(zeros(1, 3));
    
    for k=1:3
        w = W(:, k);
        num = w' * O12 * w;
        denom = sqrt((w' * T11 * w) * (w' * T22 * w));
        
        gamma(k) = num/denom;
    
    end

end