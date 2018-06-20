function Measure = LoadBOXYdata(location,NIRSVariable,speed) 
% Load a BOXY file data 
% Inputs: path of the boxy file adn optional a NIRSMeasure data 

	
	FILE_info = dir(location);

%% Preliminar check on file
	FILE = fopen(location); %try to pen the boxy file
	
	if (FILE == -1)    %check if exist
		Error('file not found')
		Measure = -1;

		
%% Metadata load	
	else
		

		date =  FILE_info.date; %use the date of the file for the measure data 
		Aquisitioninfo = [];
		BOXYdata = [];
		
		frewind(FILE); %back to the begin of the file
		while ~feof(FILE)  % till the end of file 
			currentline = fgetl(FILE); 
			fieldname = erase(currentline(isletter(currentline)),{'FALSE' , 'TRUE'}); %delete all the numbers and special characters from the string
			switch fieldname
				%load information common to all NIRS data
				case 'DetectorChannels' 
					Aquisitioninfo.DetectorChannel = sscanf(currentline, '%f');
			
				case 'ExterrnalMUXChannels'
				Aquisitioninfo.ExternalMUCChannels = sscanf(currentline, '%f');
			
				case 'AuxiliaryAnalogChannels'
					Aquisitioninfo.AuxiliaryAnalogChannels = sscanf(currentline, '%f');
		
				case 'AuxiliaryDigitalChannels'
					Aquisitioninfo.AuxiliaryDigitalChannels = sscanf(currentline, '%f');
		

				case 'WaveformCCFFrequencyHz'
					Aquisitioninfo.CCFFrequency = sscanf(currentline, '%f');

				case 'WaveformsSkipped'
					Aquisitioninfo.WaveformsSkipped = sscanf(currentline, '%f');

				case 'WaveformsAveraged'
					Aquisitioninfo.WaveformsAveraged = sscanf(currentline, '%f');

				case 'CyclesAveraged'
					Aquisitioninfo.CyclesAveraged = sscanf(currentline, '%f');


				case 'AcquisitionsperWaveform'
					Aquisitioninfo.AcquisitionsPerWaveform = sscanf(currentline, '%f');


				case 'UpdateRateHz'
					Aquisitioninfo.UpdateRate = sscanf(currentline, '%f');

				otherwise%load the boxy only info
					if contains(currentline,'FALSE')  
						BOXYdata.(fieldname)=false;
					end
					if contains(currentline,'TRUE')
						BOXYdata.(fieldname)=true;
					end

			end
		end
		
		frewind(FILE); %back to the begin of the file
		currentline = fgetl(FILE); 
		while ~contains(currentline,'#AUX CALIBRATION VALUES') %go to the AUX CAL line
			currentline = fgetl(FILE);  
			if currentline == -1  %if reach the endo of file exit
				break
			end
		end
		Auxcalibration = [];
		currentline = fgetl(FILE);
		RowName = split(erase(currentline,'-'),'	');  % save the row name
		RowName = RowName(~cellfun('isempty',RowName));%remove empty cell 
		while ~contains(currentline,'#')  %till the next settings
			currentline = fgetl(FILE);
			if contains(currentline,'Term') 
				Auxcalibration.Term = sscanf(erase(currentline,'Term'),'%f');
			end
			if contains(currentline,'Factor')
				Auxcalibration.Factor = sscanf(erase(currentline,'Factor'),'%f');
			end
			if currentline == -1
				break
			end
		end
		if ~isempty(Auxcalibration)
			CalibrationInfo.Auxcalibration = struct2table(Auxcalibration,'RowNames',RowName(2:end));
		end
		
		
		frewind(FILE); %back to the begin of the file	
		currentline = fgetl(FILE);
		
		CalibrationInfo.Wfcalibration = struct;
		Wfcal = [];
		
		while ~contains(currentline,'#WF CALIBRATION VALUES') %go to the WGF CAL line
			currentline = fgetl(FILE);  
			if currentline == -1
				break
			end
		end
		currentline = fgetl(FILE);
		
		while ~contains(currentline,'#')
			
			DetectorCHName = currentline(1); %the 1 charaqcter of the line contain the Det Name
			currentline = fgetl(FILE);
			RowName = split(erase(currentline,'-'),'	');  % save the row name
			RowName = RowName(2:end);
			RowName = RowName(~cellfun('isempty',RowName));%remove empty cell 
			while ~contains(currentline,{'Detector Channel','#'}) %till the next detector or settings
				currentline = fgetl(FILE);
				if contains(currentline,'Term')
					Tempstr = split(erase(currentline,'Term'));
					Tempstr = Tempstr(~cellfun('isempty',Tempstr));
					Wfcal.Term = str2double(Tempstr);
				end
				if contains(currentline,'Factor')
					Tempstr = split(erase(currentline,'Factor'));
					Tempstr = Tempstr(~cellfun('isempty',Tempstr));
					Wfcal.Factor = str2double(Tempstr);
				end
				if currentline == -1
					break
				end
			end
			if ~isempty(Wfcal)
				CalibrationInfo.Wfcalibration.(DetectorCHName) = struct2table(Wfcal,'RowNames',RowName);
			end
			
		end
		
		
		frewind(FILE); %back to the begin of the file	
		currentline = fgetl(FILE);

		while ~contains(currentline,'#DISTANCE SETTINGS')
			currentline = fgetl(FILE);  
			if currentline == -1
				break
			end
		end
		currentline = fgetl(FILE);
		
		while ~contains(currentline,'#')
			DetectorCHName = currentline(1);
			currentline = fgetl(FILE);
			RowName = split(erase(currentline,'-'),'	');  % save the row name
			RowName = RowName(~cellfun('isempty',RowName));%remove empty cell 
			while ~contains(currentline,{'Detector Channel','#'})
				currentline = fgetl(FILE);
				if ~(isempty(currentline) || contains(currentline,{'Detector Channel','#'}))
					Tempstr = split(erase(currentline,'Term'));
					Tempstr = Tempstr(~cellfun('isempty',Tempstr));
					Dist = str2double(Tempstr); %save the dist info
				end
				if currentline == -1
					break
				end
			end
			if ~isempty(Dist)
				Distance.(DetectorCHName) = array2table(Dist,'RowNames',RowName);
			end
			
		end
		
		
		
