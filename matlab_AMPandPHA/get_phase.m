% 测试csi数据转振幅，相位
function phase1 = get_phase(csitemp)
	% 获取n号天线的振幅值
	an_1 = squeeze(csitemp(:, :, 1)); % 取1号天线的值
	an_2 = squeeze(csitemp(:, :, 2)); % 取2号天线的值
	an_1 = an_1(:);
	an_2 = an_2(:);
	phase1 = angle(an_1.*conj(an_2)); % 获取1，2号天线的相位差
end
