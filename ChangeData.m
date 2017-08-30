function target = ChangeData(binary_targets,o)
% target = ChangeData(binary_targets,o)
%    Function that changes the train classification data(targets) from
%    values 1 2 3 4 5 6 to binary values 0 1 according to a parameter o which defines the kind of tree.
%    INPUT : binary_targets - targets vector with values 1 ,2 ,3 ,4 ,5 ,6.
%            o - the kind of tree that is going to use the targets(value 1, 2, 3 ,4 ,5 ,6). 
%    OUTPUT : target - the targets vector into a binary representetion(0,1).

for j = 1:length(binary_targets)
    if( binary_targets(j) ~= o)
        binary_targets(j) = 0;
    elseif (binary_targets(j) == o)
        binary_targets(j) = 1;
    end
end
target = binary_targets;

end