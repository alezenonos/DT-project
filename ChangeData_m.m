function changedData = ChangeData_m(data)
% cbrcase = retrive(cbr, newcase)
%
% The function takes a cbr case and changes it to a vector of length 1x45
%
% INPUT:
%       data - A cbr case
% OUTPUT:
%       changedData - Vector of length 1x45

changedData  = zeros(1,45);
for i = 1:45
    if find(data == i)
        changedData(i) = 1;
    end
end

end