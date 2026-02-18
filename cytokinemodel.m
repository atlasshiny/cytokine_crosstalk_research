function dydt = cytokinemodel(~,y,p)
%Comprehensive model for cytokine modeling
%   Calculates the changes in the immune cells, cancer cells, and the
%   general cytokine concentration with respect to time.
arguments (Input)
    ~ %time (must be a scalar; if incorporating time: t (1,1) double)
    y (3,1) double %current cell/cytokine count at a given t-value (a column vector). If starting at t=0, this is the starting amount of cells/cytokines.
    p CytokineParameter %an instance of the CytokineParameter class
end

arguments (Output)
    dydt (3,1) %a column vector containing the rates of change 
end
%pull components of the vector y
I=y(1);
C=y(2);
Y=y(3);

%calculate the rate of change in immune cells with respect to time
dIdt = p.rI * (1 - p.deltaI * p.D) * I + p.alphaI * Y * I - p.dI * I; %change in immune cells with respect to time
dCdt = p.rC * (1 - p.deltaC * p.D) * C - p.dC * C - p.kIC * I * C; %change in cancer cells with respect to time
dYdt = p.betaI * (1 - p.epsilonI * p.D) * I + p.betaC * (1 - p.epsilonC * p.D) * C - p.dY * Y; %change in cytokine concentration with respect to time

%the return vector with all of the calculated rate of changes
dydt = [dIdt;dCdt;dYdt];
end