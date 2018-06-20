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



%% Button

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
			DataNIRS = LoadBOXYdata(main_handle.StudySelector.Value, [], [] );
 			main_handle.Measure.Date.Value = DataNIRS.measureinfo.date;
			main_handle.Measure.Length.Value = [num2str(DataNIRS.measureinfo.duration),' s'];
			main_handle.Measure.DetectorCH.Value = num2str(DataNIRS.measureinfo.Aqinfo.DetectorChannel);
			main_handle.Measure.AnalogCH.Value = num2str(DataNIRS.measureinfo.Aqinfo.AuxiliaryAnalogChannels);
			
			else
				Error('file not found')
		end
		set(obj_handle, 'Enable', 'on')
end
		


function	FastLoadDatatoNewMeasureGUI(obj_handle ,event ,main_handle)

		set(obj_handle, 'Enable', 'off')
		drawnow;
		if exist(event.NewValue , 'file')	
			DataNIRS = LoadBOXYdata( event.NewValue,[], 'f');
 			main_handle.Measure.Date.Value = DataNIRS.measureinfo.date;
			main_handle.Measure.Length.Value = [num2str(DataNIRS.measureinfo.duration),' s'];
			main_handle.Measure.DetectorCH.Value = num2str(DataNIRS.measureinfo.Aqinfo.DetectorChannel);
			main_handle.Measure.AnalogCH.Value = num2str(DataNIRS.measureinfo.Aqinfo.AuxiliaryAnalogChannels);
			
			else
				Error('file not found')
		end
		set(obj_handle, 'Enable', 'on')
end





