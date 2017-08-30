function majorityValue = MAJORITY_VALUE(binary_targets)
% majorityValue = MAJORITY_VALUE(binary_targets)
%    Function that returns the mode of the targets.
%    INPUT : binary_targets - vector containing the targets of the train data.
%             
%    OUTPUT : majorityValue - the mean of the binary_targets.

majorityValue = mode(binary_targets);

end