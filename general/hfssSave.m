% ----------------------------------------------------------------------------
% 20200715 newFunction 功能: 保存当前 HFSS 项目
%
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------
function hfssSave(fid)

fprintf(fid, 'oProject.Save\n');
end

