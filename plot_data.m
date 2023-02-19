f1 = figure(1);
set(f1,'position',[100 100 400 400])
subplot(3,1,1)
plot(t,x(:,1),t,x(:,2));
subplot(3,1,2)
plot(t,x(:,3),t,x(:,4));
subplot(3,1,3)
u = x(:,3).*getrefs(t)' + x(:,4).*x(:,1);
plot(t,asin(u));