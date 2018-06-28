 classdef NIRSSubject
%     This class hold NIRS Subject
% 	Propreties:
% 		name	|	[string]
%		sname	|	surname [string]
%  		bdate	|	birthday [datetime]
% 		age		|	age in days [int]
% 		ID		|	univocal identifier of the subject
%		apgar1	|	apgar resuts at 1 minute from birth
%		apgar5	|	apgar resuts at 1 minute from birth
% 		note	|	[string] 
% 		
			
    
    properties
		name
		sname
		bdate
		age
		ID
		apgar1
		apgar5
		note     
	end
	
	
	 methods
		 
		 
		function obj = NIRSSubject(varargin)
			%initialize all possible field of the class
			%NIRSSubject
			% To load a data insert first the name of the field and than
			% the value.
			% ATTENTION there is no check in the data type

			if nargin ~= 0 
				if isa(varargin{1},'NIRSSubject')
					obj = varargin{1};
					varargin(1) = [];
				end
				for i = 1:2:(nargin-1)

					switch varargin{i}		
						case 'name'
							obj.name = varargin{i+1};

						case 'sname'
							obj.sname = varargin{i+1};

						case 'bdate'
							obj.bdate = varargin{i+1};

						case 'age'
							obj.age = varargin{i+1};

						case 'ID'
							obj.ID = varargin{i+1};
						
						case 'apgar1'
							obj.apgar1 = varargin{i+1};

						case 'apgar5'
							obj.apgar5 = varargin{i+1};

						case 'note'
							obj.note = varargin{i+1};
					end
				end
			end
		end
	 end
 end
