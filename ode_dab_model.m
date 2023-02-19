close all
clear all
clc

global Rc Co Rload1 Rload2 Vin n Vout gamma am bm fsw Z

Vin = 270;
Vout = 28;

n_pri = 1;
n_sec = 5;
n = n_sec/n_pri;

Llk = 7.87e-6;
Co = 5e-3;

fsw = 10e+3;
P1 = 3e+3;
Rload1 = Vout^2/P1;
Rload = Rload1;
P2 = 6e+3;
Rload2 = Vout^2/P2;
%Rload = 5;
Rc = 4.1e-3;
Rt = 4.1e-3;

Ro = (Rload*Rt + Rc*Rt + Rload*Rc)/(Rload + Rc);
Xl = 2*pi*fsw*Llk;
Z = sqrt(Ro^2+Xl^2);
gamma = 0.04;

%ref model
am = 581.93;
bm = 581.93;

ar_0 = 0;
ax_0 = 0;


sim_tim = 2000/fsw;

DAB_init = 0;
Model_init = 0;
ar_init = 0;
ax_init = 0;
x0 = [DAB_init; Model_init; ar_init; ax_init];

tspan = 0:1e-6:sim_tim;

[t,x] = ode23(@DAB_MRAC,tspan,x0);

run('plot_data.m')

function xdot =  DAB_MRAC(t,x)
global Rc Co Rload1 Rload2 Vin n Vout gamma am bm Z
xp = x(1);
xm = x(2);
ar = x(3);
ax = x(4);
if t<=0.035
    r = Vout;
    Rload = Rload1;
elseif t>0.035 && t<=0.065
    r = 18;
    Rload = Rload1;
elseif t>0.065 && t<=0.095
    r = Vout;
    Rload = Rload1;
elseif t>0.095 && t<=0.130
    Rload = Rload2;
    r = Vout;
elseif t>0.130
    Rload = Rload1;
    r = 18;
end
%plant
%w = 100*cos(2*pi*10*t); %enable disturbance
w = 0; %disable disturbance
u = ar*r + ax*xp;
f = -xp/((Rload+Rc)*Co);
g = (8/pi^2)*(Rload/((Rload+Rc)*Co))*(n*Vin/Z);
xpdot = f+g*u + w;

%model
xmdot = -am*xm + bm*r;

%parametric updates
em = xp-xm;
ardot = -gamma*em*r;
axdot = -gamma*em*xp;

xdot = [xpdot;xmdot;ardot;axdot];
end

