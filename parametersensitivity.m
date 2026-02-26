function [outputArg1,outputArg2] = parametersensitivity(sol)
%Interprets parameter sensitivity information from the solved ODE system

arguments (Input)
    sol %solution to an already solved ODE *WITH* the sensitivity parameter set
end

%extract the sensitivity values
%the sensitivity values are in a tensor (3d matrix) composed of
%[equation x parameters x time]
sensitivity = sol.Sensitivity();

%perform analysis on the sensitivity values
%at the current moment, this function is a skeleton for further implementaiton

end