function out=DECISION_MAKER_4(predictions)
% out=DECISION_MAKER_4(predictions,train_binary_targets)
%    Function that makes decision about predictions of ambigious classification results.
%    If an example is classified as positive in more than one tree(or none), it
%    finally chooses the tree at random.
%    INPUT : predictions - the matrix of predictions for each tree as a 6xN
%                          matrix where N the number of examples.
%
%    OUTPUT : out - vector containing the predictions in a 1,2,3,4,5,6 format after making the right decisions.

out = zeros(1,length(predictions(1,:)));
for i=1:length(predictions(1,:))
    ones = find(predictions(:,i) == 1);
    if length(ones) == 1
        out(i) = ones;
    elseif isempty(ones)
        out(i) = randsample([1 2 3 4 5 6],1);
    else
        out(i) = randsample(ones,1);
    end
end

end