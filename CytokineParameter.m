classdef CytokineParameter
    % A container for the parameters of the cytokine model
    
    properties
        rI (1,1) double {mustBeNumeric} = 0.05    % Immune cell growth rate
        rC (1,1) double {mustBeNumeric} = 0.08    % Cancer cell growth rate
        dI (1,1) double {mustBeNumeric} = 0.02    % Immune cell death rate
        dC (1,1) double {mustBeNumeric} = 0.01    % Cancer cell death rate
        betaI (1,1) double = 0.01   % Cytokine prod. per immune cell
        betaC (1,1) double = 0.01   % Cytokine prod. per cancer cell
        kIC (1,1) double = 0.01    % Immune killing strength
        dY (1,1) double = 0.01     % Cytokine decay rate
        alphaI (1,1) double = 0.1  % Cytokine effect on immune cells
        D (1,1) double {mustBeMember(D, [0, 1])} = 0 % Drug level (0 for no drug; % 1 for full-dose culture condition)
        deltaC (1,1) double {mustBeInRange(deltaC, 0, 1)} = 0.1
        deltaI (1,1) double {mustBeInRange(deltaI, 0, 1)} = 0.1
        epsilonC (1,1) double {mustBeInRange(epsilonC, 0,1)} = 0.1
        epsilonI (1,1) double {mustBeInRange(epsilonI, 0,1)} = 0.1

    end
    
    methods
        function obj = CytokineParameter(namedArgs)
            % Constructor of the CytokineParameter object
            arguments
                namedArgs.?CytokineParameter % Allows passing any property as a name-value
            end
            
            % Automatically assign any inputs to the object
            fn = fieldnames(namedArgs);
            for i = 1:numel(fn)
                obj.(fn{i}) = namedArgs.(fn{i});
            end
        end

        function p = toVector(obj)
            %Converts the earlier provided parameters to a column vector
            arguments (Output)
                p (1,14)    %column vector containing all parameters for the model
            end

            p = [obj.rI; obj.rC; obj.dI; obj.dC; obj.betaI; ...
                 obj.betaC; obj.kIC; obj.dY; obj.alphaI; obj.D; ...
                 obj.deltaC; obj.deltaI; obj.epsilonC; obj.epsilonI];
        end
    end
end