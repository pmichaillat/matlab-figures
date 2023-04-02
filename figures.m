%% figures.m
% 
% Produce scientific figures
%
%% Description
%
% This script produces a collection of scientific figure that carefully follow data vizualization best practices.
%
%% Output
%
% * basic.pdf – Figure with basic time series
% * periods.pdf – Figure with basic time series and shaded periods
% * qualitative.pdf – Figure with several qualitatively different time series
% * qualitative_variant.pdf – Same figure as qualitative.pdf, with different line styles
% * sequential.pdf – Figure with several quantitatively different time series
% * sequential_variant.pdf – Same figure as sequential.pdf, with different colors
% * above_below.pdf – Figure with colored areas to indicate that a time series is below or above a target
% * higher_lower.pdf – Figure with two time series and colored areas to indicate that a time series is higher or lower than the other
% * scatter.pdf – Figure with basic scatter plot
% * scatter_transparent.pdf – Figure with scatter plot of transparent dots
% * scatter_connected.pdf – Figure with scatter plot of connected dots
% * scatter_above_below.pdf – Figure with a scatter plot and different dot colors to indicate that the observations are above or below a treshold
%

%% Clear workspace

close all
clear
clc

%% Set default properties for 4:3 figure

figureWidth = 8.5;
figureHeight = 6.375;
set(groot, 'defaultFigureUnits', 'inches')
set(groot, 'defaultFigurePosition', [1,1,figureWidth,figureHeight]);
set(groot, 'defaultFigurePaperPosition', [0, 0, figureWidth,figureHeight]);
set(groot, 'defaultFigurePaperSize', [figureWidth,figureHeight]);

%% Set default properties for axes

set(groot, 'defaultAxesFontName', 'Helvetica')
set(groot, 'defaultAxesFontSize', 24)
set(groot, 'defaultAxesLabelFontSizeMultiplier', 1)
set(groot, 'defaultAxesTitleFontSizeMultiplier', 1)
set(groot, 'defaultAxesTitleFontWeight', 'normal')
set(groot, 'defaultAxesXColor', 'k')
set(groot, 'defaultAxesYColor', 'k')
set(groot, 'defaultAxesGridColor', 'k')
set(groot, 'defaultAxesLineWidth', 1)
set(groot, 'defaultAxesYGrid', 'on')
set(groot, 'defaultAxesXGrid', 'off')
set(groot, 'defaultAxesTickDirMode', 'manual')
set(groot, 'defaultAxesTickDir', 'out')
set(groot, 'defaultAxesTickLength',[0.005, 0.005])
set(groot, 'defaultAxesBox','off')

%% Predefine qualitative color palettes

% Dark colors

darkPalette = ['#1b9e77';'#d95f02';'#7570b3';'#e7298a';'#66a61e';'#e6ab02';'#a6761d';'#666666'];

greenColor = darkPalette(1,:);
orangeColor = darkPalette(2,:);
purpleColor = darkPalette(3,:);
pinkColor = darkPalette(4,:);
appleColor = darkPalette(5,:);
yellowColor = darkPalette(6,:);
brownColor = darkPalette(7,:);
grayColor = darkPalette(8,:);

% Paired colors

pairedPalette = ['#a6cee3';'#1f78b4';'#b2df8a';'#33a02c';'#fb9a99';'#e31a1c';'#fdbf6f';'#ff7f00';'#cab2d6';'#6a3d9a';'#ffff99';'#b15928'];

blueLight = pairedPalette(1,:);
blueDark = pairedPalette(2,:);
greenLight = pairedPalette(3,:);
greenDark = pairedPalette(4,:);
redLight = pairedPalette(5,:);
redDark = pairedPalette(6,:);
orangeLight = pairedPalette(7,:);
orangeDark = pairedPalette(8,:);
purpleLight = pairedPalette(9,:);
purpleDark = pairedPalette(10,:);
yellowLight = pairedPalette(11,:);
yellowDark = pairedPalette(12,:);

%% Predefine sequential color palettes

% Orange

orangePalette = ['#fff5eb';'#fee6ce';'#fdd0a2';'#fdae6b';'#fd8d3c';'#f16913';'#d94801';'#a63603';'#7f2704'];

orange1 = orangePalette(1,:);
orange2 = orangePalette(2,:);
orange3 = orangePalette(3,:);
orange4 = orangePalette(4,:);
orange5 = orangePalette(5,:);
orange6 = orangePalette(6,:);
orange7 = orangePalette(7,:);
orange8 = orangePalette(8,:);

