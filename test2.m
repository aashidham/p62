function xp = test2(t,x)
    R = 8.314; %ideal gas constant in J/molK
    T = 298; %ambient temperature in K
    A = 0.045; %cross-sectional area of water tank in m^2
    ro = 1000;  %density of water in kg/m^3
    Vo = 0.006; %volume of the gas in m^3 <-- parameter
    Po = 206800; %pressure of the water in Pa <-- parameter
    A2 = 4.6E-4; %nozzle cross-sectional area
    C = 0.205; %total height of tank in m
    n = (Po*Vo)/(R*T); %mol of gas in tank
    V = Vo+A2*x(1);
    xp = sqrt((2*n*R*T)/(ro*(V)) + 2*9.8*(C - V/A));
end