#matlab脚本使用说明：
****
本脚本可以批量绘制振幅，相位差的heatmap.
****
****
matlab_AMPandPHA

该文件为工作区。

****
##工作区内文件说明
****
pc

该目录为生图片的保存目录。
****
takepc_plan.txt

将绘图计划写入该文件，脚本会按绘图计划的顺序以此将图片绘制出来，并保存致目录pc,图片名为从0开始的数字，依次增加，文件类型为.png。
****
sample_data

绘图前需将原始数据放入该目录。
****
##脚本命令
****
get-all-amp_pc（antenna_num）；

可绘制绘图计划中，antenna_num号天线的振幅图，antenna_num可取1或2.
****
get-all-phase();

可绘制绘图计划中，的相位差图。