function x = pt1(time, Kp, T)

%% PT1  Simulate the step response of a first-order lag (P–T1) system.

%   Inputs:
%       time  - Time vector [s]
%       Kp    - Proportional gain
%       T     - Time constant [s]

%   Output:
%       x     - Simulated output (same size as 'time')

    x = 5 * Kp * (1 - exp(-time ./ T));
    x = max(0, x);
end
