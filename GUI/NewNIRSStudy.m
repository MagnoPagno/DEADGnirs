function StudyFigure = NewNIRSStudy(~, ~, Hmain,~)
		
	
	

	StudyFigure.MainFigure = figure('Visible', 'on', ...
	'position', Hmain.screenSize.*(1/2),...
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
    'Position',[0.05 0.80 0.35 0.15]);

	StudyFigure.ListBox = uicontrol(...
			'Parent', StudyFigure.MainFigure, ...
			'Style','listbox',...
			'Units', 'normalize', ...
			'Max', 2,...
			'Position',  [0.05 0.05 0.4 0.55],...
			'String',[],...
			'Value',[]);

	StudyFigure.StudySelector = uiw.widget.FolderSelector(...
    'Parent', StudyFigure.MainFigure, ...
    'Value', [], ...
    'Label','Choose a data file:', ...
    'LabelLocation','top',...
    'LabelWidth',150,...
    'Units', 'normalize', ...
    'Position', [0.05 0.60 0.4 0.15],...	
	'Callback',@(ObjectHandle, Event)foudfile(ObjectHandle, Event,StudyFigure)...
	);

	
	

	StudyFigure.LoadButton = uicontrol('Style', 'pushbutton',...	
    'Parent', StudyFigure.MainFigure, ...
	'String', 'Load',...
	'Units', 'normalize', ...
	'Position', [0.8 0.15 0.2 0.1],...
	'Callback', {@AddStudytoDataBase ,Hmain ,StudyFigure }); 

	

	StudyFigure.MainFigure.Visible = 'on';

end


%% extra function


function	AddStudytoDataBase( ~, ~, MainHandle , studyhandle )


	pathDataBase = MainHandle.dataBasePath;
	

	dbPath = fullfile(pathDataBase,'NIRSDataBase.mat');
	if ~exist(dbPath,'file') %check if it exixst and then create it
		error('database not found')
	end

	
	%% inserire copie di backup qui e inserire il caricamentro dei piu file
	

	tempDataBase = load(dbPath,'DataBase'); %load the old database
	DataBase = tempDataBase.DataBase; %vedere se c'e' un modo migliore 
	
	if DataBase.nStudy == 0 %first study in the database create new id
		studyID = [DataBase.ID , 'S000'];
		DataBase.nStudy = 1;
	else
		oldID = DataBase.Study(DataBase.nStudy).ID(9:11); %last 3 IDnumber of the study
		studyID = [DataBase.ID , 'S' ,num2str(str2double(oldID)+1,'%.3d')]; % add 1 to generate the new id
		DataBase.nStudy = DataBase.nStudy + 1;
	end	 
	
	DataBase.Study(DataBase.nStudy).ID = studyID;
	DataBase.Study(DataBase.nStudy).Nome = studyhandle.Subject.StudyName.Value;
	DataBase.Study(DataBase.nStudy).Data = datetime;
	
	DataBase.Study(DataBase.nStudy).nMeasure = 0;
	DataBase.Study(DataBase.nStudy).nGroups = 0;
	DataBase.Study(DataBase.nStudy).nMeasurePersistent = 0;
	DataBase.Study(DataBase.nStudy).nGroupsPersistent = 0;
	
	DataBase.Study(DataBase.nStudy).MeasureLength = 0;
	DataBase.Study(DataBase.nStudy).AnalysisLength = 0;
	DataBase.Study(DataBase.nStudy).Measure = [];
	DataBase.Study(DataBase.nStudy).Groups = [];
	DataBase.Study(DataBase.nStudy).note = [];
	
	%crea la nuova cartella del db
	studyPath = fullfile(DataBase.Path,studyID);
	mkdir(studyPath);
	
	save(dbPath,'DataBase');
	
	close(studyhandle.MainFigure);
	
	NIRSTree(MainHandle,DataBase);
	
	
	
	
	
	
	
end



function foudfile(ObjectHandle, ~,StudyHandle)
	searchingPath = ObjectHandle.FullPath;
	listOfFile = dir(searchingPath);
	listOfTxt = listOfFile(contains({listOfFile.name}, '.txt'));
	
	StudyHandle.ListBox.String = {listOfTxt.name};
	drawnow
end



























