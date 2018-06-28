function set_time_window_max(~,event, h1, h2)

xmax = str2double(event.Source.String);
if xmax > h1.XLim(1)
    h1.XLim(2) = xmax;
    hrect = findall(h2,'Type','rectangle');
    hrect.Position(3) = xmax - hrect.Position(1);
else
    msgbox('Invalid value - max must be larger than min')
end