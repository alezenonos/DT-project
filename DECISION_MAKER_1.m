function out=DECISION_MAKER_1(predictions,train_binary_targets)
% out=DECISION_MAKER_1(predictions,train_binary_targets)
%    Function that makes decision about predictions of ambigious classification results.
%    If an example is classified as positive in more than one tree(or none), it
%    finally chooses the tree which has the higher probability according to
%    the targets of train data.
%    INPUT : predictions - the matrix of predictions for each tree as a 6xN
%                          matrix where N the number of examples.
%            train_binary_targets - vector containing the targets of train data 
%                                   in a 1,2,3,4,5,6 format.
%             
%    OUTPUT : out - vector containing the predictions in a 1,2,3,4,5,6 format after making the right decisions.

probabilities = PROBABIBLITIES_CALCULATOR(train_binary_targets);

out = zeros(1,length(predictions(1,:)));
for i=1:length(predictions(1,:))
        ones = find(predictions(:,i) == 1);
        if length(ones) == 1
            out(i) = ones;
        elseif isempty(ones)
            [~, out(i)] = max(probabilities);
        else
            [~, out(i)] = max(probabilities(ones));
        end
end

end

function probabilities = PROBABIBLITIES_CALCULATOR(train_binary_targets)
% probabilities = PROBABIBLITIES_CALCULATOR(train_binary_targets)
%    Function that computes and returns the probability of each tree.
%    INPUT : train_binary_targets - vector containing the trained data.
%            
%             
%    OUTPUT : probabilities - vector containing the probability of each of
%    six trees.
probabilities = zeros(1,6);

for i = 1:6
    prob = length(find(train_binary_targets == i));
    probabilities(i) = prob/length(train_binary_targets);
end

end