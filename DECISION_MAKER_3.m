function out=DECISION_MAKER_3(predictions,meanErrorTree)
% out=DECISION_MAKER_3(predictions,train_binary_targets)
%    Function that makes decision about predictions of ambigious classification results.
%    If an example is classified as positive in more than one tree(or none), it
%    finally chooses the tree that has the lowest (individual) error.
%    INPUT : predictions - the matrix of predictions for each tree as a 6xN
%                          matrix where N the number of examples.
%            meanErrorTree - vector containing the error of each tree
%             
%    OUTPUT : out - vector containing the predictions in a 1,2,3,4,5,6 format after making the right decisions.

out = zeros(1,length(predictions(1,:)));

for j=1:length(predictions(1,:))
    out(j) = -1;
end

for i=1:length(predictions(1,:))
    ones = find(predictions(:,i) == 1);
    if length(ones) == 1
        out(i) = ones;
    elseif isempty(ones)
        [~, out(i)] = min(meanErrorTree);
    else
        [~, out2] = min(meanErrorTree(ones)) ;
        out(i) = ones(out2);
    end
end

end