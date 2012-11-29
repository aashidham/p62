%t, w, u, w_use, dm_dt, M, dv_dt, and index_fuel_runs_out are pairs of variables
%that are defined differently for both derivations. If they end with a '2',
%they have to do with the bernoulli derivation, else they are associated
%with the ideal gas derivation

[t,w] = ode45('test',1.5:0.0001:2,[0,0]); %ode for ideal gas derivation
[t2,w2] = ode45('test2',1.5:0.0001:2,[0]); %ode for bernoulli derivation

ro = 1000; %density of water in kg/m^3
A = 0.01; %cross-sectional area of water tank in m^2
Mo = 1; %initial mass of rocket in kg

w2(imag(w2) ~= 0) = 0

u = diff(w(:,1))/0.0001; %exhaust velocity for ideal gas derivation
u2 = diff(w2)/0.0001; %exhaust velocity for bernoulli derivation


w_use = w(:,1);
w_use = w_use(1:end-1);
w2_use = w2(1:end-1);
t_use = t(1:end-1);

plot(t(1:end-1),u,'.');
title('u for ideal gas');
figure();
plot(t(1:end-1),u2,'.');
title('u for bernoulli');
figure();

dm_dt = ro*A*w_use; %rate of mass change of rocket
dm_dt_2 = ro*A*w2_use;

%boundary condition: w = v = dm_dt = 0 when fuel runs out!
M = Mo - dm_dt;
M2 = Mo - dm_dt_2;
index_fuel_runs_out = min(find(M<0));
index_fuel_runs_out_2 = min(find(M2<0));

dv_dt = (u.*dm_dt)./ (Mo - dm_dt) - 9.8;
dv_dt_2 = (u2.*dm_dt_2)./ (Mo - dm_dt_2) - 9.8;

plot(t_use(1:index_fuel_runs_out-1),dv_dt(1:index_fuel_runs_out-1));
title('dv/dt for ideal gas');
figure();
plot(t_use(1:index_fuel_runs_out_2-1),dv_dt_2(1:index_fuel_runs_out_2-1));
title('dv/dt for bernoulli');