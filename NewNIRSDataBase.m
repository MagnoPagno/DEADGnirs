function NewNIRSDataBase(path)
%Create a new NIRS database and assign it a new ID on the new path

%% Create a new ID
nID = randi(1000000)-1; %creo un  numero compreso tra 0 e 999999
snID = num2str(nID);
ID = ['D', snID]; %create yhe ID

%% create the directory of DB
dirFullPath = fullfile(path , 'NIRSDataBase'); %create the new path

if ~exist(dirFullPath, 'dir') %check if there is nota another one
	mkdir(path , 'NIRSDataBase');
else
	error('the database alredy exist')
end

%% initialize the database
DataBase = [];
DataBase.ID = ID;

DataBase.nStudy = 0;
DataBase.nProbe = 0;
DataBase.nAnatomy = 0;

DataBase.Study = [];
DataBase.Probe = [];
DataBase.Anatomy = [];

%% save all
filefullPath = fullfile(dirFullPath, 'DBnirs');
save(filefullPath,'DataBase');
	



end