%% Load raw data	
		frewind(FILE); %back to the begin of the file	
		currentline = fgetl(FILE);     %acquisisce linea per linea fino a che incontra i dati
		while ~contains(currentline,'#DATA BEGINS')
			currentline = fgetl(FILE);  
			if currentline == -1
				error('No data in the file')
			end
		end
		
		if speed == 'f'
			fgetl(FILE);
			data = textscan(FILE,'%f %*[^\n]');
			Mdata.time = data{1};
		else
			ColumnName = split(erase(fgetl(FILE),'-'));  % save the column name
			ColumnName = ColumnName(~cellfun('isempty',ColumnName));%remove empty cell 
			data = fscanf(FILE,'%f',[length(ColumnName),Inf]); %parse all row data
			Mdata = array2table(data','VariableNames',ColumnName(1:end));  %save all
		end
		
		
		Duration = Mdata.time(end) - Mdata.time(1); %duration of the intair measure
		Mdata.reltime = Mdata.time - Mdata.time(1); %create the column of relative time 

		
		
		% non funziona nelle versione del 2017
		%Mdata = movevars(Mdata,'reltime','Before','time');
		
		
		%%sampling frequency check
		Aquisitioninfo.fscheck = abs(Aquisitioninfo.UpdateRate-1./mean(diff(Mdata.reltime)))./Aquisitioninfo.UpdateRate; %check if the frequency is correct (inserire una deviazione standard?)
	
%% Save all in a NIRS measure variable
		if isempty(NIRSVariable) %se non sono gia presenti dei dati
			Measure = NIRSMeasure (...
				'measureinfo.date', date, ...
				'measureinfo.duration',Duration, ...
				'measureinfo.Aqinfo', Aquisitioninfo,...
				'measureinfo.otherinfo', BOXYdata,...
				'measureinfo.calibration', CalibrationInfo,...
				'measureinfo.distance', Distance,...
				'data', Mdata);
		else 
		 %se sono gia presentio dei dati
			Measure = NIRSMeasure (NIRSVariable,...
				'measureinfo.date', date, ...
				'measureinfo.duration',Duration, ...
				'measureinfo.Aqinfo', Aquisitioninfo,...
				'measureinfo.otherinfo', BOXYdata,...
				'measureinfo.calibration', CalibrationInfo,...
				'measureinfo.distance', Distance,...
				'data', Mdata);
		end

	end
end	
