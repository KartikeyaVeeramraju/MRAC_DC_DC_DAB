close all
clc

sz = 12;

t = ar.time;
ar_arr = ar.signals.values;
ax_arr = ax.signals.values;
xm_arr = xm.signals.values;
xp_arr = x.signals.values;
phi_arr = u.signals.values(1,:)';


arax_fig = figure(1);
set(arax_fig,'position',[100 100 400 300]);
%plot ar, ax arrays
plot(t,ar_arr,t,ax_arr);
xlabel('t','interpreter','latex','fontsize',sz);
ylabel('$$a_r/a_x$$','interpreter','latex','fontsize',sz);
legend('$$a_r$$','$$a_x$$','interpreter','latex','fontsize',sz,'orientation','horizontal','location','northoutside');
axis tight

xpxm_fig = figure(2);
set(xpxm_fig,'position',[100 100 400 300]);
%plot x, xm arrays
plot(t,xp_arr,t,xm_arr);
xlabel('t','interpreter','latex','fontsize',sz);
ylabel('v','interpreter','latex','fontsize',sz);
legend('$$v_p(t)$$','$$v_{m}(t)$$','interpreter','latex','fontsize',sz,'orientation','horizontal','location','northoutside');
axis tight


phi_fig = figure(3);
set(phi_fig,'position',[100 100 400 300]);
%plot x, xm arrays
plot(t,phi_arr);
xlabel('t','interpreter','latex','fontsize',sz);
ylabel('$$\phi(t)$$','interpreter','latex','fontsize',sz);
axis tight


combined_fig = figure(4);
set(combined_fig,'position',[100 100 400 300]);
%plot x, xm arrays
subplot(2,1,1)
plot(t,xp_arr,t,xm_arr);
xlabel('t','interpreter','latex','fontsize',sz);
ylabel('v','interpreter','latex','fontsize',sz);
legend('$$v_p(t)$$','$$v_{m}(t)$$','interpreter','latex','fontsize',sz,'orientation','horizontal','location','northoutside');
axis tight

%plot x, xm arrays
subplot(2,1,2)
plot(t,phi_arr);
xlabel('t','interpreter','latex','fontsize',sz);
ylabel('$$\phi(t)$$','interpreter','latex','fontsize',sz);
axis tight
