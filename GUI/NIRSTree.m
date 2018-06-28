function [Hmain] = NIRSTree(Hmain,NirsDataBase)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


	Hmain.Tree.Main = uiw.widget.Tree(...
		'Parent',Hmain.mainFigure,...
		'Label','Database:', ...
		'LabelLocation','top',...
		'LabelHeight',18,...
		'Units', 'normalized', ...
		'Position', [0 0 0.2 0.90],...
		'RootVisible', 'false'...
		);





	studyIcon = fullfile(matlabroot,'toolbox','matlab','icons','pagesicon.gif');
	measureIcon = fullfile(matlabroot,'toolbox','matlab','icons','pageicon.gif');


	for iStudy = 1:NirsDataBase.nStudy
		
			Hmain.Tree.StudyNode(iStudy).MainNode = uiw.widget.TreeNode(...
				'Name', NirsDataBase.Study(iStudy).Nome,...
				'Parent', Hmain.Tree.Main.Root,...
				'Value', NirsDataBase.Study(iStudy).ID...
				); %create a node for each study
			
			setIcon(Hmain.Tree.StudyNode(iStudy).MainNode,studyIcon);  %set his icon
			
			Hmain.Tree.StudyNode(iStudy).ContextMenu = uicontextmenu('Parent',Hmain.mainFigure); % add the new measure right click
			uimenu(Hmain.Tree.StudyNode(iStudy).ContextMenu,'Label','AddMeasure','callback',{@NewNIRSMeasure ,Hmain,NirsDataBase});
			set(Hmain.Tree.StudyNode(iStudy).MainNode,'UIContextMenu',Hmain.Tree.StudyNode(iStudy).ContextMenu);
			
			for iMeasure = 1:NirsDataBase.Study(iStudy).nMeasure %for each measure in the study create a new branch
				
				Hmain.Tree.StudyNode(iStudy).Measures(iMeasure).MainNode = uiw.widget.TreeNode(... 
				'Name',NirsDataBase.Study(iStudy).Measure(iMeasure).Subject.name ,...
				'Value', NirsDataBase.Study(iStudy).Measure(iMeasure).ID,...
				'Parent',Hmain.Tree.StudyNode(iStudy).MainNode...
			);
			
 				setIcon(Hmain.Tree.StudyNode(iStudy).Measures(iMeasure).MainNode,measureIcon);%add the measure icon
				
				for iAnalysis = 1:(NirsDataBase.Study(iStudy).Measure(iMeasure).nAnalysis + 1) %for each analysis plus the row one in the measure create a new branch
					Hmain.Tree.StudyNode(iStudy).Measures(iMeasure).Analysis(iAnalysis).MainNode = uiw.widget.TreeNode(... 
					'Name',NirsDataBase.Study(iStudy).Measure(iMeasure).Analysis(iAnalysis).ID ,...
					'Value',NirsDataBase.Study(iStudy).Measure(iMeasure).Analysis(iAnalysis).ID ,...
					'Parent',Hmain.Tree.StudyNode(iStudy).Measures(iMeasure).MainNode);
				end
			
			end
	end
	
%% clk sx for new study 	
	% For the whole tree
	
	
	Hmain.Tree.ContextMenu = uicontextmenu('Parent',Hmain.mainFigure); 
	uimenu(Hmain.Tree.ContextMenu,'Label','AddStudy','callback',{@NewNIRSStudy ,Hmain,NirsDataBase});
	set(Hmain.Tree.Main,'UIContextMenu',Hmain.Tree.ContextMenu)
	

	Hmain.Tree.Main.MouseClickedCallback = {@clickcallback,Hmain,NirsDataBase};

end



function clickcallback(Handle, Event, MainHandle ,NirsDataBase)
	if ~isempty(Event.Nodes) % click on a node
		switch Event.Nodes.Value(end-3) %position of the identifier of the IDtype
			case 'S'%study
				switch Event.SelectionType
					case 'normal'
						displaystudy(MainHandle.DisplayPannel,NirsDataBase);
					case 'open'
						%'doublestudy
					case 'alt'
						%'dxstudy
				end
			case 'M' %measure
				switch Event.SelectionType
					case 'normal'
						displaymeasure(MainHandle.DisplayPannel,NirsDataBase);
					case 'open'
						%sprintf('doublemeasure')
					case 'alt'
						%sprintf('dxmeasure')
				end
			case 'A'%Analysis
				switch Event.SelectionType
					case 'normal'
						displayanalysis(MainHandle.DisplayPannel,NirsDataBase);
					case 'open'
						openanalysiswiewer(Event.Nodes.Value, MainHandle.dataBasePath);
					case 'alt'
						%sprintf('dxAnalysis')
				end
			case 'P' %probe
				switch Event.SelectionType
					case 'normal'
						displayprobe(MainHandle.DisplayPannel,NirsDataBase)
					case 'open'
						openanprobewiewer()
					case 'alt'
						%sprintf('dxmprobe')
				end
			case 'G' %group
				switch Event.SelectionType
					case 'normal'
						displaygoup(MainHandle.DisplayPannel,NirsDataBase)
					case 'open'
						%sprintf('doublegroup')
					case 'alt'
						%sprintf('dxgroup')
				end
			case 'Z' %anatomy
				switch Event.SelectionType
					case 'normal'
						displayanatomy(MainHandle.DisplayPannel,NirsDataBase)
					case 'open'
						%sprintf('doubleanatomy')
					case 'alt'
						%sprintf('dxanatomy')
				end
			otherwise
				% check
			
				
		end
	end
end



%% function for display in the window

function displaystudy(PreViwerHandle, NirsDataBase)
	PreViwerHandle
end

function displaymeasure(PreViwerHandle)

end

function displayanalysis(PreViwerHandle)
	
end

function displayprobe(~)
	
end

function displaygoup(~)

end

function displayanatomy(~)
	
end


%% function for open a new window


function openanalysiswiewer(analysisId, dataBasePath)
	% dataBaseId = analysisId(1:7);
	studyId = analysisId(1:11);
	measureid = analysisId(1:15);
	analysisPath = fullfile(dataBasePath, studyId, measureid, analysisId(16:19));
	data = load(analysisPath);
	viewer(data.DataNIRS);
end

function openanprobewiewer()
end














