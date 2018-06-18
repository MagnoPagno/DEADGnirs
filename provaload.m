function Measure = provaload(location) 
% Load a BOXY file data and store in the T table  
% Inputs: path of the boxy file
	
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
		while ~feof(FILE) 
			currentline = fgetl(FILE); 
			fieldname = erase(currentline(isletter(currentline)),{'FALSE' , 'TRUE'});
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

				otherwise
					if contains(currentline,'FALSE')
						BOXYdata.(fieldname)=false;
					end
					if contains(currentline,'TRUE')
						BOXYdata.(fieldname)=true;
					end

			end
		end
		

%% Load raw data	
		frewind(FILE); %back to the begin of the file	
		currentline = fgetl(FILE);     %acquisisce linea per linea fino a che incontra i dati
		while ~contains(currentline,'#DATA BEGINS')
			currentline = fgetl(FILE);  
			if currentline == -1
				break
			end
		end

		ColumnName = split(erase(fgetl(FILE),'-'));  % save the column name
		data = fscanf(FILE,'%f',[length(ColumnName)-1,Inf]); %parse all row data

		Mdata = array2table(data','VariableNames',ColumnName(1:end-1));  %save all
	
		Duration = Mdata.time(end) - Mdata.time(1); %ricavo la durata della misura
		
		Mdata.reltime = Mdata.time - Mdata.time(1);
		Mdata = movevars(Mdata,'reltime','Before','time');
	
%% Save all in a NIRS measure variable

		Measure = NIRSMeasure (...
			'measureinfo.date', date, ...
			'measureinfo.duration',Duration, ...
			'measureinfo.Aqinfo', Aquisitioninfo,...
			'measureinfo.otherinfo', BOXYdata,...
			'data', Mdata);
			
	end
end	
