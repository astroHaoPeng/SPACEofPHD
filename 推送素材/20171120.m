variableList = [...
    1,2,3,45;
    3,4,59,12;
    39,312,3,1;
    ];
testFunction = @disp;
for variable = variableList
    % do some caculation
    testFunction(variable);
end


variableList = [...
    1,2,3,45;
    3,4,59,12;
    39,312,3,1;
    ];
testFunction = @disp;
for ii = 1:size(variableList,1)
    % extract variable
    variable = variableList(:,ii);
    % do some caculation
    testFunction(variable);
end

% test
for ii = 1:3
    if ii == 2  % 如果这时
        ii = 4; % 想要机智地跳过后面的循环
    end         % 是没有用的
    disp(ii); 
end




