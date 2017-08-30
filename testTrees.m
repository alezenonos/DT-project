function [avg_recall avg_precision avg_measures ConfusionMatrix Error] = testTrees(Trees,Tests)
% final_predictions = testTrees(Trees,tests,examples, binary_targets_of_train_set, choice)
%    Function that takes the six trained trees and predicts Tests data
%    INPUT : Trees - cell containing the six trees.
%            Tests - The data to test the trees
%    OUTPUT : Confusion Matrix - The confusion matrix of predicted targets
%             Error - The error of the trees on the data Tests

meanErrorTree = [0.0886    0.0995    0.0617    0.0698    0.1185    0.0767];
% meanErrorTree = [];
predictions = PREDICT_TESTS(Trees,Tests(:,1:end-1),Tests(:,end),meanErrorTree,3);

%  Cells to be used to compute the average recall,precision,f-measure and
%  confusion matrix
all_final_predictions{1} = predictions';
all_final_results{1} = Tests(:,end);

%  compute the correct predictions of the algorithm
correctPredictions = 0;
for o = 1:length(predictions)
    if (predictions(o) == Tests(o,end))
        correctPredictions = correctPredictions + 1;
    end
end

[avg_recall avg_precision avg_measures ConfusionMatrix] = EVALUATION(all_final_predictions,all_final_results);

Error = (1 - correctPredictions/length(predictions));

end