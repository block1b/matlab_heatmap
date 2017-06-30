% 测试csi数据转振幅，相位
function get_phase_heatmap(pc_num, file_name)
	dat_filename = strcat('sample_data/', file_name);
    csi_trace = read_bf_file(dat_filename); % 对数据第一步处理，将二进制转化为可处理的格式
	csi_trace = csi_trace(~cellfun('isempty',csi_trace));
	len = length(csi_trace);
	% csi = zeros(len,30,3); % 生成357*30*3的0矩阵
    for j=1:len
		csi_entry = csi_trace{j};
		csientry = csi_entry.csi;
		% raw_csi = squeeze(csientry);
        % csitemp1(:,:,j) = raw_csi;
		csitemp1(j,:,:) = (squeeze(csientry)');
    end
	
	% 设置与数据个数相当的时间点个数
	time = [1:1:len]; % 行数据（1-357）
	time = time(:); % 转为列数据
	time = repmat(time, 30, 1); % 列数据（1-357）*30
	 
	% 设置与数据个数相当的副载波索引个数
	n = [1:1:30]; % 行数据（1-30）
	n = repmat(n, len, 1); % 网数据（1-30）*357
	n = n(:);

	% 获取相位差的值
	phase = get_phase(csitemp1);

	% 生成图片
	% 生成网格（1-30）*360，（1-360）*30个
	[X,Y] = meshgrid(1:1:30,1:1:360);
	% 规定Z从csi中取值的顺序，使其与X，Y匹配
	Z = griddata(n, time, phase, X, Y);
	% mesh(Y, X, Z);
	pcolor(Y, X, Z); % 热图，看着不好看换个样式。！！！待定
	pc_filename = strcat('pc/', pc_num);
	saveas(gcf,pc_filename,'png')
end
