function [sig1, sig2] = reshape_signals(input)
    sig1 = reshape(input(1).values(1,1,:), [size(input(1).values,3),1]);
    sig2 = reshape(input(2).values(1,1,:), [size(input(2).values,3),1]);
end