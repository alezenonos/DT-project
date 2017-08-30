function returnedAttribute = CHOOSE_BEST_DECISION_ATTRIBUTE(examples,attributes,binary_targets)
% returnedAttribute = CHOOSE_BEST_DECISION_ATTRIBUTE(examples,attributes,binary_targets)
%    Function that returns the attribute that results in the highest information gain.
%    INPUT : examples - matrix containing the train data.
%            attrubutes - vector containing the attribute values in the examples.
%            binary_targets - targets vector of the training data.
%             
%    OUTPUT : returnedAttribute - the attribute that results in the highest information gain.

Gain = zeros(1,length(attributes));

for i = 1:length(attributes)
    Gain(i) = GAIN(examples(:,attributes(i)),binary_targets);
end
% Gain
[gain returnedIndex] = max(Gain);

% if two attributes have the same IG
returnedAttribute = attributes(:,returnedIndex);

end