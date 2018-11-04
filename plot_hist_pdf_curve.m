% plot_hist_pdf_curve.m
% Plot the normalized pdf curve of a given data


% Colour (light version compared to 'r','g','b')
% (green)[.2 .71 .3]
% (dark blue)[.25 .55 .79]
% dark red [.9 .1 .14]
% orange [1 0.5 0]
colour_array = {[.9 .1 .14],[1 0.5 0],[.25 .55 .79],[.2 .71 .3]};
for i =1:1:4
    colour = cell2mat(colour_array(i));
    data = randn(100,1);
    figure(12);
    h = histogram(data,'Normalization','probability','FaceColor','none','edgecolor',colour);hold on;
    h.LineWidth=1.5;
    h.BinWidth=1;

%     value = smooth(h.Values);		% height of the bar
    value = h.Values;		% height of the bar
    w = h.BinWidth;				% width of the bar
    range = h.BinLimits;		% [startX endX]
    % Use the mid point of the bar
    figure(11);
    if(colour == [.2 .71 .3])
        plot(range(1)+w/2:w:range(2)-w/2,value,'color','g');hold on;
        h.BinEdges=h.BinEdges-0.025;
    elseif(colour == [.25 .55 .79])
        plot(range(1)+w/2:w:range(2)-w/2,value,'color','b');hold on;
        h.BinEdges=h.BinEdges+0.05;
    elseif(colour == [.9 .1 .14])
        plot(range(1)+w/2:w:range(2)-w/2,value,'color','r');hold on;
        h.BinEdges=h.BinEdges+0.025;
    elseif(colour == [1 0.5 0])
        plot(range(1)+w/2:w:range(2)-w/2,value,'color',[0.9100 0.4100 0.1700]);hold on;
    end
end