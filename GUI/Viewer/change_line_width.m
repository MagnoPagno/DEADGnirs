function change_line_width(hObject, eventData, channelColors, linewidthCurrent, linewidthFactor)

% Change LineWidth in raw_explorer main plot
%
% Written by Matteo Caffini
% CIMeC - Universita' dgli Studi di Trento
% on July, 14th 2017 in Rovereto (TN)
%

all_lines = findall(gca,'Type','line');
colorBackground = [100 100 100]/255;
colorForeground = flipud(channelColors);
n_lines = length(all_lines);

linewidthForeground = linewidthFactor*linewidthCurrent;
linewidthBackground = linewidthCurrent;

if get(hObject, 'Type') == 'line'
    if get(hObject, 'Color') == [100 100 100]/255
        for ii = 1:1:n_lines
            set(all_lines(ii), 'Color', colorForeground(ii,:));
        end
        if get(hObject, 'LineWidth') == linewidthBackground
            colorSelected = get(hObject, 'Color');
            set(all_lines, 'LineWidth', linewidthBackground)
            set(all_lines, 'Color', colorBackground)
            set(hObject, 'LineWidth', linewidthForeground)
            set(hObject, 'Color', colorSelected)
        else
            set(all_lines, 'LineWidth', linewidthBackground)
            for ii = 1:1:n_lines
                set(all_lines(ii), 'Color', colorForeground(ii,:));
            end
        end
    else
        if get(hObject, 'LineWidth') == linewidthBackground
            colorSelected = get(hObject, 'Color');
            set(all_lines, 'LineWidth', linewidthBackground)
            set(all_lines, 'Color', colorBackground)
            set(hObject, 'LineWidth', linewidthForeground)
            set(hObject, 'Color', colorSelected)
        else
            set(all_lines, 'LineWidth', linewidthBackground)
            for ii = 1:1:n_lines
                set(all_lines(ii), 'Color', colorForeground(ii,:));
            end
        end
    end
end
