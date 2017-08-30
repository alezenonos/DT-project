function [a_r a_p a_f avg_matrix]=EVALUATION(predicted, actual)
% [a_r a_p a_f]=EVALUATION(predicted, actual)
%    Function that computes the average recall, precision and F measures of the cross validation process.
%    INPUT : predicted - matrix containing all predicted classifications of cross validation process.
%            actual - matrix containing the corresponding actual classifications of cross validation process.
%             
%    OUTPUT : a_r - the average recall of each class.   
%             a_p - the average precision of each class.
%             a_f - the average F measures of each class.

matrix = zeros(6,6);  %initialization of confusion matrix
avg_matrix = zeros(6,6); %initialization of average confusion matrix 
avg_precision = zeros(1,6);
avg_recall = zeros(1,6);
avg_f = zeros(1,6);

pairs = length(predicted); % number of pairs of <predicted_array, actual_array>

for i=1:pairs,
    matrix = CONFUSION_MATRIX(predicted{i}, actual{i}); %confusion matrix calculation
    for class=1:6,   % for each class we compute the precision, recall and f-measure
        [p,r] = PRECISION_RECALL(matrix, class);
        f = F_MEASURES(p,r);
        
        avg_recall(class) = avg_recall(class) + r;
        avg_precision(class) = avg_precision(class) + p;
        avg_f(class) = avg_f(class) + f ; %adding for calculating average later
    end
    
    avg_matrix = avg_matrix + matrix; % adding for calculating average later
end

%calculating averages
avg_matrix = avg_matrix./pairs;
classnames = {'Anger','Disgust', 'Fear', 'Happiness', 'Sadness', 'Surprise' };
for class=1:6,
    
   classname = classnames{class};
        
    %disp(sprintf('\nClass %s : %s',num2str(class), classname ));
    a_r(class) = avg_recall(class)./pairs;
   % disp(sprintf('Average recall %s%%',num2str(a_r(class))));
    a_p(class) = avg_precision(class) ./pairs;
    %disp(sprintf('Average precision %s%%',num2str(a_p(class))));
    a_f(class) = avg_f(class)./pairs;
    %disp(sprintf('Average F-measure %s%%\n',num2str(a_f(class))));
end


end