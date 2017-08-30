function [folds] = splitDataToFolds(data, number_of_folds)
% [folds] = splitDataToFolds(data, number_of_folds)
%    Function that splits the data into folds.
%    INPUT : data - the data that have to split.
%            number_of_folds - the number of folds to be created.
%    OUTPUT : folds - cell containing the folds.

folds = cell(1,number_of_folds);

% data = data(randperm(length(data)),:);
u2 = 0;
o = round(length(data(:,1))/number_of_folds);
p = o*number_of_folds - length(data(:,1));

for i=1:number_of_folds
    
    u1 = round(u2)+1;

    if( i <= p && p > 0)
        u2 = round(u2+length(data(:,1))/number_of_folds) - 1;
    elseif( i > p && p > 0)
        u2 = round(u2+length(data(:,1))/number_of_folds);
    end
    
    if( i <= abs(p) && p < 0)
        u2 = round(u2+length(data(:,1))/number_of_folds) + 1;
    elseif( i > abs(p) && p < 0)
        u2 = round(u2+length(data(:,1))/number_of_folds);
    end
    
    if ( p == 0)
        u2 = round(u2+length(data(:,1))/number_of_folds);
    end

    folds{i} = data(u1:u2,:);
end

end