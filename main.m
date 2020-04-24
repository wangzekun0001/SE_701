clear;clc;
close all

T = 1000;
dt = 0.01;
n = 100001;
%t = linespace(0,T,n)

aimlength = 15;
omga = 0:aimlength;
tar = [5];

%Algorithm 1: IPA-based optimization algorithm to find theta star and omega
%star

a = 1;
b = 2;
N = 10;
D = defineD(a, b, N)

sigma = 1;
epsilon = 1;
xi = 1;

theta = defineTheta(D, 2, sigma, xi)


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
