% ----------------------------------------------------------------------------
% 20200725 newFunction 功能: 生成矩形（结果）图表
%
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------
function hfssCreateRectangularPlot(fid, Name, SolutionName, Para_Nominal1, Para_Nominal2, Para_All, fun)

fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("ReportSetup") \n');
fprintf(fid, 'oModule.CreateReport "%s", _\n', Name);
fprintf(fid, '"Modal Solution Data", "Rectangular Plot", _\n');
fprintf(fid, '"%s", _\n', SolutionName);
fprintf(fid, 'Array("Domain:=", "Sweep"), _\n');
fprintf(fid, 'Array("Freq:=", _\n');
fprintf(fid, 'Array("All"), _\n');
fprintf(fid, '"%s:=", Array("Nominal"), _\n', Para_Nominal1);
fprintf(fid, '"%s:=", Array("Nominal"), _\n', Para_Nominal2);
fprintf(fid, '"%s:=", Array("All")), _\n', Para_All);
fprintf(fid, 'Array("X Component:=", "Freq", _\n');
fprintf(fid, '"Y Component:=", Array("%s")), _\n', fun);
fprintf(fid, 'Array() \n');