% Blue

bluePalette = ['#f7fbff';'#deebf7';'#c6dbef';'#9ecae1';'#6baed6';'#4292c6';'#2171b5';'#08519c';'#08306b'];

blue1 = bluePalette(1,:);
blue2 = bluePalette(2,:);
blue3 = bluePalette(3,:);
blue4 = bluePalette(4,:);
blue5 = bluePalette(5,:);
blue6 = bluePalette(6,:);
blue7 = bluePalette(7,:);
blue8 = bluePalette(8,:);

% Purple

purplePalette = ['#fcfbfd';'#efedf5';'#dadaeb';'#bcbddc';'#9e9ac8';'#807dba';'#6a51a3';'#54278f';'#3f007d'];

purple1 = purplePalette(1,:);
purple2 = purplePalette(2,:);
purple3 = purplePalette(3,:);
purple4 = purplePalette(4,:);
purple5 = purplePalette(5,:);
purple6 = purplePalette(6,:);
purple7 = purplePalette(7,:);
purple8 = purplePalette(8,:);

% Gray

grayPalette = ['#ffffff';'#f0f0f0';'#d9d9d9';'#bdbdbd';'#969696';'#737373';'#525252';'#252525';'#000000'];

gray1 = grayPalette(1,:);
gray2 = grayPalette(2,:);
gray3 = grayPalette(3,:);
gray4 = grayPalette(4,:);
gray5 = grayPalette(5,:);
gray6 = grayPalette(6,:);
gray7 = grayPalette(7,:);
gray8 = grayPalette(8,:);

%% Create a basic plot

% Create data
time = [1930:1:2010]';
randomwalk = cumsum(rand(size(time)));
data1 = sqrt(randomwalk./max(randomwalk));

% Predefine properties for x-axis
clear obj
obj.XLim = [1930, 2010];
obj.XTick = [1930:20:2010];
xAxis = [fieldnames(obj), struct2cell(obj)]';

% Predefine properties for y-axis
clear obj
obj.YLim = [0, 1];
obj.YTick = [0:0.2:1];
yAxis = [fieldnames(obj), struct2cell(obj)]';

% Predefine properties for lines
clear obj
obj.Color = purpleColor;
obj.LineWidth = 3;
obj.LineStyle = '-';
purpleLine = [fieldnames(obj), struct2cell(obj)]';

% Open figure 
iFigure = 1;
figure(iFigure)
clf
hold on

% Plot data
plot(time, data1, purpleLine{:})

%Populate axes
set(gca, xAxis{:}, yAxis{:})
ylabel('Unit of observation')

%Print figure
print('-dpdf', 'basic.pdf')

%% Create a plot with gray period areas

% Create periods
startPeriod = [1931,1950,1990];
endPeriod = [1934,1964,2008];

% Predefine properties for period areas
clear obj
obj.FaceColor = 'black';
obj.LineStyle = 'none';
obj.FaceAlpha = 0.2;
periodArea = [fieldnames(obj), struct2cell(obj)]';

% Open figure 
iFigure = iFigure + 1;
figure(iFigure)
clf
hold on

% Paint period areas
xregion(startPeriod, endPeriod, periodArea{:});

% Plot data
plot(time, data1, purpleLine{:})

%Populate axes
set(gca, xAxis{:}, yAxis{:})
ylabel('Unit of observation')

%Print figure
print('-dpdf', 'periods.pdf')

%% Create an plot with qualitative variables

% Create more data
randomwalk = cumsum(rand(size(time)));
data2 = 1-sqrt(randomwalk./max(randomwalk));
data3 = (data1+data2)./2;

% Predefine additional properties for lines
clear obj
obj.Color = orangeColor;
obj.LineWidth = 3;
obj.LineStyle = '-.';
orangeLine = [fieldnames(obj), struct2cell(obj)]';
clear obj
obj.Color = greenColor;
obj.LineWidth = 3;
obj.LineStyle = '--';
greenLine = [fieldnames(obj), struct2cell(obj)]';

% Open figure 
iFigure = iFigure + 1;
figure(iFigure)
clf
hold on

% Plot data
plot(time, data1, purpleLine{:})
plot(time, data2, orangeLine{:})
plot(time, data3, greenLine{:})

%Populate axes
set(gca, xAxis{:}, yAxis{:})
ylabel('Unit of observation')

