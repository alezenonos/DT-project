function [predict level] = TRAVERSE(tree,example,level)
% [predict level] = TRAVERSE(tree,example,level)
%    Function that traverses one tree in order to classify an example.
%    INPUT : tree - the tree that is going to be traversed.
%            example - the example that has to be classified.
%            level - starting level of the tree. the default value is 0.
%
%    OUTPUT : predict - the classification prediction of the example.
%             level - the level of the tree that the example was
%             classified.
if  strcmp(tree.op,'')
    predict=tree.class;
else
    level = level +1;
    node_number = str2num(strrep(tree.op, 'AU', ''));
    attributeOnExampleRow=example(node_number);
    
    if attributeOnExampleRow==0
        [predict level]=TRAVERSE(tree.kids{1},example,level);
    else
        [predict level]=TRAVERSE(tree.kids{2},example,level);
    end
    
end

end