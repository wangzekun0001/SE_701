clear;clc;
close all

T = 1000;  %Time
dt = 0.01;
n = 100001; %这是啥
%t = linespace(0,T,n)

L = 15; %整体长度
omega = 0:L; %等分

target = [5,10,15];  %这是啥

s_num = 1;
s_init = linspace(0,L,s_num);
u_init = zeros(1,s_num);
J1 = 0; 

R0=zeros(1,L+1); %measure of uncertainty at each sampling point
R0(target+1) = 1;


A0=zeros(1,L+1); %complexity increasing rate
A0(target+1) = 1; %这是啥

J0 = 0;
%{
    P = s_position(omega,s,rs);
    R = R + A0.*dt;
    R  = max(R - B.*P*dt,0);
    J = J + sum(R)*dt;  % cost
%}


%Algorithm 1: IPA-based optimization algorithm to find theta star and omega
%star
s = [1,2,3,4,5,6,7,8,9,10] %temporary s for testing
a = 1;
b = 2;
N = 10;
D = defineD(a, b, N);
sigma = 1;
epsilon = 1;
xi = 1;
theta = defineTheta(D, 2, sigma, xi)
gamma = defineGamma(sigma, D, 20, 2, s)
omega = zeros(1, N);


function f = defineD(a, b, N)
    A = zeros(1, N);
    for i = 1:N
        A(i) = a + (2*i - (1/(2*N))) * (b-a);
    end
    f = A;          
end


function f = defineTheta(D, n, sigma, xi)
    if mod(xi,2)
        f = D(n) - sigma;
    else
        f = D(n) + sigma;
    end
end


function f = defineGamma(sigma, D, T, n, s)
    f = ceil(1/(2 * sigma) * (T - defineTheta(D, n, sigma, 1) + s(n)));
end