%Print figure
print('-dpdf', 'qualitative.pdf')

%% Create another plot with qualitative variables

% Predefine additional properties for lines
clear obj
obj.Color = orangeColor;
obj.LineWidth = 3;
obj.LineStyle = '-';
orangeLine = [fieldnames(obj), struct2cell(obj)]';
clear obj
obj.Color = greenColor;
obj.LineWidth = 3;
obj.LineStyle = '-';
greenLine = [fieldnames(obj), struct2cell(obj)]';

% Open figure 
iFigure = iFigure + 1;
figure(iFigure)
clf
hold on

% Plot data
plot(time, data1, purpleLine{:})
plot(time, data2, orangeLine{:})
plot(time, data3, greenLine{:})

%Populate axes
set(gca, xAxis{:}, yAxis{:})
ylabel('Unit of observation')

%Print figure
print('-dpdf', 'qualitative_variant.pdf')

%% Create a plot with sequential variables

% Create more data
data4 = data1./2;
data5 = data1./3;
data6 = data1./6;

% Predefine base properties for lines
clear obj
obj.Color = blue8;
obj.LineWidth = 3;
obj.LineStyle = '-';
blueLine = [fieldnames(obj), struct2cell(obj)]';

% Open figure 
iFigure = iFigure + 1;
figure(iFigure)
clf
hold on

% Plot data
plot(time, data1, blueLine{:})
p = plot(time, data4, blueLine{:});
p.Color = blue6;
p = plot(time, data5, blueLine{:});
p.Color = blue4;
p = plot(time, data6, blueLine{:});
p.Color = blue2;

%Populate axes
set(gca, xAxis{:}, yAxis{:})
ylabel('Unit of observation')

%Print figure
print('-dpdf', 'sequential.pdf')

%% Create another plot with sequential variables

% Predefine base properties for lines
clear obj
obj.Color = gray8;
obj.LineWidth = 3;
obj.LineStyle = '-';
grayLine = [fieldnames(obj), struct2cell(obj)]';

% Open figure 
iFigure = iFigure + 1;
figure(iFigure)
clf
hold on

% Plot data
plot(time, data1, grayLine{:})
p = plot(time, data4, grayLine{:});
p.Color = gray6;
p = plot(time, data5, grayLine{:});
p.Color = gray4;
p = plot(time, data6, grayLine{:});
p.Color = gray2;

%Populate axes
set(gca, xAxis{:}, yAxis{:})
ylabel('Unit of observation')

%Print figure
print('-dpdf', 'sequential_variant.pdf')

%% Create a plot with above-below areas

% Predefine property for target line
clear obj
obj.Color = orangeColor;
obj.LineWidth = 1;
obj.LineStyle = '-';
thinLine = [fieldnames(obj), struct2cell(obj)]';

% Open figure 
iFigure = iFigure + 1;
figure(iFigure)
clf
hold on

% Paint gap between data and target of 0.6
a = area(time, [0.6.*ones(size(data1)), max(data1 - 0.6,0), min(data1 - 0.6,0)], 'LineStyle', 'none');
a(1).FaceAlpha = 0;
a(2).FaceAlpha = 0.2;
a(3).FaceAlpha = 0.2;
a(2).FaceColor = purpleColor;
a(3).FaceColor = orangeColor;

% Plot data
plot(time, data1, purpleLine{:})

% Highlight target of 0.6
yline(0.6, thinLine{:})

%Populate axes
set(gca, xAxis{:}, yAxis{:})
ylabel('Unit of observation')

%Print figure
print('-dpdf', 'above_below.pdf')

%% Create another plot with higher-lower areas

% Open figure 
iFigure = iFigure + 1;
figure(iFigure)
clf
hold on

% Paint gap between two data series
a = area(time, [data2, max(data1 - data2,0), min(data1 - data2,0)], 'LineStyle', 'none');
a(1).FaceAlpha = 0;
a(2).FaceAlpha = 0.2;
a(3).FaceAlpha = 0.2;
a(2).FaceColor = purpleColor;
a(3).FaceColor = orangeColor;

% Plot data series
plot(time, data1, purpleLine{:})
plot(time, data2, orangeLine{:})

%Populate axes
set(gca, xAxis{:}, yAxis{:})
ylabel('Unit of observation')

%Print figure
print('-dpdf', 'higher_lower.pdf')

