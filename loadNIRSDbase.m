function DataBase = loadNIRSDbase()
%	Load the database info of the Nirs Study
%  
	DataBase.Nstudy = 3;
	DataBase.study(1).ID = 'cane';
	DataBase.study(1).Nsubj = 2;
	DataBase.study(1).subj(1).ID = 'carlo';
	DataBase.study(1).subj(2).ID = 'cgfarlo';
	DataBase.study(2).ID = 'gallo';
	DataBase.study(2).Nsubj = 3;
	DataBase.study(2).subj(1).ID = 'lo';
	DataBase.study(2).subj(2).ID = 'rlo';
	DataBase.study(2).subj(3).ID = 'rfflo';
	DataBase.study(3).ID = 'mucca';
	DataBase.study(3).Nsubj = 1;
	DataBase.study(3).subj(1).ID = 'muccoss';
	
end

