function csi = getcsi(array, len)
    csi = zeros(len,30,3); % 生成357*30*3的0矩阵
    for j=1:len
        % 使用下函数替换： csi_one = get_scaled_csi(array{j});
		csi_one = array{j}.csi; % 振幅X
        csi(j,:,:) = db(abs(squeeze(csi_one)'));
%         disp(size(db(abs(squeeze(csi_one)'))));
    end
end
