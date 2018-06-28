close all
clear all
f=figure ;


t = uicontrol(f,'Style','text',...
'String','Select a data set.',...
'Position',[30 50 100 10]);
t.ForegroundColor = [1 0 0 ];
t.BackgroundColor = [0 0 0 ];
t.HorizontalAlignment = 'left';


for ii = 1:1:10
t.String = [repmat(char(9608),[1 ii]) repmat(' ',[1 10-ii])];
pause(0.2)
end
