function [meanError1 meanError2 meanError3 meanError4 avg_rec avg_prec avg_meas avg_matrix]= CROSS_VALIDATION(examples,binary_targets,numberOfFolds)
% [meanError1 meanError2 meanError3 meanError4 avg_rec avg_prec avg_meas avg_matrix]= CROSS_VALIDATION(examples,binary_targets,numberOfFolds)
%    Function that evaluates the six trees that were created by using the
%    cross validation technique
%    INPUT : examples - The input data
%            binary_targets - The class of the data 
%            numberOfFolds - The number of folds to split the data
%    OUTPUT : omeanError1 - The error of the algorithm with technique 1
%             meanError2 - The error of the algorithm with technique 2
%             meanError3 - The error of the algorithm with technique 3
%             meanError4 - The error of the algorithm with technique 4
%             avg_rec - The average recall
%             avg_prec - The average precision
%             avg_meas - The average f measure
%             avg_matrix - The average confusion matrix

data = [examples binary_targets];
[folds] = splitDataToFolds(data, numberOfFolds);
meanError = zeros(1,4);
meanErrorTree = zeros(1,6);
avg_matrix = cell(1,3);

for decisionMethodChoice = 1 : 4
    foldMeanError = zeros(1,numberOfFolds);
    all_final_predictions = cell(1,numberOfFolds);
    all_final_results = cell(1,numberOfFolds);
    decisionMethodChoice
    % Cross validation
    for i = 1:numberOfFolds 
        train_data = [];
        
        % Leave i fold out for testing
        for p = 1:numberOfFolds 
            if ( p ~= i)
                train_data = [train_data; folds{p}];
            end
        end
        
        trees = CREATE_TREES(train_data(:,1:end-1),1:length(train_data(1,1:end-1)),train_data(:,end));
        
        % Compute the error of each tree
        if decisionMethodChoice == 3
            for j=1:6
                binaryTarget = ChangeData(train_data(:,end),j);
                meanErrorTree(1,j) = estimateErrorTree(train_data(:,1:end-1),binaryTarget,1:length(train_data(1,1:end-1)),numberOfFolds);
%                 meanErrorTree(1,j)
            end
        end
%         meanErrorTree
        predictions = PREDICT_TESTS(trees,folds{i}(:,1:end-1),train_data(:,end),meanErrorTree,decisionMethodChoice);
        
        %  Cells to be used to compute the average recall,precision,f-measure and
        %  confusion matrix
        all_final_predictions{i} = predictions';
        all_final_results{i} = folds{i}(:,end);
        
        %  compute the correct predictions of the algorithm
        correctPredictions = 0;
        for o = 1:length(predictions)
            if (predictions(o) == folds{i}(o,end)) 
                correctPredictions = correctPredictions + 1;
            end
        end
        
        foldMeanError(i) = foldMeanError(i) + (1 - correctPredictions/length(predictions));
        
    end
    [avg_recall avg_precision avg_measures avg_matrix{decisionMethodChoice}]=EVALUATION(all_final_predictions,all_final_results);
    meanError(decisionMethodChoice) = sum(foldMeanError)/numberOfFolds;
    avg_rec(decisionMethodChoice,:) = avg_recall;
    avg_prec(decisionMethodChoice,:)= avg_precision;
    avg_meas(decisionMethodChoice,:) = avg_measures;
end

meanError1 = meanError(1);
meanError2 = meanError(2);
meanError3 = meanError(3);
meanError4 = meanError(4);

end