% % function	FastLoadDatatoNewMeasureGUI(obj_handle ,event ,main_handle)
% % 
% % 		set(obj_handle, 'Enable', 'off')
% % 		drawnow;
% % 		if exist(event.NewValue , 'file')	
% % % 			
% % % 			date =  FILE_info.date; %use the date of the file for the measure data 
% % % 			Aquisitioninfo = [];
% % % 			BOXYdata = [];
% % % 			%% load al the metadata( display only few)
% % % 			frewind(FILE); %back to the begin of the file
% % % 			while ~feof(FILE)  % till the end of file 
% % % 				currentline = fgetl(FILE); 
% % % 				fieldname = erase(currentline(isletter(currentline)),{'FALSE' , 'TRUE'}); %delete all the numbers and special characters from the string
% % % 				switch fieldname
% % % 					%load information common to all NIRS data
% % % 					case 'DetectorChannels' 
% % % 						Aquisitioninfo.DetectorChannel = sscanf(currentline, '%f');
% % % 
% % % 					case 'ExterrnalMUXChannels'
% % % 					Aquisitioninfo.ExternalMUCChannels = sscanf(currentline, '%f');
% % % 
% % % 					case 'AuxiliaryAnalogChannels'
% % % 						Aquisitioninfo.AuxiliaryAnalogChannels = sscanf(currentline, '%f');
% % % 
% % % 					case 'AuxiliaryDigitalChannels'
% % % 						Aquisitioninfo.AuxiliaryDigitalChannels = sscanf(currentline, '%f');
% % % 
% % % 
% % % 					case 'WaveformCCFFrequencyHz'
% % % 						Aquisitioninfo.CCFFrequency = sscanf(currentline, '%f');
% % % 
% % % 					case 'WaveformsSkipped'
% % % 						Aquisitioninfo.WaveformsSkipped = sscanf(currentline, '%f');
% % % 
% % % 					case 'WaveformsAveraged'
% % % 						Aquisitioninfo.WaveformsAveraged = sscanf(currentline, '%f');
% % % 
% % % 					case 'CyclesAveraged'
% % % 						Aquisitioninfo.CyclesAveraged = sscanf(currentline, '%f');
% % % 
% % % 
% % % 					case 'AcquisitionsperWaveform'
% % % 						Aquisitioninfo.AcquisitionsPerWaveform = sscanf(currentline, '%f');
% % % 
% % % 
% % % 					case 'UpdateRateHz'
% % % 						Aquisitioninfo.UpdateRate = sscanf(currentline, '%f');
% % % 
% % % 					otherwise%load the boxy only info
% % % 						if contains(currentline,'FALSE')  
% % % 							BOXYdata.(fieldname)=false;
% % % 						end
% % % 						if contains(currentline,'TRUE')
% % % 							BOXYdata.(fieldname)=true;
% % % 						end
% % % 
% % % 				end
% % % 			end
% % % 
% % % 			frewind(FILE); %back to the begin of the file
% % % 			currentline = fgetl(FILE); 
% % % 			while ~contains(currentline,'#AUX CALIBRATION VALUES') %go to the AUX CAL line
% % % 				currentline = fgetl(FILE);  
% % % 				if currentline == -1  %if reach the endo of file exit
% % % 					break
% % % 				end
% % % 			end
% % % 			Auxcalibration = [];
% % % 			currentline = fgetl(FILE);
% % % 			RowName = split(erase(currentline,'-'),'	');  % save the row name
% % % 			RowName = RowName(~cellfun('isempty',RowName));%remove empty cell 
% % % 			while ~contains(currentline,'#')  %till the next settings
% % % 				currentline = fgetl(FILE);
% % % 				if contains(currentline,'Term') 
% % % 					Auxcalibration.Term = sscanf(erase(currentline,'Term'),'%f');
% % % 				end
% % % 				if contains(currentline,'Factor')
% % % 					Auxcalibration.Factor = sscanf(erase(currentline,'Factor'),'%f');
% % % 				end
% % % 				if currentline == -1
% % % 					break
% % % 				end
% % % 			end
% % % 			if ~isempty(Auxcalibration)
% % % 				CalibrationInfo.Auxcalibration = struct2table(Auxcalibration,'RowNames',RowName(2:end));
% % % 			end
% % % 
% % % 
% % % 			frewind(FILE); %back to the begin of the file	
% % % 			currentline = fgetl(FILE);
% % % 
% % % 			CalibrationInfo.Wfcalibration = struct;
% % % 			Wfcal = [];
% % % 
% % % 			while ~contains(currentline,'#WF CALIBRATION VALUES') %go to the WGF CAL line
% % % 				currentline = fgetl(FILE);  
% % % 				if currentline == -1
% % % 					break
% % % 				end
% % % 			end
% % % 			currentline = fgetl(FILE);
% % % 
% % % 			while ~contains(currentline,'#')
% % % 
% % % 				DetectorCHName = currentline(1); %the 1 charaqcter of the line contain the Det Name
% % % 				currentline = fgetl(FILE);
% % % 				RowName = split(erase(currentline,'-'),'	');  % save the row name
% % % 				RowName = RowName(2:end);
% % % 				RowName = RowName(~cellfun('isempty',RowName));%remove empty cell 
% % % 				while ~contains(currentline,{'Detector Channel','#'}) %till the next detector or settings
% % % 					currentline = fgetl(FILE);
% % % 					if contains(currentline,'Term')
% % % 						Tempstr = split(erase(currentline,'Term'));
% % % 						Tempstr = Tempstr(~cellfun('isempty',Tempstr));
% % % 						Wfcal.Term = str2double(Tempstr);
% % % 					end
% % % 					if contains(currentline,'Factor')
% % % 						Tempstr = split(erase(currentline,'Factor'));
% % % 						Tempstr = Tempstr(~cellfun('isempty',Tempstr));
% % % 						Wfcal.Factor = str2double(Tempstr);
% % % 					end
% % % 					if currentline == -1
% % % 						break
% % % 					end
% % % 				end
% % % 				if ~isempty(Wfcal)
% % % 					CalibrationInfo.Wfcalibration.(DetectorCHName) = struct2table(Wfcal,'RowNames',RowName);
% % % 				end
% % % 
% % % 			end
% % % 
% % % 
% % % 			frewind(FILE); %back to the begin of the file	
% % % 			currentline = fgetl(FILE);
% % % 
% % % 			while ~contains(currentline,'#DISTANCE SETTINGS')
% % % 				currentline = fgetl(FILE);  
% % % 				if currentline == -1
% % % 					break
% % % 				end
% % % 			end
% % % 			currentline = fgetl(FILE);
% % % 
% % % 			while ~contains(currentline,'#')
% % % 				DetectorCHName = currentline(1);
% % % 				currentline = fgetl(FILE);
% % % 				RowName = split(erase(currentline,'-'),'	');  % save the row name
% % % 				RowName = RowName(~cellfun('isempty',RowName));%remove empty cell 
% % % 				while ~contains(currentline,{'Detector Channel','#'})
% % % 					currentline = fgetl(FILE);
% % % 					if ~(isempty(currentline) || contains(currentline,{'Detector Channel','#'}))
% % % 						Tempstr = split(erase(currentline,'Term'));
% % % 						Tempstr = Tempstr(~cellfun('isempty',Tempstr));
% % % 						Dist = str2double(Tempstr); %save the dist info
% % % 					end
% % % 					if currentline == -1
% % % 						break
% % % 					end
% % % 				end
% % % 				if ~isempty(Dist)
% % % 					Distance.(DetectorCHName) = array2table(Dist,'RowNames',RowName);
% % % 				end
% % % 
% % % 			end
% % % 		
% % % 			
% % % 		%load time info	 
% % % 			frewind(FILE); %back to the begin of the file	
% % % 			currentline = fgetl(FILE);     %acquisisce linea per linea fino a che incontra i dati
% % % 			while ~contains(currentline,'#DATA BEGINS')
% % % 				currentline = fgetl(FILE);  
% % % 				if currentline == -1
% % % 					error('No data in the file')
% % % 				end
% % % 			end
% % % 			
% % % 			
% % % 			
% % % 			Duration = 4
% % %% Save all in a NIRS measure variable
% % % 		
% % % 			DataNIRS = NIRSMeasure (...
% % % 				'measureinfo.date', date, ...
% % % 				'measureinfo.duration',Duration, ...
% % % 				'measureinfo.Aqinfo', Aquisitioninfo,...
% % % 				'measureinfo.otherinfo', BOXYdata,...
% % % 				'measureinfo.calibration', CalibrationInfo,...
% % % 				'measureinfo.distance', Distance);
% % 			
% %  			main_handle.Measure.Date.Value = DataNIRS.measureinfo.date;
% % 			main_handle.Measure.Length.Value = [num2str(DataNIRS.measureinfo.duration),' s'];
% % 			main_handle.Measure.DetectorCH.Value = num2str(DataNIRS.measureinfo.Aqinfo.DetectorChannel);
% % 			main_handle.Measure.AnalogCH.Value = num2str(DataNIRS.measureinfo.Aqinfo.AuxiliaryAnalogChannels);
% % 			
% % 			else
% % 				Error('file not found')
% % 		end
% % 		set(obj_handle, 'Enable', 'on')
% % end
% % 
% % 
% % 
% % 
% % 	
% % 
% % 
% % 
