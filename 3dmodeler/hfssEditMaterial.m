% ----------------------------------------------------------------------------
% 20200801 newFunction 功能: 编辑材料属性
%
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------
function hfssEditMaterial(fid, Name, perm, dlt)

fprintf(fid, '\n');
fprintf(fid, 'Set oDefinitionManager = oProject.GetDefinitionManager()\n');
fprintf(fid, 'oDefinitionManager.EditMaterial "%s", _\n',Name);
fprintf(fid, 'Array("NAME:%s", _\n',Name);
fprintf(fid, '"CoordinateSystemType:=", _\n');
fprintf(fid, '"Cartesian", _\n');
fprintf(fid, '"BulkOrSurfaceType:=", 1, _\n');
fprintf(fid, 'Array("NAME:PhysicsTypes", "set:=", _\n');
fprintf(fid, 'Array("Electromagnetic")), _\n');
fprintf(fid, '"permittivity:=", "%f", _\n',perm);
fprintf(fid, '"dielectric_loss_tangent:=", "%f")\n',dlt);