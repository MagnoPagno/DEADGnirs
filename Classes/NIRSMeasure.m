 classdef NIRSMeasure
%     This class hold NIRS measure data
% 	Propreties:
%
%		AnalysisID
%
%		MeasureID
% 
%		StudyID
%
% 		Subject	 | NIRS subject data 
% 		
% 		MeaureInfo.date				|date and hour of the measure [datetime]
% 				.duration			|[datetime]
% 				.Aqinfo				| 
% 				.otherinfo			|
% 			    .calibration		|
%	 			.distance			|table of the calibration data
% 
% 		Probe   | NIRS probe data 
% 				
% 		Eventss	
% 				
% 		Data				|table of the data of the measure
% 				
% 		Video				|video of the measure
% 				
% 		Analysis			| applied analysis 
% 
%		Note				| note on the measure 
% 		
				
    
    properties
		
		AnalysisID
		
		MeasureID
		
		StudyID	
		
		Subject

		MeasureInfo = struct('Date', [],...
			'Duration', [],...
			'AqInfo', [],...
			'OtherInfo', [],...
			'Calibration', [],...
			'Distance', [])...


		Probe 

		Eventss 

		Data

		Video 

		Analysis 

		Note
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
						case 'AnalysisID'
							obj.AnalysisID = varargin{i+1};
							
						case 'MeasureID'
							obj.MeasureID = varargin{i+1};	

						case 'StudyID'
							obj.StudyID = varargin{i+1};

						case 'Subject'
							obj.Subject = varargin{i+1};

						case 'MeasureInfo.Date'
							obj.MeasureInfo.Date = varargin{i+1};

						case 'MeasureInfo.Duration'
							obj.MeasureInfo.Duration = varargin{i+1};

						case 'MeasureInfo.AqInfo'
							obj.MeasureInfo.AqInfo = varargin{i+1};

						case 'MeasureInfo.OtherInfo'
							obj.MeasureInfo.OtherInfo = varargin{i+1};

						case 'MeasureInfo.Distance'
							obj.MeasureInfo.Distance = varargin{i+1};
							
						case 'MeasureInfo.Calibration'
							obj.MeasureInfo.Calibration = varargin{i+1};

						case 'Probe'
							obj.Probe = varargin{i+1};

						case 'Eventss'
							obj.Eventss = varargin{i+1};


						case 'Data'
							obj.Data = varargin{i+1};

						case 'Video'
							obj.Video = varargin{i+1};


						case 'Analysis'
							obj.Analysis = varargin{i+1};

						otherwise 
							warning('data not loaded')
										
					end
				end
			end
		end
	end
 end
