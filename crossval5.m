function meanError= crossval5(examples,binary_targets,numberOfFolds)
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

foldMeanErrorDT = zeros(numberOfFolds,6);

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
    for j=1:6
        binaryTarget = ChangeData(train_data(:,end),j);
        meanErrorTree(1,j) = estimateErrorTree(train_data(:,1:end-1),binaryTarget,1:length(train_data(1,1:end-1)),numberOfFolds);
        %         meanErrorTree(1,j)
    end
    %     meanErrorTree = 1;
    predictions2 = PREDICT_TESTS(trees,folds{i}(:,1:end-1),train_data(:,end),meanErrorTree,3);
    
    actual = folds{i}(:,end);
    all_final_predictions{i} = predictions2;
    all_final_results{i} = folds{i}(:,end);   
    
    for l=1:6
        k = find(predictions2 == l);
        y = find(actual == l)';
        [~,m] = min([length(k) length(y)]);
        
        pred = 0;
        
        if m == 1
            for q = k
                if find(y == q)
                    pred = pred + 1;
                end
            end
        elseif m == 2
            for q = y
                if find(k == q)
                    pred = pred + 1;
                end
            end
        end
        
        foldMeanErrorDT(i,l) = (1 - pred/length(find(actual == l)));
    end
    
end
[avg_recall, avg_precision, avg_measures, avg_matrix]=EVALUATION(all_final_predictions,all_final_results);
save('avg_measure.mat','avg_measures')
avg_measures
% meanError = sum(foldMeanError)/numberOfFolds;


meanError = foldMeanErrorDT;
end