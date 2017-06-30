% importdata('take_pc_plan.txt')
% 测试csi数据转振幅,antenna_num为天线号
function get_all_phase_pc()
	% 获取绘图计划
	pc_plan = importdata('take_pc_plan.txt');
	len = length(pc_plan);
	for i=1:len
		% 开始绘图
		get_phase_heatmap(num2str(i), pc_plan{i});
		% disp([pc_plan(i)])
end
