function [StudyFigure,dbNIRS] = NewNIRSMeasure(objHandle, ~ ,Hmain,dbNIRS)
	
	set(objHandle, 'Enable', 'off')
	drawnow;


StudyFigure.MainFigure = figure('Visible', 'on', ...
	'position', Hmain.screenSize.*(3/4),...
    'Resize', 'on',...
    'Name', 'New NIRS measure', ...
    'Numbertitle', 'off', ...
    'Toolbar', 'none', ...
    'Menubar', 'none', ...
    'DoubleBuffer', 'on', ...
    'DockControls', 'off', ...
    'Renderer', 'OpenGL',...
	'DeleteFcn', {@renableHandle,objHandle},...
	'Visible', 'off' ...
);

%% Editable text for subject
	
StudyFigure.Subject.Pannel = uipanel (...
		'Title', 'Subject', ...
		'parent', StudyFigure.MainFigure,...
		'Units', 'normalized',...
		'Position',[0.01 0.39 0.45 0.6]);
	
	
 % inserire controllo data nascita 
	%name
	StudyFigure.Subject.Name = uiw.widget.EditableText(...      
    'Parent',StudyFigure.Subject.Pannel,...=
    'Value','Insert Name',...
    'Callback',@(h,e)disp(e),...
    'Label','Name:',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.85 0.7 0.08]);
	
	%surname
	StudyFigure.Subject.Surname = uiw.widget.EditableText(...      
    'Parent',StudyFigure.Subject.Pannel,...=
    'Value','Insert Surname',...
    'Callback',@(h,e)disp(e),...
    'Label','Surname:',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.65 0.7 0.08]);

	StudyFigure.Subject.BirthDate = uiw.widget.EditableText(...      
    'Parent',StudyFigure.Subject.Pannel,...=
    'Value','31/05/2018',...
    'Callback',@(h,e)disp(e),...
    'Label','Birthdate:',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.65 0.7 0.08]);

	%Apgar1
	StudyFigure.Subject.Apgar1 = uiw.widget.EditableText(...      
    'Parent',StudyFigure.Subject.Pannel,...=
    'Value','Insert Apgar1',...
    'Callback',@(h,e)disp(e),...
    'Label','Apgar1:',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.45 0.7 0.08]);

	%Apgar5
	StudyFigure.Subject.Apgar5 = uiw.widget.EditableText(...      
    'Parent',StudyFigure.Subject.Pannel,...=
    'Value','Insert Apgar5',...
    'Callback',@(h,e)disp(e),...
    'Label','Apgar5:',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.25 0.7 0.08]);

	%note
	StudyFigure.Subject.Note = uiw.widget.EditableText(...      
    'Parent',StudyFigure.Subject.Pannel,...=
    'Value','',...
    'Callback',@(h,e)disp(e),...
    'Label','Note:',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Units','normalized',...
	'IsMultiLine', true,...
    'Position',[0.05 0.05 0.7 0.08]);

%% Text for Measure (imported)
	StudyFigure.Measure.Pannel = uipanel (...
		'Title', 'Measure', ...
		'parent', StudyFigure.MainFigure,...
		'Units', 'normalized',...
		'Position',[0.5 0.39 0.49 0.6]);
		
	%Date
	StudyFigure.Measure.Date = uiw.widget.FixedText(...      
    'Parent',StudyFigure.Measure.Pannel,...=
    'Value','',...
    'Label','Date:',...
    'LabelLocation','top',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.85 0.3 0.15]);
	
	%Length
	StudyFigure.Measure.Length = uiw.widget.FixedText(...      
    'Parent',StudyFigure.Measure.Pannel,...=
    'Value','',...
    'Label','Length:',...
    'LabelLocation','top',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.65 0.3 0.15]);

	%DetectorCH
	StudyFigure.Measure.DetectorCH = uiw.widget.FixedText(...      
    'Parent',StudyFigure.Measure.Pannel,...=
    'Value','',...
    'Label','N. Detector CH.',...
    'LabelLocation','top',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.45 0.3 0.15]);

	%AnalogCH
	StudyFigure.Measure.AnalogCH = uiw.widget.FixedText(...      
    'Parent',StudyFigure.Measure.Pannel,...=
    'Value','',...
    'Label','N. Detector CH.',...
    'LabelLocation','top',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.25 0.3 0.15]);

	%note
	StudyFigure.Measure.note = uiw.widget.EditableText(...      
    'Parent',StudyFigure.Measure.Pannel,...=
    'Value','',...
    'Callback',@(h,e)disp(e),...
    'Label','Note:',...
    'LabelLocation','top',...
    'LabelWidth',90,...
    'Units','normalized',...
	'IsMultiLine', true,...
    'Position',[0.05 0.05 0.3 0.15]);



