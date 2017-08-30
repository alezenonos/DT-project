error1 = cell2mat(meanError1cell);
error2 = cell2mat(meanError2cell);
error3 = cell2mat(meanError3cell);
error4 = cell2mat(meanError4cell);

hold on
xlabel('Cross Validations');
ylabel('Error');

axis([0 100 0 1]);
plot(error1,'red');
plot(error2,'blue');
plot(error3,'green');
plot(error4,'black');

legend('Technique 1','Technique 2','Technique 3','Technique 4')

hold off


var(error1)
var(error2)
var(error3)
var(error4)

mean(error1)
mean(error2)
mean(error3)
mean(error4)
