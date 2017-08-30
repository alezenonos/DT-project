function [F]=F_MEASURES(precision, recall)
% [F]=F_MEASURES(precision, recall)
%    Function that computes the F measures from precision and recall values.
%    INPUT : precision - the precision value.
%            recall - the recall value. 
%    OUTPUT : F - the F measures.

    F = 2*(precision*recall)/(precision+recall+eps); %calculating f measures
end