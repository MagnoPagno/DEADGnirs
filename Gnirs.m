
close all
%% Load database
%inserire un percorso predefinito nel quale si andra a inserire l'app
dbNIRS = loadNIRSdb;



%% Create the widget
Hmain.screenSize = get(0,'ScreenSize');
feature('DefaultCharacterSet', 'UTF8');

% Set color theme
Hmain.theme = 'dark';
switch Hmain.theme
    case 'classic'
        backgroundColor = get(0,'DefaultUicontrolBackgroundcolor');
        foregroundColor = 'k';
        panelColor = [211 211 211]/255;
    case 'dark'
        backgroundColor = [68 68 68]/255;
        foregroundColor = 'w';
        panelColor = [92 92 92]/255;
end

Hmain.mainFigure = figure('Visible', 'off', ...
	'position', Hmain.screenSize,...
    'Resize', 'on',...
    'Name', 'Raw Explorer', ...
    'Numbertitle', 'off', ...
    'Tag', 'sensors_viewer', ...
    'Color', backgroundColor, ...
    'Toolbar', 'none', ...
    'Menubar', 'none', ...
    'DoubleBuffer', 'on', ...
    'DockControls', 'off', ...
    'Renderer', 'OpenGL');



Hmain = NIRSTree(Hmain,dbNIRS);

Hmain = NIRSToolbar(Hmain);




Hmain.mainFigure.Visible = 'on';


