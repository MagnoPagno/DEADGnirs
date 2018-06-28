function DataBase = loadNIRSdb(path)
%	
	dbPath = fullfile(path,'NIRSDataBase.mat');
	tempDataBase = load(dbPath,'DataBase'); %load the old database
	DataBase = tempDataBase.DataBase;
end

