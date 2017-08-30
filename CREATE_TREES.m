function trees = CREATE_TREES(examples,attributes,binary_targets)
% trees = CREATE_TREES(examples,attributes,binary_targets)
%    Function that creates and trains the six trees.
%    INPUT : examples - matrix containing the train data.
%            attrubutes - vector containing the attributes of the data
%            binary_targets - targets vector of train data.
%             
%    OUTPUT : trees - The six trained trees in a cell structure.

trees = cell(1,6);

for i = 1:6
    binaryTarget = ChangeData(binary_targets,i);
    trees{i} = DECISION_TREE_LEARNING(examples,attributes,binaryTarget);
end

end