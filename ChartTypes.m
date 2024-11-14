% Unified program to display various chart types without intrinsic functions

function chart_demo()
    figure;
    subplot(5, 5, 1); bar_chart();
    subplot(5, 5, 2); pie_chart();
    subplot(5, 5, 3); histogram_chart();
    subplot(5, 5, 4); line_graph();
    subplot(5, 5, 5); scatter_plot();
    subplot(5, 5, 6); pictograph();
    subplot(5, 5, 7); box_plot();
    subplot(5, 5, 8); area_chart();
    subplot(5, 5, 9); radar_chart();
    subplot(5, 5, 10); bubble_chart();
    subplot(5, 5, 11); dot_plot();
    subplot(5, 5, 12); exponential_graph();
    subplot(5, 5, 13); trigonometric_graph();
    subplot(5, 5, 14); waterfall_chart();
    subplot(5, 5, 15); heatmap();
    subplot(5, 5, 16); logarithmic_graph();
end

% 1. Bar Chart
function bar_chart()
    values = [3, 7, 5, 2, 6];
    hold on;
    for i = 1:length(values)
        x = [i-0.4, i+0.4, i+0.4, i-0.4];
        y = [0, 0, values(i), values(i)];
        fill(x, y, 'b');
    end
    title('Bar Chart');
    hold off;
end

% 2. Pie Chart
function pie_chart()
    values = [10, 20, 30, 40];
    total = sum(values);
    angles = 2 * pi * values / total;
    start_angle = 0;
    hold on;
    for i = 1:length(values)
        end_angle = start_angle + angles(i);
        theta = linspace(start_angle, end_angle, 100);
        x = [0, cos(theta)];
        y = [0, sin(theta)];
        fill(x, y, rand(1, 3));
        start_angle = end_angle;
    end
    title('Pie Chart');
    axis equal;
    hold off;
end

% 3. Histogram
function histogram_chart()
    data = randn(1, 100) * 10;
    bins = -30:5:30;
    hist_counts = zeros(1, length(bins)-1);
    for i = 1:length(bins)-1
        hist_counts(i) = sum(data >= bins(i) & data < bins(i+1));
    end
    hold on;
    for i = 1:length(hist_counts)
        x = [bins(i), bins(i+1), bins(i+1), bins(i)];
        y = [0, 0, hist_counts(i), hist_counts(i)];
        fill(x, y, 'g');
    end
    title('Histogram');
    hold off;
end

% 4. Line Graph
function line_graph()
    x = 1:10;
    y = cumsum(rand(1, 10) - 0.5);
    plot(x, y, '-o');
    title('Line Graph');
end

% 5. Scatter Plot
function scatter_plot()
    x = rand(1, 20) * 10;
    y = rand(1, 20) * 10;
    plot(x, y, 'o');
    title('Scatter Plot');
end

% 6. Pictograph
function pictograph()
    values = [2, 4, 6];
    for i = 1:length(values)
        text(0.5, i, repmat('★', 1, values(i)), 'FontSize', 14);
    end
    title('Pictograph');
    axis off;
end

% 7. Box Plot
function box_plot()
    data = randn(1, 100) * 10;
    quartiles = prctile(data, [25, 50, 75]);
    min_val = min(data);
    max_val = max(data);
    hold on;
    line([1, 1], [min_val, max_val], 'Color', 'k');
    fill([-0.5, 1.5, 1.5, -0.5], [quartiles(1), quartiles(1), quartiles(3), quartiles(3)], 'y');
    plot(1, quartiles(2), 'ko');
    title('Box Plot');
    hold off;
end

% 8. Area Chart
function area_chart()
    x = 1:10;
    y = cumsum(rand(1, 10) - 0.5);
    fill([x, fliplr(x)], [y, zeros(1, length(x))], 'c');
    title('Area Chart');
end

% 9. Radar Chart
function radar_chart()
    data = [3, 5, 7, 9, 6];
    angles = linspace(0, 2*pi, length(data) + 1);
    hold on;
    plot([cos(angles); cos(angles) * data(end)], [sin(angles); sin(angles) * data(end)]);
    fill(cos(angles) .* [data, data(1)], sin(angles) .* [data, data(1)], 'm');
    title('Radar Chart');
    axis equal;
    hold off;
end

% 10. Bubble Chart
function bubble_chart()
    x = rand(1, 10) * 10;
    y = rand(1, 10) * 10;
    sizes = rand(1, 10) * 100;
    hold on;
    for i = 1:length(x)
        plot(x(i), y(i), 'o', 'MarkerSize', sizes(i) / 10, 'Color', 'b');
    end
    title('Bubble Chart');
    hold off;
end

% 11. Dot Plot
function dot_plot()
    data = randi([1, 10], 1, 10);
    hold on;
    for i = 1:length(data)
        plot(data(i), i, 'ko');
    end
    title('Dot Plot');
    hold off;
end

% 12. Exponential Graph
function exponential_graph()
    x = 0:0.1:5;
    y = exp(x);
    plot(x, y);
    title('Exponential Graph');
end

% 13. Trigonometric Graph
function trigonometric_graph()
    x = 0:0.1:2*pi;
    plot(x, sin(x), x, cos(x));
    title('Trigonometric Graphs');
end

% 14. Waterfall Chart
function waterfall_chart()
    values = [5, -3, 2, 4, -2];
    cumulative = cumsum([0, values]);
    hold on;
    for i = 1:length(values)
        x = [i, i+1, i+1, i];
        y = [cumulative(i), cumulative(i), cumulative(i+1), cumulative(i+1)];
        fill(x, y, 'g');
    end
    title('Waterfall Chart');
    hold off;
end

% 15. Heatmap
function heatmap()
    data = rand(5, 5);
    hold on;
    for i = 1:5
        for j = 1:5
            fill([j-1, j, j, j-1], [i-1, i-1, i, i], [1, 0, data(i, j)]);
        end
    end
    title('Heatmap');
    hold off;
end

% 16. Logarithmic Graph
function logarithmic_graph()
    x = 1:0.1:10;
    y = log(x);
    plot(x, y);
    title('Logarithmic Graph');
end

% Run the demo
chart_demo();
