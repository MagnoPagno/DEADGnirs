 classdef NIRSMeasure
%     This class hold NIRS measure data
% 	Propreties:
%		
%		measureID
% 
%		studyID
%
% 		subject	 | NIRS subject data 
% 		
% 		meaureinfo.date				|date and hour of the measure [datetime]
% 				.duration			|[datetime]
% 				.Aqinfo				| 
% 				.file_information	|
% 			    .calibration		|
%	 			.distance_settings	|table of the calibration data
% 
% 		probe   | NIRS probe data 
% 				
% 		eventss	.codes		|array of the codes associated to the event 
% 				.labels		|array of string that label the event
% 				.time		|matrix that identify the moment of each stimulus
% 				
% 		data				|table of the data of the measure
% 				
% 		video				|video of the measure
% 				
% 		analysis			| applied analysis 
% 
%		note				| note on the measure 
% 		
				
    
    properties
		
		measureID
		
		studyID	
		
		subject

		measureinfo = struct('date', [],...
			'duration', [],...
			'Aqinfo', [],...
			'otherinfo', [],...
			'calibration', [],...
			'distance_settings', [])...


		probe 

		eventss = struct('colors', [],...
		  'codes', [],...
		  'labels', [])

		data

		video 

		analysis 

note
    end
    
    methods
		function obj = NIRSMeasure(varargin)
			%loadNIRS initialize all possible field of the class NIRSdata
			% To load a data insert first the name of the field and than
			% the value.
			% ATTENTION there is no check in the data type

			if nargin ~= 0 
				if isa(varargin{1},'NIRSMeasure')
					obj = varargin{1};
					varargin(1) = [];
				end
				for i = 1:2:(nargin-1)

					switch varargin{i}		
						case 'measureID'
							obj.subject.name = varargin{i+1};

						case 'studyID'
							obj.subject.sname = varargin{i+1};

						case 'subject'
							obj.subject.bdate = varargin{i+1};

						case 'measureinfo.date'
							obj.measureinfo.date = varargin{i+1};

						case 'measureinfo.duration'
							obj.measureinfo.duration = varargin{i+1};

						case 'measureinfo.Aqinfo'
							obj.measureinfo.Aqinfo = varargin{i+1};

						case 'measureinfo.otherinfo'
							obj.measureinfo.otherinfo = varargin{i+1};

						case 'measureinfo.distance_settings'
							obj.measureinfo.distance_settings = varargin{i+1};
							
						case 'measureinfo.calibration'
							obj.measureinfo.calibration = varargin{i+1};

						case 'probe'
							obj.probe = varargin{i+1};

						case 'eventss.colors'
							obj.eventss.colors = varargin{i+1};

						case 'eventss.codes'
							obj.eventss.codes = varargin{i+1};

						case 'eventss.labels'
							obj.eventss.labels = varargin{i+1};

						case 'data'
							obj.data = varargin{i+1};

						case 'video'
							obj.video = varargin{i+1};


						case 'analysis'
							obj.analysis = varargin{i+1};

						otherwise 
							warning('data not loaded')
										
					end
				end
			end
		end
	end
 end
