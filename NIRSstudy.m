classdef NIRSstudy
%     This class hold NIRS study data
% 	Propreties:
% 		name		| [string]
% 		label		| univocal identifier of the subject
%		Nsubject	| Number of subject of the study
%		NGroAna		| Number of group analysis
% 		note		| [string] 
% 		
% 		measure .datefirst  |
%				.datelast	|
%				.probename	|
% 		
% 		Ganalysis	.operation	|
%					.datefirst	|
%				    .datelast	|



	properties
		name
		label
		Nsubject
		Ngroups
		note
		
		measure = struct('datefirst', [],... 
		   'datelast', [],...
		   'probename', [],...
		   'note', [])
		
		analysis = struct('operation', [],...
			'datefirst', [],... 
		    'datelast', [],...
		    'note', [])
		
					
	end

	

end
