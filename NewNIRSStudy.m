function StudyFigure = NewNIRSStudy(~, ~, Hmain,~)
		
	
	path = '/home/pagno/Desktop/MyProg/procadb/NIRSDataBase'; %solo di prova integrare il databse del tuto quando si accende





	StudyFigure.MainFigure = figure('Visible', 'on', ...
	'position', Hmain.screenSize.*(1/4),...
    'Resize', 'on',...
    'Name', 'New NIRS Study', ...
    'Numbertitle', 'off', ...
    'Toolbar', 'none', ...
    'Menubar', 'none', ...
    'DoubleBuffer', 'on', ...
    'DockControls', 'off', ...
    'Renderer', 'OpenGL',...
	'Visible', 'off' ...
	);
	
	StudyFigure.Subject.StudyName = uiw.widget.EditableText(...      
    'Parent',StudyFigure.MainFigure,...=
    'Value','Insert Name',...
    'Callback',@(h,e)disp(e),...
    'Label','Study Name:',...
    'LabelLocation','top',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.70 0.7 0.25]);
	
	StudyFigure.StudySelector = uiw.widget.FileSelector(...
    'Parent', StudyFigure.MainFigure, ...
    'Value', '/home/pagno/Desktop/dati/demodata.txt', ...
    'Pattern', {'*.mat','MATLAB MAT files (*.mat)'; '*.csv','CSV files (*.csv)'; '*.txt','TXT files (*.txt)'}, ...
    'Callback',@(h,e)disp(e),...
    'Label','Choose a data file:', ...
    'LabelLocation','top',...
    'LabelWidth',150,...
    'Units', 'normalize', ...
    'Position', [0.05 0.35 0.8 0.25]);


	
	

	StudyFigure.LoadButton = uicontrol('Style', 'pushbutton',...
	'String', 'Load',...
	'Units', 'normalize', ...
	'Position', [0.8 0.15 0.2 0.1],...
	'Callback', {@AddStudytoDataBase ,path ,StudyFigure }); 



	StudyFigure.MainFigure.Visible = 'on';

end


%% extra function


function	AddStudytoDataBase( ~, ~, path , studyhandle )
	dbPath = fullfile(path,'DBnirs.mat');
	if ~exist(dbPath,'file') %check if it exixst and then create it
		error('database not found')
	end

	
	%% inserire copie di backup qui e inserire il caricamentro dei piu file
	

	tempDataBase = load(dbPath,'DataBase'); %load the old database
	DataBase = tempDataBase.DataBase; %vedere se c'e' un modo migliore 
	
	if DataBase.nStudy == 0 %first study in the database create new id
		ID = [DataBase.ID , 'S000'];
	else
		oldID = DataBase.Study(DataBase.nStudy).ID(9:11); %last 3 IDnumber of the study
		ID = [DataBase.ID , 'S' ,int2str(oldID+1)]; % add 1 to generate the new id
	end
	DataBase.nStudy = DataBase.nStudy + 1; 
	
	DataBase.Study(DataBase.nStudy).ID = ID;
	DataBase.Study(DataBase.nStudy).Nome = studyhandle.Subject.StudyName;
	DataBase.Study(DataBase.nStudy).Data = datetime;
	DataBase.Study(DataBase.nStudy).nMeasure = 0;
	DataBase.Study(DataBase.nStudy).nGroups = 0;
	DataBase.Study(DataBase.nStudy).MeasureLength = 0;
	DataBase.Study(DataBase.nStudy).AnalysisLength = 0;
	DataBase.Study(DataBase.nStudy).Mieasure = [];
	DataBase.Study(DataBase.nStudy).Groups = [];


	save(dbPath,'DataBase');


end































