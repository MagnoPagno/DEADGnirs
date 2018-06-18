function [] = printDB(DB, location, name)
%SAVEDB Summary of this function goes here
%   Detailed explanation goes her
    path = fullfile(location, name);
    
	
    if exist(path, 'file') == 2
        fd = fopen(path);
        warning('esiste gia e lo sovascrivo') ;%sostituire con finestra warning
    
    else
        fd = fopen(path); 
    end
    
    fprintf(fd, 'Database of Gnirs\n\n');  %plot the title
    fprintf(fd, datestr(now,'mmmm dd, yyyy HH:MM:SS'));  %plot the current date
    
    if isfield(DB,'Nstudy')
        fprintf(fd, 'N. of study in the database\n%d\n\n',DB.Nstudy);
    else 
        warning('No study present in Database')
    end
   
    if isfield(DB,'Nprobe')
        fprintf(fd, 'N. of probe in the database\n%d\n\n',DB.Nprobe);
    else 
        warning('No probe present in Database')
    end
    
    fprintf('#List of the study present in the database');
    if isfield(DB,'study')
        fprintf(fd, 'StudyID\t');
    else 
        warning('No study present in Database')
    end

end