%% Popup for select the study
	StudyFigure.StudySelector = uiw.widget.EditablePopupWithButton(...
    'Parent',StudyFigure.MainFigure,...
    'Items',{dbNIRS.Study.Nome},...
    'Value',Hmain.Tree.Main.SelectedNodes.Name,...
    'Callback',@(h,e)disp(e.Interaction),...
    'Callback',@(h,e)disp(e),...
    'Label','Study',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Padding',2,... %Add some padding around the widget
    'Units','normalized',...
    'Position',[0.05 0.30 0.3 0.05]);

%% popup for select the probe 
	StudyFigure.ProbeSelector = uiw.widget.EditablePopupWithButton(...
    'Parent',StudyFigure.MainFigure,...
    'Items',{'USA','Canada','Mexico'},...
    'SelectedIndex',2,...
    'Value','France',...
    'Callback',@(h,e)disp(e.Interaction),...
    'Callback',@(h,e)disp(e),...
    'Label','Probe',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Padding',2,... %Add some padding around the widget
    'Units','normalized',...
    'Position',[0.05 0.25 0.3 0.05]);

%% File selector for the measure data

	StudyFigure.MeasureSelector = uiw.widget.FileSelector(...
    'Parent', StudyFigure.MainFigure, ...
    'Value', '/home/pagno/Desktop/dati/demodata.txt', ...
    'Pattern', {'*.txt','TXT files (*.txt)'}, ...
    'Callback',@(handle, event)FastLoadDatatoNewMeasureGUI(handle, event, StudyFigure),...
	'UserData',StudyFigure,...
    'Label','Choose a data file:', ...
    'LabelLocation','left',...
    'LabelWidth',150,...
    'Units', 'normalize', ...
    'Position', [0.05 0.15 0.5 0.04]);
	
	
%% 	File selector for the video
	StudyFigure.VideoSelector= uiw.widget.FileSelector(...
    'Parent', StudyFigure.MainFigure, ...
    'Value', 'C:\matlab.mat', ...
    'Pattern', {' *.txt','TXT files (*.txt)' ; '*.mat','MATLAB MAT files (*.mat)'; '*.csv','CSV files (*.csv)'}, ...
    'Callback',@(h,e)disp(e),...
    'Label','Choose a video file:', ...
    'LabelLocation','left',...
    'LabelWidth',150,...
    'Units', 'normalize', ...
    'Position', [0.05 0.05 0.5 0.04]);


%% Loading bar
		StudyFigure.LoadingBarHandle = uicontrol( ...
			'Parent', StudyFigure.MainFigure, ...
			'Style','text',...
			'String','          ',...
			'Units', 'normalize', ...
			'Position',[0.8 0.1 0.1 0.04],...			
			'ForegroundColor', [1 0 0 ],...			
			'BackgroundColor', [0 0 0 ],...
			'HorizontalAlignment', 'left');
%% Button

		StudyFigure.LoadButton = uicontrol('Style', 'pushbutton',...
		'Parent', StudyFigure.MainFigure, ...
		'String', 'Load',...
		'Units', 'normalize', ...
        'Position', [0.8 0.15 0.1 0.04],...
        'Callback', {@LoadDatatoNewMeasureGUI ,StudyFigure , dbNIRS}); 
	
	StudyFigure.MainFigure.Visible = 'on';

end



