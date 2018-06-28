function set_time_window(~,event,h)

xmin = h.XLim(1);
xmax = h.XLim(2);
slidermin = event.Source.Min;
slidermax = event.Source.Max;
sliderstep = event.Source.SliderStep;
h.XLim(1) = xmin;