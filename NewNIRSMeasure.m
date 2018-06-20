function [StudyFigure,dbNIRS] = NewNIRSMeasure(object_handle, event,Hmain,dbNIRS)
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
	'Visible', 'off' ...
);

%% Editable text for subject
	StudyFigure.Subject.Pannel = uipanel (...
		'Title', 'Subject', ...
		'parent', StudyFigure.MainFigure,...
		'Units', 'normalized',...
		'Position',[0.01 0.39 0.45 0.6]);
	
	
 %data di nascita??
	%name
	StudyFigure.Subject.SubjectName = uiw.widget.EditableText(...      
    'Parent',StudyFigure.Subject.Pannel,...=
    'Value','Insert Name',...
    'Callback',@(h,e)disp(e),...
    'Label','Name:',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.85 0.7 0.08]);
	
	%surname
	StudyFigure.Subject.SubjectSurname = uiw.widget.EditableText(...      
    'Parent',StudyFigure.Subject.Pannel,...=
    'Value','Insert Surname',...
    'Callback',@(h,e)disp(e),...
    'Label','Surname:',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.65 0.7 0.08]);

	%Apgar1
	StudyFigure.Subject.SubjectApgar1 = uiw.widget.EditableText(...      
    'Parent',StudyFigure.Subject.Pannel,...=
    'Value','Insert Apgar1',...
    'Callback',@(h,e)disp(e),...
    'Label','Apgar1:',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.45 0.7 0.08]);

	%Apgar5
	StudyFigure.Subject.SubjectApgar5 = uiw.widget.EditableText(...      
    'Parent',StudyFigure.Subject.Pannel,...=
    'Value','Insert Apgar5',...
    'Callback',@(h,e)disp(e),...
    'Label','Apgar5:',...
    'LabelLocation','left',...
    'LabelWidth',90,...
    'Units','normalized',...
    'Position',[0.05 0.25 0.7 0.08]);

	%note
	StudyFigure.Subject.Subjectnote = uiw.widget.EditableText(...      
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
    'Items',{dbNIRS.study.ID},...
    'Value',Hmain.Tree.SelectedNodes.Name,...
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
	StudyFigure.StudySelector = uiw.widget.FileSelector(...
    'Parent', StudyFigure.MainFigure, ...
    'Value', '/home/pagno/Desktop/dati/demodata.txt', ...
    'Pattern', {'*.mat','MATLAB MAT files (*.mat)'; '*.csv','CSV files (*.csv)'; '*.txt','TXT files (*.txt)'}, ...
    'Callback',@(h,e)disp(e),...
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



%% Button
	    StudyFigure.SaveButton = uicontrol('Style', 'pushbutton',...
		'String', 'Save',...
		'Units', 'normalize', ...
        'Position', [0.8 0.05 0.1 0.04],...
        'Callback', {@SaveDatatoNewMeasureGUI ,StudyFigure});    
	
		StudyFigure.LoadButton = uicontrol('Style', 'pushbutton',...
		'String', 'Load',...
		'Units', 'normalize', ...
        'Position', [0.8 0.15 0.1 0.04],...
        'Callback', {@LoadDatatoNewMeasureGUI ,StudyFigure}); 
	
	StudyFigure.MainFigure.Visible = 'on';
end



%% Auxiliary function
function	LoadDatatoNewMeasureGUI(obj_handle ,~ ,main_handle)

		set(obj_handle, 'Enable', 'off')
		drawnow;
%in futuro inserire un controllo sui vari tipi di estensioni
		if exist(main_handle.StudySelector.Value , 'file')	
			DataNIRS = LoadBOXYdata(main_handle.StudySelector.Value);
 			main_handle.Measure.Date.Value = DataNIRS.measureinfo.date;
			main_handle.Measure.Length.Value = [num2str(DataNIRS.measureinfo.duration),' s'];
			main_handle.Measure.DetectorCH.Value = num2str(DataNIRS.measureinfo.Aqinfo.DetectorChannel);
			main_handle.Measure.AnalogCH.Value = num2str(DataNIRS.measureinfo.Aqinfo.AuxiliaryAnalogChannels);
			
			else
				Error('file not found')
		end
		set(obj_handle, 'Enable', 'on')
end
		

function	SaveDatatoNewMeasureGUI(obj_handle ,~ ,main_handle)
	
		set(obj_handle, 'Enable', 'off')
		drawnow;
		loadNIRSdb
		
		%%per domani 
		set(obj_handle, 'Enable', 'on')
end



