%% Auxiliary function
function	LoadDatatoNewMeasureGUI(ObjHandle ,~ ,MainHandle,DataBase)
		nsamples = 500; % n of samples af the light data for the db
		datatolightsave = 'DC'; %save only DC component in the database add 'ph' o AC for other component







		set(ObjHandle, 'Enable', 'off')
		drawnow;
		
		%inserire controllo su;lla bonta' dei campi
		%in futuro inserire un controllo sui vari tipi di estensioni
		if exist(MainHandle.MeasureSelector.Value , 'file')	
			
			%create misure idx
			selectedStudyIdx = MainHandle.StudySelector.SelectedIndex;
			SelectedStudy = DataBase.Study(selectedStudyIdx);
			if SelectedStudy.nMeasure == 0
				measureID = [SelectedStudy.ID , 'M000']; 
			else
				
				oldID = SelectedStudy.Measure(SelectedStudy.nMeasure).ID(13:15); %take only the 3 significant digits
				newID = num2str(str2double(oldID)+1,'%.3d');
				measureID =[SelectedStudy.ID ,'M',newID ]; 
			end
			
			%create a subject variable
			subjectBDate = MainHandle.Subject.BirthDate.Value;%subjectBDate = '31/03/2018'
			subjectAge =  datetime - datetime(subjectBDate);   
			Subject = NIRSSubject('name', MainHandle.Subject.Name.Value,...
				'sname', MainHandle.Subject.Surname.Value,...
				'bdate', MainHandle.Subject.BirthDate.Value,...
				'age', subjectAge,...
				'apgar1', MainHandle.Subject.Apgar1.Value,...
				'apgar5', MainHandle.Subject.Apgar5.Value,...
				'note', MainHandle.Subject.Note.Value);
			%% creiamo e salviao il file dei dati
			DataNIRS = LoadBOXYdata(MainHandle.MeasureSelector.Value, [], [] , MainHandle.LoadingBarHandle ); %load all the data present in the file
 			
			analysisID = [ measureID,'A000'];
			DataNIRS = NIRSMeasure(DataNIRS,...
				'AnalysisID',analysisID,... 
				'MeasureID',measureID,... 
				'StudyID',SelectedStudy.ID,... 
				'Subject',Subject,...
				'Probe', [],...%%cercarlo nel database 
				'Eventss',[],...%%tirarli fuori in qualche modo
				'Video',[]... %%se ce lo carichi altrimenti no
				); % load all the metadata present in the window
			
			measurePath = fullfile(DataBase.Path,SelectedStudy.ID,measureID);
			mkdir(measurePath);
			filepath = fullfile(measurePath, 'A000');
			save(filepath,'DataNIRS');
			%% update database
			measIdx = DataBase.Study(selectedStudyIdx).nMeasure +1;
			
			DataBase.Study(selectedStudyIdx).nMeasure = measIdx;
			DataBase.Study(selectedStudyIdx).Measure(measIdx).ID = measureID;
			DataBase.Study(selectedStudyIdx).Measure(measIdx).Date = DataNIRS.MeasureInfo.Date;
 			DataBase.Study(selectedStudyIdx).Measure(measIdx).Duration = DataNIRS.MeasureInfo.Duration;
			DataBase.Study(selectedStudyIdx).Measure(measIdx).Subject = Subject;
			DataBase.Study(selectedStudyIdx).Measure(measIdx).Probe = [];
			DataBase.Study(selectedStudyIdx).Measure(measIdx).nAnalysis = 0;
			DataBase.Study(selectedStudyIdx).Measure(measIdx).note = MainHandle.Subject.Note.Value;

			DataBase.Study(selectedStudyIdx).Measure(measIdx).Analysis(1).ID = [measureID 'A000'];
			DataBase.Study(selectedStudyIdx).Measure(measIdx).Analysis(1).note = '';
			DataBase.Study(selectedStudyIdx).Measure(measIdx).Analysis(1).analysis = 'row';
				
			columnName = DataNIRS.Data.Properties.VariableNames; %obtain al the column name in order to select the DC ones
			dcIdx = contains(columnName,datatolightsave);   %obtain the selected column

			selectedIndex = floor(linspace(1,length(DataNIRS.Data{:,1}),nsamples));
			
			lightdata = [ table(DataNIRS.Data.reltime(selectedIndex),'VariableNames', {'reltime'}), DataNIRS.Data(selectedIndex,dcIdx)];
			
			
			DataBase.Study(selectedStudyIdx).Measure(measIdx).Analysis(1).Ldata = lightdata;
			
			
			saveDBPath = fullfile(DataBase.Path ,'NIRSDataBase.mat');
			save(saveDBPath,'DataBase');
			else
				error('file not found')
		end
		close(MainHandle.MainFigure)
end
		


function	FastLoadDatatoNewMeasureGUI(ObjHandle ,event ,MainHandle)

		set(ObjHandle, 'Enable', 'off')
		drawnow;
		if exist(event.NewValue , 'file')	
			DataNIRS = LoadBOXYdata( event.NewValue,[], 'f', []);
 			MainHandle.Measure.Date.Value = DataNIRS.MeasureInfo.Date;
			MainHandle.Measure.Length.Value = [num2str(DataNIRS.MeasureInfo.Duration),' s'];
			MainHandle.Measure.DetectorCH.Value = num2str(DataNIRS.MeasureInfo.AqInfo.DetectorChannel);
			MainHandle.Measure.AnalogCH.Value = num2str(DataNIRS.MeasureInfo.AqInfo.AuxiliaryAnalogChannels);
			
			else
				Error('file not found')
		end
		set(ObjHandle, 'Enable', 'on')
end


function renableHandle(~,~, objHandle)
	set(objHandle, 'Enable', 'on')
end

