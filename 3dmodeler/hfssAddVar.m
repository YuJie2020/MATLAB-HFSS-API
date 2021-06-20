% ----------------------------------------------------------------------------
% 20200720 newFunction 功能: 添加设计属性变量
%
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------
function hfssAddVar(fid, VarName, Vaule, Units)
fprintf(fid, '\n');
fprintf(fid, 'oEditor.ChangeProperty _\n');
fprintf(fid, 'Array("NAME:AllTabs", _\n');
fprintf(fid, 'Array("NAME:LocalVariableTab", _\n');
fprintf(fid, 'Array("NAME:PropServers","LocalVariables"),  _\n');
fprintf(fid, 'Array("NAME:NewProps",  _\n');
fprintf(fid, 'Array("NAME:%s", _\n',VarName);
fprintf(fid, '"PropType:=", "VariableProp", "UserDef:=",true,  _\n');
if isnumeric(Vaule)
    if  isempty(Units)
        fprintf(fid, '"Value:=", "%f")))) \n', Vaule);
    else
    	fprintf(fid, '"Value:=", "%f%s")))) \n', Vaule, Units);
    end
else
    if  isempty(Units)
        fprintf(fid, '"Value:=", "%s")))) \n', Vaule);
    else
    	fprintf(fid, '"Value:=", "%s%s")))) \n', Vaule, Units);
    end
end