function E = costFunction(p, time, meas, visualize)

%% COSTFUNCTION  Computes the cost (error) between measured and simulated signals.

%   Inputs:
%       p          - Vector of controller parameters [Kp, T]
%       time       - Time vector [s]
%       meas       - Measured signal (same length as 'time')
%       visualize  - Logical flag to enable result visualization (true/false)

%   Output:
%       E          - Integrated absolute error between simulation and measurement

%   Description:
%       This function evaluates the cost for a P-T1 control system by comparing
%       the simulated response with measured data. The error is computed as the
%       integral of the absolute difference between the two signals.

    Kp = p(1);
    T  = p(2);

    sim = pt1(time, Kp, T);

    E = trapz(time, abs(sim - meas));

    if visualize
        hfig = gcf;
        clf(hfig);
        ax = axes('Parent', hfig, 'NextPlot', 'add');

        plot(ax, time, meas, 'blue');
        plot(ax, time, sim, 'red');

        title(ax, sprintf('Simulation Black-Box Model, Error: %.5f', E));
        legend(ax, 'Measurements', sprintf('Black-Box ($K_P=%5.3f$ $T=%5.3f$)', Kp, T), 'Location', 'southeast')
        xlabel(ax, 'Time [s]');
        ylabel(ax, 'Voltage [V]');
        figureCfg(hfig);

        drawnow;
    end
end
