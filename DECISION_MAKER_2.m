function out=DECISION_MAKER_2(predictions,level)
% out=DECISION_MAKER_2(predictions,level)
%    Function that makes decision about predictions of ambigious classification results.
%    If an example is classified as positive in more than one tree(or none), it
%    finally chooses the tree in which the attribute has the higher
%    information gain according to the level in each tree the attribute was
%    found.
%    INPUT : predictions - the matrix of predictions for each tree as a 6xN
%                          matrix where N the number of examples.
%            level - matrix containing levels of the trees where actually an example was classified.
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
        [~, out(i)] = max(level(:,i));
    else
        [~, out(i)] = min(level(ones,i));
    end
end

end