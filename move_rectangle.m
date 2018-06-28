function move_rectangle(hObject, eventData, h1, h2, h3, h4)

% Move rectangle in viewer overall plot
%
% Written by Matteo Caffini
% CIMeC - Universita' dgli Studi di Trento
% on June, 27th 2018 in Rovereto (TN)

%hrect = findall(hObject,'Type','rectangle');
h2.Position(1) = eventData.IntersectionPoint(1);
h1.XLim = [eventData.IntersectionPoint(1) eventData.IntersectionPoint(1) + h2.Position(3)];
h3.String = num2str(h2.Position(1));
h4.String = num2str(h1.XLim(2));