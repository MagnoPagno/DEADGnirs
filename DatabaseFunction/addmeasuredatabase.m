function DataBase = addmeasuredatabase(DataNIRSMeasure,DataBasePath)
		nsamples = 500; % n of samples af the light data for the db
		datatolightsave = 'DC'; %save only DC component in the database add 'ph' o AC for other component
		
		
		
		%% load database
		DataBase = loadNIRSdb(DataBasePath);
	
		

		%% create a new ID 
		
		selectedStudyIdx = contains({DataBase.Study(:).ID},DataNIRSMeasure.StudyID);
		SelectedStudy = DataBase.Study(selectedStudyIdx);
		
		
		newID = num2str(SelectedStudy.nMeasurePersistent,'%.3d');
		DataNIRSMeasure.MeasureID = [SelectedStudy.ID, 'M', newID ]; 
		DataNIRSMeasure.AnalysisID = [DataNIRSMeasure.MeasureID, 'A000']; 
		
		
		DataBase.Study(selectedStudyIdx).nMeasure = SelectedStudy.nMeasure + 1;
		DataBase.Study(selectedStudyIdx).nMeasurePersistent = SelectedStudy.nMeasurePersistent + 1;
		
				
		
		%% update database
		measIdx = DataBase.Study(selectedStudyIdx).nMeasure;

		DataBase.Study(selectedStudyIdx).Measure(measIdx).ID = DataNIRSMeasure.MeasureID;
		DataBase.Study(selectedStudyIdx).Measure(measIdx).Date = DataNIRSMeasure.MeasureInfo.Date;
		DataBase.Study(selectedStudyIdx).Measure(measIdx).Duration = DataNIRSMeasure.MeasureInfo.Duration;
		DataBase.Study(selectedStudyIdx).Measure(measIdx).Subject = DataNIRSMeasure.Subject;
		DataBase.Study(selectedStudyIdx).Measure(measIdx).Probe = DataNIRSMeasure.Probe;
		DataBase.Study(selectedStudyIdx).Measure(measIdx).nAnalysis = 0;
		DataBase.Study(selectedStudyIdx).Measure(measIdx).nAnalysisPersistent = 0;
		DataBase.Study(selectedStudyIdx).Measure(measIdx).note = DataNIRSMeasure.Note;

		DataBase.Study(selectedStudyIdx).Measure(measIdx).Analysis(1).ID = DataNIRSMeasure.AnalysisID;
		DataBase.Study(selectedStudyIdx).Measure(measIdx).Analysis(1).note = '';
		DataBase.Study(selectedStudyIdx).Measure(measIdx).Analysis(1).analysis = 'row';

		columnName = DataNIRSMeasure.Data.Properties.VariableNames; %obtain al the column name in order to select the DC ones
		dcIdx = contains(columnName,datatolightsave);   %obtain the selected column

		selectedIndex = floor(linspace(1,length(DataNIRSMeasure.Data{:,1}),nsamples));

		lightdata = [ table(DataNIRSMeasure.Data.reltime(selectedIndex),'VariableNames', {'reltime'}), DataNIRSMeasure.Data(selectedIndex,dcIdx)];


		DataBase.Study(selectedStudyIdx).Measure(measIdx).Analysis(1).Ldata = lightdata;


		saveDBPath = fullfile(DataBasePath ,'NIRSDataBase.mat');
		save(saveDBPath,'DataBase');
		
		
		
		%% save the measure
		measurePath = fullfile(DataBasePath, SelectedStudy.ID, DataNIRSMeasure.MeasureID);
		mkdir(measurePath);
		filepath = fullfile(measurePath, DataNIRSMeasure.AnalysisID);
		save(filepath,'DataNIRSMeasure');	
end

