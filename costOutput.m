function f = costOutput (cost)
    f3 = figure(3);
    f3 = plot(cost)
    title('Cost J vs. Number of iterations');
    xlabel('Number of Iterations');
    ylabel('Cost J');
end