%% Create a basic scatter plot

% Adjust default properties for scatter plot
set(groot, 'defaultAxesXGrid', 'on')
set(groot, 'defaultAxesTickLength', [0 0])

% Create more data
nData = 20;
data7 = rand(nData,1);
data8 = sqrt(rand(nData,1));

% Predefine properties for x-axis
clear obj
obj.XLim = [0, 1];
obj.XTick = [0:0.25:1];
obj.XTickLabel = ['  0%';' 25%';' 50%';' 75%';'100%'];
xAxis = [fieldnames(obj), struct2cell(obj)]';

% Predefine properties for y-axis
clear obj
obj.YLim = [0, 1];
obj.YTick = [0:0.25:1];
obj.YTickLabel = ['  0%';' 25%';' 50%';' 75%';'100%'];
yAxis = [fieldnames(obj), struct2cell(obj)]';

% Predefine properties for scatter dots
clear obj
obj.LineWidth = 1;
obj.SizeData = 100;
obj.MarkerFaceColor = purpleColor;
obj.MarkerEdgeColor = purpleColor;
obj.Marker = 'o';
purpleDot = [fieldnames(obj), struct2cell(obj)]';

% Open figure 
iFigure = iFigure + 1;
figure(iFigure)
clf
hold on

% Plot data
scatter(data7, data8, purpleDot{:})

%Populate axes
set(gca, xAxis{:}, yAxis{:})
xlabel('Data A')
ylabel('Data B')

%Print figure
print('-dpdf', 'scatter.pdf')

%% Create a scatter plot with transparent dots

% Predefine properties for scatter dots
clear obj
obj.LineWidth = 1;
obj.SizeData = 100;
obj.MarkerFaceColor = purpleColor;
obj.MarkerEdgeColor = purpleColor;
obj.Marker = 'o';
obj.MarkerFaceAlpha = 0.4;
transparentDot = [fieldnames(obj), struct2cell(obj)]';

% Open figure 
iFigure = iFigure + 1;
figure(iFigure)
clf
hold on

% Plot data
scatter(data7, data8, transparentDot{:})

%Populate axes
set(gca, xAxis{:}, yAxis{:})
xlabel('Data A')
ylabel('Data B')

%Print figure
print('-dpdf', 'scatter_transparent.pdf')

%% Create a scatter plot with connected dots

% Create more data
nData = 12;
data9 = rand(nData,1);
data10 = rand(nData,1);

% Predefine properties for scatter dots
clear obj
obj.LineWidth = 1;
obj.LineStyle = '-';
obj.Color = gray4;
obj.MarkerSize = 10;
obj.MarkerFaceColor = purpleColor;
obj.MarkerEdgeColor = purpleColor;
obj.Marker = 'o';
purpleDot = [fieldnames(obj), struct2cell(obj)]';

% Open figure 
iFigure = iFigure + 1;
figure(iFigure)
clf
hold on

% Plot data
plot(data9, data10, purpleDot{:})

%Populate axes
set(gca, xAxis{:}, yAxis{:})
xlabel('Data A')
ylabel('Data B')

%Print figure
print('-dpdf', 'scatter_connected.pdf')

%% Create an above-below scatter plot

% Predefine properties for high scatter dots
clear obj
obj.LineWidth = 1;
obj.SizeData = 100;
obj.MarkerFaceColor = greenColor;
obj.MarkerEdgeColor = greenColor;
obj.Marker = 'o';
greenDot = [fieldnames(obj), struct2cell(obj)]';

% Predefine properties for low scatter dots
clear obj
obj.LineWidth = 1;
obj.SizeData = 100;
obj.MarkerFaceColor = pinkColor;
obj.MarkerEdgeColor = pinkColor;
obj.Marker = 'o';
pinkDot = [fieldnames(obj), struct2cell(obj)]';

% Open figure 
iFigure = iFigure + 1;
figure(iFigure)
clf
hold on

% Index high and low data
high = [data8 > data7];
low = [data8 < data7];

% Plot high data
scatter(data7(high), data8(high), greenDot{:})

% Plot low data
scatter(data7(low), data8(low), pinkDot{:})

% Plot separating line
plot([0:0.01:1], [0:0.01:1], thinLine{:})

%Populate axes
set(gca, xAxis{:}, yAxis{:})
xlabel('Data A')
ylabel('Data B')

%Print figure
print('-dpdf', 'scatter_above_below.pdf')
