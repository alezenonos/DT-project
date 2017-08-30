%     for j=1:6
%         binaryTarget = ChangeData(train_data(:,end),j);
%         meanErrorTree(1,j) = estimateErrorTree(train_data(:,1:end-1),binaryTarget,1:length(train_data(1,1:end-1)),numberOfFolds);
%         %                 meanErrorTree(1,j)
%     end
%     predictions
%     for l=1:6
%         predictions = ChangeData(predictions2,l);
%         actual=ChangeData(folds{i}(:,end),l)';

%  compute the correct predictions of the algorithm
%     correctPredictions = 0;
%     for o = 1:size(predictions,2)
%         if (predictions(1,o) == actual(1,o))
%             correctPredictions = correctPredictions + 1;
%         else
%             disp('misclassified');
%         end
%     end
%     correctPredictions

%         k = find(predictions2 == l);
%         y = find(actual == l);

% oo/length(actual)
%
%         [~,m] = min([length(k) length(y)]);
%
%         pred = 0;
%
%         if m == 1
%             for q = k
%                 if find(y == q)
%                     pred = pred + 1;
%                 end
%             end
%         elseif m == 2
%             for q = y
%                 if find(k == q)
%                     pred = pred + 1;
%                 end
%             end
%         end
%         pred