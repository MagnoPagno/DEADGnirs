 classdef NIRSProbe
%     This class hold NIRS Subject
% 	Propreties:
% 		name	|	[string]
% 		ID		|	univocal identifier of the subject
%		Pdetect	|	apgar resuts at 1 minute from birth
%		Psource	|	info on channel (like distances between source and probe)
% 		Channel	|	[string] 
% 		
			   
    properties
		name
		ID
		Pdetect   
		Psourc  
		channel
	end
	
	
	methods
		 
		function obj = NIRSProbe(varargin)
			%initialize all possible field of the class
			%NIRSSubject
			% To load a data insert first the name of the field and than
			% the value.
			% ATTENTION there is no check in the data type

			if nargin ~= 0 
				if isa(varargin{1},'NIRSProbe')
					obj = varargin{1};
					varargin(1) = [];
				end
				for i = 1:2:(nargin-1)

					switch varargin{i}		
						case 'name'
							obj.name = varargin{i+1};

						case 'ID'
							obj.ID = varargin{i+1};
						
						case 'Pdetect '
							obj.Pdetect  = varargin{i+1};

						case 'Psourc '
							obj.Psourc  = varargin{i+1};

						case 'channel'
							obj.channel = varargin{i+1};
			
					end
				end
			end
		end
	 end
 end