function [] = figureCfg(hfig)

%% Configure MATLAB figure appearance for consistent publication style.

%   Input:
%       hfig  - Handle to the figure to configure

%   Description:
%       - Sets font size, interpreter (LaTeX), and tick label interpreter
%       - Removes boxes from axes
%       - Adjusts figure size and aspect ratio

% Configuration parameters
picturewidth = 15;     % Width in centimeters
hw_ratio = 0.65;       % Height-to-width ratio
fontsize = 15;         % Global font size

set(findall(hfig,'-property','FontSize'),'FontSize', fontsize)
set(findall(hfig,'-property','Box'),'Box','off')
set(findall(hfig,'-property','Interpreter'),'Interpreter','latex')
set(findall(hfig,'-property','TickLabelInterpreter'),'TickLabelInterpreter','latex')
set(hfig,'Units','centimeters','Position',[3 3 picturewidth hw_ratio*picturewidth])

pos = get(hfig,'Position');
set(hfig,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)])
end