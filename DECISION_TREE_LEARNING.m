function [tree]=DECISION_TREE_LEARNING(examples,attributes,binary_targets) %1000 examples, 45 atttributes (AU), 1000x1
% [tree]=DECISION_TREE_LEARNING(examples,attributes,binary_targets)
%    Functions that creates a tree
%    INPUT : examples - the data to be used to built the tree
%            attributes - A vector with the attributes of the data
%            binary_targets - The class of the data
% 
%    OUTPUT : tree - The tree that was built

z = unique(binary_targets);

if(unique(examples) == 0) 
    tree.op = '';
    % end
    tree.kids = [];
    tree.class=MAJORITY_VALUE(binary_targets);
    fprintf('dsds');
elseif(length(z) == 1)
    tree.op = '';
    tree.kids = [];
    tree.class = z;
elseif (isempty(attributes))
%     MAJORITY_VALUE(binary_targets);
    tree.op = '';
    tree.kids = [];
    tree.class=MAJORITY_VALUE(binary_targets);
else
    best_attribute=CHOOSE_BEST_DECISION_ATTRIBUTE(examples,attributes,binary_targets);
    
    tree.op=strcat('AU', num2str(best_attribute));

    for i=1:2
        examplesBestAttributeRows = find(examples(:,best_attribute) == (i-1));
        
        exampless{i} = examples(examplesBestAttributeRows,:);
        
        binary_targetss{i} = binary_targets(examplesBestAttributeRows,:);
        
        if (isempty(exampless{i}))
            tree.kids{i} = struct('op','','kids','','class','');%examples{i}
            tree.kids{i}.op = '';
            tree.kids{i}.kids = [];
            tree.kids{i}.class=MAJORITY_VALUE(binary_targets);
        else
            newAttributes=attributes(attributes~=best_attribute);
            tree.kids{i}=DECISION_TREE_LEARNING(exampless{i},newAttributes,binary_targetss{i});
        end
    end
end
end