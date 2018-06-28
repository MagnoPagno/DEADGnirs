
close all
%% Load database



currentPath = fileparts(which(mfilename));
dataBaseTxtPath = fullfile(currentPath,'Path.txt');

if exist(dataBaseTxtPath, 'file')
	fid = fopen(dataBaseTxtPath);
	databasePath = fgetl(fid);
	fclose(fid);
else
	dataBaseDirectoryName = 'DataBase'; %cambiare con una finestra di dialogo
	newDatabasePath = fullfile(currentPath , dataBaseDirectoryName);
	databasePath = NewNIRSDataBase(newDatabasePath, currentPath);
end

dbNIRS = loadNIRSdb(databasePath);
%% Create the widget
Hmain.dataBasePath = dbNIRS.Path;
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



Hmain = NIRSToolbar(Hmain);

Hmain = NIRSTree(Hmain,dbNIRS);

Hmain = NIRSDisplay(Hmain,dbNIRS);

Hmain.mainFigure.Visible = 'on';


