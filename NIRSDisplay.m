function Hmain = NIRSDisplay(Hmain,dbNIRS);
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
	Hmain.DisplayPannel.nTextColumn = 4;
	Hmain.DisplayPannel.nTextRow = 8;
	Hmain.DisplayPannel.editableField = [4 3; 2 8; 1 5 ]; % caselle che diventano editabili


	Hmain.DisplayPannel.Pannel = uipanel (...
		'Title', '', ...
		'Parent', Hmain.mainFigure,...
		'Units', 'normalized',...
		'Visible', 'off',...
		'Position',[0.21 0.01 0.78 0.88]);
	
%% creo le caselle di testo non editabili	
	
	textHigh = 0.8 / Hmain.DisplayPannel.nTextColumn;
	textWidth = 0.9 / Hmain.DisplayPannel.nTextRow;
	
	for iColumn = 1 : Hmain.DisplayPannel.nTextColumn   
		for iRow = 1 : Hmain.DisplayPannel.nTextRow
			
			xPosition = 0.05 + (1.1)*textHigh*(iColumn-1);
			yPosition = 0.85 - (1.1)*textWidth*(iRow-1);
			
			Hmain.DisplayPannel.TextBox(iColumn, iRow) = uiw.widget.FixedText(...      
				'Parent',Hmain.DisplayPannel.Pannel,...=
				'Value','',...
				'Label','',...
				'Visible','off',...
				'LabelLocation','top',...
				'LabelWidth',90,...
				'Units','normalized',...
				'Position',[xPosition yPosition textHigh, textWidth]);
		end
	end	
	
%% creo le caselle di testo editabili	
		for iColumn = 1 : Hmain.DisplayPannel.nTextColumn   
		for iRow = 1 : Hmain.DisplayPannel.nTextRow
			
			xPosition = 0.05 + (1.1)*textHigh*(iColumn-1);
			yPosition = 0.85 - (1.1)*textWidth*(iRow-1);
			
			Hmain.DisplayPannel.TextBoxEditable(iColumn, iRow) = uiw.widget.EditableText(...      
				'Parent',Hmain.DisplayPannel.Pannel,...=
				'Value','',...
				'Label','',...
				'LabelLocation','top',...
				'Visible','off',...
				'LabelWidth',90,...
				'Units','normalized',...
				'Position',[xPosition yPosition textHigh, textWidth]);
		end
	end	
		



		
	Hmain.DisplayPannel.ToggleButton = uicontrol('Style', 'togglebutton',...
		'String', 'Edit',...
		'Visible','off',...
		'Parent',Hmain.DisplayPannel.Pannel,...
		'Units','normalized',...
		'Position', [0.20 0.20 0.1 0.04],...
		'Callback', {@Edit_Field,Hmain.DisplayPannel});  

	Hmain.DisplayPannel.Axes = axes(...     
		'Parent',Hmain.DisplayPannel.Pannel,...
		'Units','Normalized',...
		'Visible','off',...
		'Position', [0.3, 0.01 0.65 0.6]...
	);


end



function Edit_Field(PushHandle,~,MainHandle)
	nEditableTextBox = size(MainHandle.editableField,1); %n of row of the editable field vector

	if PushHandle.Value == 1
		
		for iEditableTextBox = 1 : nEditableTextBox
			xTable = MainHandle.editableField(iEditableTextBox, 1);
			yTable = MainHandle.editableField(iEditableTextBox, 2);
			set(MainHandle.TextBoxEditable(xTable, yTable),...
				'Visible','on');
			set(MainHandle.TextBox(xTable, yTable),...
				'Visible','off');
		end
	else
		for iEditableTextBox = 1 : nEditableTextBox
			xTable = MainHandle.editableField(iEditableTextBox, 1);
			yTable = MainHandle.editableField(iEditableTextBox, 2);
			set(MainHandle.TextBoxEditable(xTable, yTable),...
				'Visible','off');
			set(MainHandle.TextBox(xTable, yTable),...
				'Visible','on');
		end
	end
	
	drawnow;
end















