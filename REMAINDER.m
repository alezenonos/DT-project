function remainder = REMAINDER(attribute,binary_targets)
% remainder = REMAINDER(attribute,binary_targets)
%    Function that computes the remainder value for the Information Gain
%    calculations of a certain attribute.
%    INPUT : attribute - the current attribute.
%            binary_targets - targets vector with values 0,1.
%             
%    OUTPUT : remainder - the remainder value for the Information Gain calculation. 

p0 = length(find(binary_targets == 1 & attribute == 0));
p1 = length(find(binary_targets == 1 & attribute == 1));
n0 = length(find(binary_targets == 0 & attribute == 0));
n1 = length(find(binary_targets == 0 & attribute == 1));
targetLength = length(binary_targets);

remainder = (p0+n0)/targetLength *I(p0,n0) + (p1+n1)/targetLength *I(p1,n1);

end