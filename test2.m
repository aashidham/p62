function xp = test2(t,x)
    n = .05; %mol of gas in tank
    R = 8.314; %ideal gas constant in J/molK
    T = 298; %ambient temperature in K
    A = 0.045; %cross-sectional area of water tank in m^2
    ro = 1000;  %density of water in kg/m^3
    Vo = 0.006; %volume of the gas in m^3
    C = 0.205; %total height of tank in m
    xp = sqrt((2*n*R*T)/(ro*(Vo+A*x(1))) + 2*9.8*(C - Vo/A - x(1)));
end