function [ precision, recall ] = PRECISION_RECALL(con_matrix,class)
% [ precision, recall ] = PRECISION_RECALL(con_matrix,class)
%    Function that calculates precision and recall using the confusion
%    matrix and the class number [1,..,6].
%    INPUT : con_matrix - the confusion matrix.
%            class - the class number [1,...,6].
%    OUTPUT : precision - the precision of the class.
%             recall- the recall of the class.

TP = con_matrix(class,class); % true positives are in the diagonal in cell (class,class)
class_column = con_matrix(:,class);
FP = sum(class_column) - TP; % adding column values except the con_matrix(class,class)
class_row = con_matrix(class,:);
FN = sum(class_row) - TP;  % adding row values except the con_matrix(class,class)

precision = TP/( TP + FP + eps)*100; 
recall    = TP/(TP + FN + eps)*100; 

end