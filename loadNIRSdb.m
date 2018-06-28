function DataBase = loadNIRSdb()
%	solo di prova
	path = '/home/pagno/Desktop/MyProg/proca/NIRSDataBase';
	dbPath = fullfile(path,'NIRSDataBase.mat');
	tempDataBase = load(dbPath,'DataBase'); %load the old database
	DataBase = tempDataBase.DataBase;
end

