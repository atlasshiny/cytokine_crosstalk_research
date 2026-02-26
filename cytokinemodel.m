function dydt = cytokinemodel(~,y,p)
%Comprehensive model for cytokine modeling
%   Calculates the changes in the immune cells, cancer cells, and the
%   general cytokine concentration with respect to time.
arguments (Input)
    ~ %time (must be a scalar; if incorporating time: t (1,1) double)
    y (3,1) double %current cell/cytokine count at a given t-value (a column vector). If starting at t=0, this is the starting amount of cells/cytokines.
    p %an instance of the CytokineParameter class OR a column vector containing all parameters
end

arguments (Output)
    dydt (3,1) %a column vector containing the rates of change 
end

%turn the model parameters into a column vector `p_vec` and assign them to seperate, smaller variables
%the reason for converting to a vector is for certain `ode` object methods

%mapping numeric indices back to meaningful parameter variable names
rI       = p(1);
rC       = p(2);
dI       = p(3);
dC       = p(4);
betaI    = p(5);
betaC    = p(6);
kIC      = p(7);
dY       = p(8);
alphaI   = p(9);
D        = p(10);
deltaC   = p(11);
deltaI   = p(12);
epsilonC = p(13);
epsilonI = p(14);


%pull components of the vector y
I=y(1);
C=y(2);
Y=y(3);

%calculate the rate of change in immune cells with respect to time
dIdt = rI * (1 - deltaI * D) * I + alphaI * Y * I - dI * I; %change in immune cells with respect to time
dCdt = rC * (1 - deltaC * D) * C - dC * C - kIC * I * C; %change in cancer cells with respect to time
dYdt = betaI * (1 - epsilonI * D) * I + betaC * (1 - epsilonC * D) * C - dY * Y; %change in cytokine concentration with respect to time

%the return vector with all of the calculated rate of changes
dydt = [dIdt;dCdt;dYdt];
end