function plot_csi_data(file_name, data_column)
% file_name:要读取的数据文件名
% data_column: 要绘图的天线，取值为1/2/3

csi_trace = read_bf_file(file_name); % 对数据第一步处理，将二进制转化为可处理的格式
size_of_data = size(csi_trace); % size_of_data=[xx,1]
size_of_data = size_of_data(1); % 获取数据长度 xx

% 设置与数据个数相当的时间点个数
time = [1:1:size_of_data]; % 行数据（1-357）
time = time(:); % 转为列数据
time = repmat(time, 30, 1); % 列数据（1-357）*30
 
% 设置与数据个数相当的副载波索引个数
n = [1:1:30]; % 行数据（1-30）
n = repmat(n, size_of_data, 1); % 网数据（1-30）*357
n = n(:);

% 获取CSI的值
csi = getcsi(csi_trace, size_of_data);
csi = csi(:, :, data_column);
csi = csi(:);

% 生成图片
% 生成网格（1-30）*360，（1-360）*30个
[X,Y] = meshgrid(1:1:30,1:1:360);
% 规定Z从csi中取值的顺序，使其与X，Y匹配
Z = griddata(n, time, csi, X, Y);
mesh(Y, X, Z);

end
