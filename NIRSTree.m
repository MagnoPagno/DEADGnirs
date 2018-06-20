function [Hmain] = NIRSTree(Hmain,dbNIRS)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


Hmain.Tree = uiw.widget.Tree(...
    'Parent',Hmain.mainFigure,...
    'SelectionChangeFcn',@ExpandBrach,...
    'Label','Tree:', ...
    'LabelLocation','top',...
    'LabelHeight',18,...
    'Units', 'normalized', ...
    'Position', [0 0 0.2 0.90],...
	'RootVisible', 'false'...
	);%'SelectionType', 'discontiguous'...
	




%% sistemare solo per prova

	studIcon = fullfile(matlabroot,'toolbox','matlab','icons','pagesicon.gif');
	subjIcon = fullfile(matlabroot,'toolbox','matlab','icons','pageicon.gif');


	for idx = 1:dbNIRS.Nstudy
			tresty(idx).lk = uiw.widget.TreeNode('Name',dbNIRS.study(idx).ID,'Parent',Hmain.Tree.Root);
			setIcon(tresty(idx).lk,studIcon);
			for idy = 1:dbNIRS.study(idx).Nsubj
				temp = uiw.widget.TreeNode('Name',dbNIRS.study(idx).subj(idy).ID ,'Parent',tresty(idx).lk);
				setIcon(temp,subjIcon);
			end
	end
	
%% clk sx for new study 	
	% For the whole tree
	treeContextMenu = uicontextmenu('Parent',Hmain.mainFigure);
	uimenu(treeContextMenu,'Label','AddStudy','callback',{@NewNIRSStudy ,Hmain,dbNIRS});
	uimenu(treeContextMenu,'Label','AddMeasure','callback',{@NewNIRSMeasure ,Hmain,dbNIRS});
	set(Hmain.Tree,'UIContextMenu',treeContextMenu)


end

%% Auxyliary function

function ExpandBrach (obj_handle ,objselect )
	for i = 1:length(obj_handle.Root.Children)
		obj_handle.collapseNode(obj_handle.Root.Children(i));
	end
	drawnow;
	objselect.Nodes.expand();


end