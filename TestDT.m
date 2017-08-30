function trees = TestDT(examples,attributes,binary_targets)

trees = cell(1,6);

for i = 1:6
    binaryTarget = ChangeData(binary_targets,i);
    trees{i} = DECISION_TREE_LEARNING(examples,attributes,binaryTarget);
end

end