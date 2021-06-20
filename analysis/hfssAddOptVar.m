% ----------------------------------------------------------------------------
% 20200720 newFunction 功能: 添加优化变量
%
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------
function hfssAddOptVar(fid, VarName, Vaule, Units)

fprintf(fid, '\n');
fprintf(fid, 'oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _\n');
fprintf(fid, 'Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", _\n');
fprintf(fid, 'Array("NAME:%s", _\n', VarName);
fprintf(fid, '"PropType:=", "VariableProp", "UserDef:=", true, _\n');
fprintf(fid, '"Value:=", "%f%s")))) \n', Vaule, Units);