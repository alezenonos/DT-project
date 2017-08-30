function final_predictions = PREDICT_TESTS(Trees,tests, binary_targets_of_train_set, meanErrorTree, choice)
% final_predictions = testTrees(Trees,tests,examples, binary_targets_of_train_set, choice)
%    Function that takes the six trained trees and produces the final
%    classification predictions.
%    INPUT : Trees - cell containing the six trees.
%            tests - matrix containing the test data.
%            binary_targets_of_train_set - the results of train test
%            choice - decision method choice (in order to decide the ambigious data).
%    OUTPUT : final_predictions - vector containing the final predictions
%             of all examples in the test set.

predictions = zeros(6,length(tests(:,1)));
level = zeros(6,length(tests(:,1)));

for i=1:6
    for j=1:length(tests(:,1))
        level(i,j)=-1;
    end
end

% Find the prediction of an example along with the level of the tree the
% example was found
for i=1:6
    for j=1:length(tests(:,1))
        [predictions(i,j) level(i,j)]= TRAVERSE(Trees{i},tests(j,:),0);
    end
    
end

% Depending on the choice a different technique is used when ambiguity is
% encountered 
if choice == 1
    final_predictions = DECISION_MAKER_1(predictions,binary_targets_of_train_set);   
elseif choice == 2
    final_predictions = DECISION_MAKER_2(predictions,level);
elseif choice == 3
    final_predictions = DECISION_MAKER_3(predictions,meanErrorTree);
elseif choice == 4
    final_predictions = DECISION_MAKER_4(predictions);    
end

end