function [CoherencePoints] = MagnitudeDiversityFunc(fileName)

run(fileName);

A = inv(T22)*O12'*inv(T11)*O12;
B = inv(T11)*O12*inv(T22)*O12';
[W1, D] = eig(A);
[W2, D2] = eig(B);

CoherencePoints = complex(zeros(1, 3));
for k = 1:3
    w1 = W1(:, k);
    w2 = (W2(:, k));
    phi = angle(w1'*w2);
    %w1 = w1*exp(-j*phi/2);
    %w2 = w2*exp(-j*phi/2);
    num = w1' * O12 * w2;
    %Calculate denomerator
    denom = sqrt((w1' * T11 * w1) * (w2' * T22 * w2));
    point = num/denom;
    CoherencePoints(k) = point;
end

end