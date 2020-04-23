clear all;
A = [0 1;-1 0];
B = [0;1];
D = 0;
x0 = [10;0];
Q = [2 0;0 4];
N = [1 0;0 10];
R = [1];
P = [10 0];
C = [0 1];





x = [10;0];
xhat = [10;0];
[K,L,G] = icare(A,B,Q,R);
L=place(A',C',P)'
A1 = A - L*C

Tend = 1;
dt = 0.01;
T = 0:dt:Tend;
u = zeros(1,length(T));
XX = zeros(length(x0),length(T));
XXhat = zeros(length(x0),length(T));
XX(:,1) = x;
XXhat(:,1) = xhat;
cost = 0;
for cnt=2:length(T)
    thisx = XX(:,cnt-1);
    thisxhat = XXhat(:,cnt-1);
    u(cnt) = -B'*K*thisx;
    y = C*x;
    yhat = C*xhat;
    
    x = thisx + dt*(A*thisx + B*u(cnt));
    xhat=thisxhat+dt*(A*thisxhat+B*u(cnt)+L*(y-C*xhat));
    XX(:,cnt) = x;
    XXhat(:,cnt) = xhat;
    if cnt >= 2
        cost = cost + XX(:,cnt-1)'*Q*XX(:,cnt-1) + u(cnt-1)'*R*u(cnt-1);
    end
end
cost1 = cost + x'*N*x
figure(4)
clf
plot(T,XX(1,:)+1,'b','linewidth',2);
hold on
plot(T,XXhat(1,:),'r','linewidth',2);
hold on
plot(T,u,'g','linewidth',2);
grid on
xlabel('time (s)');
ylabel('states');
legend('x1+1','xhat1','u');
set(gca,'fontsize',16);

figure(5)
clf
plot(T,XX(2,:)+1,'linewidth',2);
hold on
plot(T,XXhat(2,:),'r','linewidth',2);
hold on
plot(T,u,'g','linewidth',2);
grid on
xlabel('time (s)');
ylabel('states');
legend('x2+1','xhat2','u');
set(gca,'fontsize',16);

x = [10;0];
xhat = [10;0];
Tend = 10;
dt = 0.01;
T = 0:dt:Tend;
u = zeros(1,length(T));
XX = zeros(length(x0),length(T));
XXhat = zeros(length(x0),length(T));
XX(:,1) = x;
XXhat(:,1) = xhat;
cost = 0;
for cnt=2:length(T)
    thisx = XX(:,cnt-1);
    thisxhat = XXhat(:,cnt-1);
    u(cnt) = -B'*K*thisx;
    y = C*x;
    yhat = C*xhat;
    
    x = thisx + dt*(A*thisx + B*u(cnt));
    xhat=thisxhat+dt*(A*thisxhat+B*u(cnt)+L*(y-C*xhat));
    XX(:,cnt) = x;
    XXhat(:,cnt) = xhat;
    if cnt >= 2
        cost = cost + XX(:,cnt-1)'*Q*XX(:,cnt-1) + u(cnt-1)'*R*u(cnt-1);
    end
end
cost10 = cost + x'*N*x
figure(7)
clf
plot(T,XX(1,:)+1,'linewidth',2);
hold on
plot(T,XXhat(1,:),'r','linewidth',2);
hold on
plot(T,u,'g','linewidth',2);
grid on
xlabel('time (s)');
ylabel('states');
legend('x1+1','xhat1','u');
set(gca,'fontsize',16);
figure(8)
clf
plot(T,XX(2,:)+1,'linewidth',2);
hold on
plot(T,XXhat(2,:),'r','linewidth',2);
hold on
plot(T,u,'g','linewidth',2);
grid on
xlabel('time (s)');
ylabel('states');
legend('x2+1','xhat2','u');
set(gca,'fontsize',16);

x = [10;0];
xhat = [10;0];
Tend = 50;
dt = 0.01;
T = 0:dt:Tend;
u = zeros(1,length(T));
XX = zeros(length(x0),length(T));
XXhat = zeros(length(x0),length(T));
XX(:,1) = x;
XXhat(:,1) = xhat;
cost = 0;
for cnt=2:length(T)
    thisx = XX(:,cnt-1);
    thisxhat = XXhat(:,cnt-1);
    u(cnt) = -B'*K*thisx;
    y = C*x;
    yhat = C*xhat;
    
    x = thisx + dt*(A*thisx + B*u(cnt));
    xhat=thisxhat+dt*(A*thisxhat+B*u(cnt)+L*(y-C*xhat));
    XX(:,cnt) = x;
    XXhat(:,cnt) = xhat;
    if cnt >= 2
        cost = cost + XX(:,cnt-1)'*Q*XX(:,cnt-1) + u(cnt-1)'*R*u(cnt-1);
    end
end
cost50 = cost + x'*N*x
figure(9)
clf
plot(T,XX(1,:)+1,'linewidth',3);
hold on
plot(T,XXhat(1,:),'r','linewidth',3);
hold on
plot(T,u,'g','linewidth',3);
grid on
xlabel('time (s)');
ylabel('states');
legend('x1+1','xhat1','u');
set(gca,'fontsize',16);
figure(10)
clf
plot(T,XX(2,:)+1,'linewidth',2);
hold on
plot(T,XXhat(2,:),'r','linewidth',2);
hold on
plot(T,u,'g','linewidth',2);
grid on
xlabel('time (s)');
ylabel('states');
legend('x2+1','xhat2','u');
set(gca,'fontsize',16);


