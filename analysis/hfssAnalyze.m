% ----------------------------------------------------------------------------
% 20200705 newFunction 功能: 执行分析
%
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------
function hfssAnalyze(fid, SetupName)

fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("AnalysisSetup") \n');
fprintf(fid, 'oDesign.Analyze "%s" \n', SetupName);