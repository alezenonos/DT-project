function [meanError avg_recall avg_precision avg_measures]= newCV(examples,binary_targets,numberOfFolds)
% INPUT - The functions takes as inpuut the examples with the binary_target
% for these examples and the number of folds that will take place.
% OUTPUT - Returns the mean error of the model

data = [examples binary_targets];
% folds = cvpartition(data,'kfold',numberOfFolds);
[folds] = splitDataToFolds(data, numberOfFolds);

foldMeanError = zeros(1,numberOfFolds);
all_final_predictions = cell(1,numberOfFolds);
all_final_results = cell(1,numberOfFolds);
meanErrorTree = zeros(1,6);

for i = 1:numberOfFolds % AFINO TO i FOLD APEKSO GIA TEST
    train_data = [];
    for p = 1:numberOfFolds % OLA TA FOLD EKTOS TO i THA APOTELOUN TO TRAINING SET
        if ( p ~= i)
            train_data = [train_data; folds{p}];
        end
    end
    
    trees = CREATE_TREES(train_data(:,1:end-1),1:length(train_data(1,1:end-1)),train_data(:,end));
    
    for j=1:6
        binaryTarget = ChangeData(train_data(:,end),i);
        meanErrorTree(j) = estimateErrorTree(train_data(:,1:end-1),binaryTarget,1:length(train_data(1,1:end-1)),numberOfFolds);
    end
    
    predictions = testNestedCV(trees,folds{i}(:,1:end-1),meanErrorTree);    
    
    all_final_predictions{i} = predictions';
    all_final_results{i} = folds{i}(:,end);
    
    correctPredictions = 0;
    for o = 1:length(predictions)
        if (predictions(o) == folds{i}(o,end)) % POSA SOSTA KANEI O ALGORITHMOS
            correctPredictions = correctPredictions + 1;
        end
    end
    
    foldMeanError(i) = foldMeanError(i) + (1 - correctPredictions/length(predictions));
    
end
[avg_recall avg_precision avg_measures] = EVALUATION(all_final_predictions,all_final_results);
meanError = sum(foldMeanError)/numberOfFolds;
end