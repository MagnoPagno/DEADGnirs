function [Hmain] = NIRSToolbar(Hmain)

	Hmain.Toolbar = uiw.widget.Toolstrip(...
		'Parent',Hmain.mainFigure,... %Normally start with this empty, until later
		'Visible','on',... %Normally start with this 'off'
		'Callback',@(h,e)disp(e.Interaction),...
		'Units','normalized',...
		'Position',[0 0.9 1 0.1]);

	Hmain.Toolbar.addSection('FILES');
	Hmain.Toolbar.addButton('folder_24.png','Folder');
	Hmain.Toolbar.addButton('folder_file_24.png','FolderFile');
	Hmain.Toolbar.addButton('folder_file_open_24.png','FolderFileOpen');
	Hmain.Toolbar.addButton('save_24.png','Save');
	Hmain.Toolbar.addButton('save_all_24.png','SaveAll');
	Hmain.Toolbar.addButton('save_as_24.png','SaveAs');

	Hmain.Toolbar.addSection('ARROWS',4); %Priority=4: lower gets space first
	Hmain.Toolbar.addButton('arrow_down_24.png','Down');
	Hmain.Toolbar.addButton('arrow_left_24.png','Left');
	Hmain.Toolbar.addButton('arrow_right_24.png','Right');
	Hmain.Toolbar.addButton('arrow_up_24.png','Up');

	Hmain.Toolbar.addSection('VISUALIZE',1); %Priority=1: lower gets space first
	Hmain.Toolbar.addButton('play_24.png','Play');
	Hmain.Toolbar.addButton('visualize_24.png','Plot');

	Hmain.Toolbar.addSection('LISTS');
	Hmain.Toolbar.addButton('add_24.png','Add');
	Hmain.Toolbar.addButton('check_24.png','Check');
	Hmain.Toolbar.addButton('close_24.png','Close');
	Hmain.Toolbar.addButton('delete_24.png','Delete');
	Hmain.Toolbar.addButton('edit_24.png','Edit');
	Hmain.Toolbar.addButton('report_24.png','Report');
end

