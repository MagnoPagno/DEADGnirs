function set_time_window_min(~,event,h1,h2)

xmin = str2double(event.Source.String);
if isnan(xmin)
    xmin = 0;
end
if xmin < h1.XLim(2)
    h1.XLim(1) = xmin;
    hrect = findall(h2,'Type','rectangle');
    hrect.Position(3) = h1.XLim(2) - xmin;
    hrect.Position(1) = xmin;
else
    msgbox('Invalid value - min must be smaller than max')
end
