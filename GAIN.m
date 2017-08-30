function gain = GAIN(attribute,binary_targets)
% gain = GAIN(attribute,binary_targets)
%    Function that computes the Information Gain of a certain attribute.
%    INPUT : attribute - the current attribute.
%            binary_targets - targets vector with values 0,1.           
%    OUTPUT : gain - the infrmation gain of the attribute. 
p = length(find(binary_targets == 1));
n = length(binary_targets) - p;

gain = I(p,n) - REMAINDER(attribute,binary_targets);

end