function meanErrorTree = estimateErrorTree(examples,binary_targets,NumberOfAttributes,numberOfFolds)
% meanErrorTree = estimateErrorTree(examples,binary_targets,NumberOfAttributes,numberOfFolds)
%    Funtions that evaluates a tree using 10 fold cross validation
%    INPUT : examples - Matrix containing the train data.
%            binary_targets - The class of the train data
%            NumberOfAttributes - number of attributes in the data
%            numberOfFolds - The number of folds the data will be split                             
% 
%    OUTPUT : meanErrorTree - The mean error of the tree which is
%             calculated by using the 10 fold cross validation tecnique

data = [examples binary_targets];
[folds] = splitDataToFolds(data, numberOfFolds);
foldMeanError = zeros(1,1);

for i = 1:numberOfFolds 
    train_data = [];
    for p = 1:numberOfFolds 
        if ( p ~= i)
            train_data = [train_data; folds{p}];
        end
    end
    
    tree = DECISION_TREE_LEARNING(train_data(:,1:end-1),NumberOfAttributes,train_data(:,end));
    predictions = testTree(tree,folds{i}(:,1:end-1));
    
    correctPredictions = 0;
    for o = 1:length(predictions)
        if (predictions(o) == folds{i}(o,end)) 
            correctPredictions = correctPredictions + 1;
        end
    end
    
    foldMeanError = foldMeanError + (1 - correctPredictions/length(predictions));

end

meanErrorTree = foldMeanError/numberOfFolds;

end