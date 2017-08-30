function final_predictions = testNestedCV(Trees,tests,meanErrorTree)

predictions = zeros(6,length(tests(:,1)));

for i=1:6
    for j=1:length(tests(:,1))
        predictions(i,j) = TRAVERSE(Trees{i},tests(j,:),0);
    end
end

final_predictions = DECISION_MAKER_3(predictions,meanErrorTree);

end