classdef Config
    %A centralized place for editing runtime settings.
    %   For model-specific parameter settings, refer to CytokineParameter.m

    properties
        %ode solver settings
        tspan = [0, 12]

        %runtime settings
        realdata (1,1) logical = false
    end
end