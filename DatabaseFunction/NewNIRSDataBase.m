function dirFullPath =  NewNIRSDataBase(pathDataBase, pathGnirs)
%Create a new NIRS database and assign it a new ID on the new path

%% Create a new ID
nID = randi(1000000)-1; %creo un  numero compreso tra 0 e 999999
snID = num2str(nID,'%.6d');
ID = ['D', snID]; %create the ID

%% create the directory of DB
dirFullPath = fullfile(pathDataBase , 'NIRSDataBase'); %create the new path

if ~exist(dirFullPath, 'dir') %check if there is nota another one
	mkdir(pathDataBase , 'NIRSDataBase');
else
	error('the database alredy exist')
end

%% initialize the database
DataBase = [];
DataBase.ID = ID;


DataBase.nStudy = 0;
DataBase.nProbe = 0;
DataBase.nAnatomy = 0;

DataBase.nStudyPersistent = 0;  %%don't change after a deletion
DataBase.nProbePersistent = 0;
DataBase.nAnatomyPersistent = 0;

DataBase.Study = [];
DataBase.Probe = [];
DataBase.Anatomy = [];

%% save all

DataBase.Path = dirFullPath;
filefullPath = fullfile(dirFullPath, 'NIRSDataBase');

save(filefullPath,'DataBase');
	

txtPath = fullfile(pathGnirs, 'Path.txt' );
fid = fopen( txtPath, 'wt' );
fprintf( fid, '%s', dirFullPath);
fclose(fid);


end

