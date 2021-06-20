% 目标：用于建立频率选择表面仿真的脚本
% 2020.9.7日 by Vega Lau

clear, clc

units = 'mm';
units2 = 'deg';

% 定义设计变量
p = 12.7; % 单元边长
h = 5; % 金属层高度
hh = 2; % 单侧介质层高度
l = 2.91; % Y字立柱的长度
w = 3.26; % Y字立柱的宽度
ll = 8.6; % +字立柱的长度
ww = 2.4; % +字立柱的宽度
t = 0; % 电磁波入射角度

% 文件名及存储路径
fileName = 'matlabhfss';
tmpScriptFile = ['c:\username\20200907\',fileName,'.vbs'];

% 开始写VBS脚本
fid = fopen(tmpScriptFile, 'wt'); % 'wt'表示以文本模式打开文件，可写，覆盖原有内容

% 创建一个新的工程并插入一个新的设计
hfssNewProject(fid);
hfssInsertDesign(fid, fileName);

% 新增变量
hfssAddVar(fid, 'p', p, units);
hfssAddVar(fid, 'h', h, units);
hfssAddVar(fid, 'hh', hh, units);
hfssAddVar(fid, 'l', l, units);
hfssAddVar(fid, 'w', w, units);
hfssAddVar(fid, 'll', ll, units);
hfssAddVar(fid, 'ww', ww, units);

% 新增优化变量
hfssAddOptVar(fid, 't', t, units2)

% 新增材料
hfssAddMaterial(fid, 'PMMA', 2.57, 0.0078);
% FSS底层建模及设置材料
hfssBox(fid, 'shi', [-ww/2-ll+p/2, p/2-ww/2, -h-hh], [2*ll+ww, ww, h], units);
hfssBox(fid, 'shi_1', [p/2-ww/2, -ww/2-ll+p/2, -h-hh], [ww, 2*ll+ww, h], units);
hfssUnite(fid, {'shi', 'shi_1'});
% FSS顶层建模及设置材料
hfssBox(fid, 'y', [-l-sqrt(3)*w/6, -w/2, 0], [l+sqrt(3)*w/6, w, h], units);
hfssDuplicateAroundAxis(fid, {'y'}, 'Z', 120, 3);
hfssUnite(fid, {'y', 'y_1', 'y_2'});
hfssDuplicateAlongLine(fid, {'y'}, [p, 0, 0], 2, units);
hfssDuplicateAlongLine(fid, {'y', 'y_3'}, [0, p, 0], 2, units);

% FSS整体建模
hfssBox(fid, 'shang', [-p/2, -p/2, h], [2*p, 2*p, hh], units);
hfssBox(fid, 'zhong', [-p/2, -p/2, -hh], [2*p, 2*p, hh], units);
hfssBox(fid, 'xia', [-p/2, -p/2, -h-2*hh], [2*p, 2*p, hh], units);
hfssBox(fid, 'ding', [-p/2, -p/2, 0], [2*p, 2*p, h], units);
hfssSubtract(fid, 'ding', {'y', 'y_3', 'y_3_1', 'y_4'});
hfssBox(fid, 'di', [-p/2, -p/2, -h-hh], [2*p, 2*p, h], units);
hfssSubtract(fid, 'di', 'shi');
hfssUnite(fid, {'shang', 'zhong', 'xia', 'y', 'y_3', 'y_3_1', 'y_4', 'shi'});
hfssAssignMaterial(fid, 'shang', 'PMMA');

% FSS空气盒子建模及设置材料
hfssBox(fid, 'AirBox', [-p/2, -p/2, -50], [2*p, 2*p, 100], units);
hfssAssignMaterial(fid, 'AirBox', 'vacuum');

% 设置主从边界条件1
hfssMaster(fid, 'Master1', 1121, [3*p/2, 3*p/2, -50], [3*p/2, 3*p/2, 0], units);
hfssSlave(fid, 'Slave1' , 1119, [-p/2, 3*p/2, -50], [-p/2, 3*p/2, 0], units, 'Master1', ['t', units2]);

% 设置主从边界条件2
hfssMaster(fid, 'Master2', 1120, [-p/2, 3*p/2, -50], [-p/2, 3*p/2, 0], units);
hfssSlave(fid, 'Slave2', 1118, [-p/2, -p/2, -50], [-p/2, -p/2, 0], units, 'Master2', ['t', units2]);

% 设置理想导体边界条件
hfssAssignMaterial(fid, 'ding', 'pec');

% 设置FloquetPort激励
hfssFloquetPort(fid, 'FloquetPort1', 1116, [-p/2, -p/2, 50], [3*p/2, -p/2, 50], [-p/2, 3*p/2, 50], units);
hfssFloquetPort(fid, 'FloquetPort2', 1117, [-p/2, -p/2, -50], [3*p/2, -p/2, -50], [-p/2, 3*p/2, -50], units);

% 求解设置
hfssInsertSolution(fid, 'Setup1', 13, 0.02, 20);

% 扫频设置
hfssInterpolatingSweep(fid, 'Sweep', 'Setup1', 11, 15, 400, 250, 0.5);

% 设置优化求解
hfssOptiParametric(fid, 't', 'Setup1', 't', [0, 60, 15], units2);

% 设置主从边界条件的入射角度
hfssEditSlave(fid, 'Slave1', [-p/2, 3*p/2, -50], [-p/2, 3*p/2, 0], units, 'Master1', 't');
hfssEditSlave(fid, 'Slave2', [-p/2, -p/2, -50], [-p/2, -p/2, 0], units, 'Master2', 't');

% 保存项目
hfssSaveProject(fid, 'c:\username\20200907\matlabhfss.aedt', true);

% 求解
hfssAnalyze(fid, 't');

% 生成结果报告
hfssCreateRectangularPlot(fid, 'S11y', 'Setup1 : Sweep', 'p', 'h', 't', 'dB(S(FloquetPort1:1,FloquetPort1:1))');

% 导出数据
hfssReportExport(fid, 'S11y', 'c:\username\20200907\matlabhfssy.csv');

% 更新样机模型及条件（另一种工况）进行仿真
hfssAssignMaterial(fid, 'ding', 'vacuum');
hfssAssignMaterial(fid, 'di', 'pec'); 
hfssInsertSolution(fid, 'Setup2', 5, 0.02, 20);
hfssInterpolatingSweep(fid, 'Sweep2', 'Setup2', 3, 7, 400, 250, 0.5);
hfssOptiParametric(fid, 't2', 'Setup2', 't', [0, 60, 15], units2);
hfssAnalyze(fid, 't2');
hfssCreateRectangularPlot(fid, 'S11t', 'Setup2 : Sweep2', 'p', 'h', 't', 'dB(S(FloquetPort1:1,FloquetPort1:1))');
hfssReportExport(fid, 'S11t', 'c:\username\20200907\matlabhfsst.csv');

% 关闭输出流
fclose(fid);