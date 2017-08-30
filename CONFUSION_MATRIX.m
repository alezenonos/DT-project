function matrix=CONFUSION_MATRIX(predicted, actual)
% matrix=CONFUSION_MATRIX(predicted, actual)
%    Function that computes and returns the cofusion matrix.
%    INPUT : predicted - vector containing predicted classifications.
%            actual - vector containing the actual classifications.
%             
%    OUTPUT : matrix - the computed confusion matrix.

matrix = zeros(6,6); % initializing confusion matrix
N = length(predicted); % the length of the predicted(and the actual) data.
for i=1:N,
   matrix(actual(i),predicted(i)) = matrix(actual(i),predicted(i)) + 1; % adding value 1 in certain cell of the confusion matrix
end

end
