% 测试csi数据转振幅，相位
function amp_n = get_amp(csitemp, antenna_num)
	% 获取n号天线的振幅值
	an_n = squeeze(csitemp(:, :, antenna_num)); % 取antenna_num号天线的值
	an_n = an_n(:);
	amp_n = 1*abs(an_n);
end
