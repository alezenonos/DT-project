function computedValue = I(p,n)
% computedValue = I(p,n)
%    Function that computes the value of Entropy I needed for the 
%    Information Gain calculations.
%    INPUT : p - positive values.
%            n - negative values.
%    OUTPUT : computedValue - result needed for the information gain calculations.
computedValue = - (p/(p+n+eps))*log2((p+eps)/(p+n+eps)) - (n/(p+n+eps))*log2((n+eps)/(p+n+eps));

end