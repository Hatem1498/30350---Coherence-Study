function [CoherencePoints] = PauliBasesPoints(fileName)
    run(fileName);
    T = (T11 + T22) /2;
    W = zeros(3, 5);
    W(:, 1) = [1, 0, 0];
    W(:, 2) = [0, 1, 0];
    W(:, 3) = [0, 0, 1];
    W(:, 4) = [1, 1, 0];
    W(:, 5) = [1, -1, 0];
    CoherencePoints = complex(zeros(1,5));
    for k = 1:5
        w1 = (W(:, k));
        w2 = w1;
        num = w1' * O12 * w2;
        %Calculate denomerator
        denom = sqrt((w1' * T11 * w1) * (w2' * T22 * w2));
        point = num/denom;
        CoherencePoints(k) = point;
    end
end