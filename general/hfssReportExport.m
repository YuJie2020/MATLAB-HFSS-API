% ----------------------------------------------------------------------------
% 20200715 newFunction 功能: 导出结果数据为文件
%
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------
function hfssReportExport(fid, plotName, fileName)

fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("ReportSetup") \n');
fprintf(fid, 'oModule.ExportToFile "%s", "%s" \n', plotName, fileName);