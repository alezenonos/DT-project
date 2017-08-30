function final_predictions = testTree(Tree,tests)

final_predictions = zeros(1,length(tests(:,1)));

for j=1:length(tests(:,1))
    final_predictions(j) = TRAVERSE(Tree,tests(j,:),0);
end

end