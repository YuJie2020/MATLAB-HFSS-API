% ----------------------------------------------------------------------------
% 20200719 newFunction 功能: 合并多个三维模型实体
%
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------
function hfssUnite(fid, ObjectList)

% Preamble.

nObjects = length(ObjectList);

fprintf(fid, '\n');
fprintf(fid, 'oEditor.Unite  _\n');
fprintf(fid, 'Array("NAME:Selections", _\n');
fprintf(fid, '"Selections:=", "');
for iObj = 1:nObjects,
	fprintf(fid, '%s', ObjectList{iObj});
	if (iObj ~= nObjects)
		fprintf(fid, ',');
	end;
end;
fprintf(fid, '"), _\n');

% Postamble.
fprintf(fid, 'Array("NAME:UniteParameters", "KeepOriginals:=", false)\n');