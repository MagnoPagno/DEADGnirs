function [Hmain] = NIRSTree(Hmain,dbNIRS)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


Hmain.Tree = uiw.widget.Tree(...
    'Parent',Hmain.mainFigure,...
    'Label','Tree:', ...
    'LabelLocation','top',...
    'LabelHeight',18,...
    'Units', 'normalized', ...
    'Position', [0 0 0.2 0.90],...
	'RootVisible', 'false'...
	);%'SelectionType', 'discontiguous'...
	
%	'NodeExpandedCallback',{@ExpandBrach, Hmain},...




%% sistemare solo per prova

	studIcon = fullfile(matlabroot,'toolbox','matlab','icons','pagesicon.gif');
	subjIcon = fullfile(matlabroot,'toolbox','matlab','icons','pageicon.gif');


	for idx = 1:dbNIRS.nStudy
			Hmain.TreeNode(idx).lk = uiw.widget.TreeNode('Name',dbNIRS.Study(idx).Nome,'Parent',Hmain.Tree.Root);
			setIcon(Hmain.TreeNode(idx).lk,studIcon);
			for idy = 1:dbNIRS.Study(idx).nMeasure
				temp = uiw.widget.TreeNode('Name',dbNIRS.Study(idx).Measure(idy).Subject.name ,'Parent',Hmain.TreeNode(idx).lk);
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
% 
% function ExpandBrach (~ ,objselect , MainHandle)
% 	
% % 	for i = 1: length()
% % 		obj_handle.collapseNode;
% % 	end
% 
% end