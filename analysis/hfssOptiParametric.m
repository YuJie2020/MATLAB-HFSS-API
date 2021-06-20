% ----------------------------------------------------------------------------
% 20200720 newFunction 功能: 定义参数扫描的范围及适用变量（优化求解）
%
% Copyright 2020, Vega Lau (vegalau@qq.com)
% ----------------------------------------------------------------------------
function hfssOptiParametric(fid, Name, SolutionName, VarName, Sweep_3, Units)
Sweep_3 = reshape(Sweep_3, length(Sweep_3), 1);
if iscell(Sweep_3)
    1;
else
    Sweep_3 = mat2cell(Sweep_3,[1,1,1],1);
end

fprintf(fid, '\n');
fprintf(fid, 'Set oModule = oDesign.GetModule("Optimetrics") \n');
fprintf(fid, 'oModule.InsertSetup "OptiParametric", _\n');
fprintf(fid, 'Array("NAME:%s", _\n', Name);
fprintf(fid, '"IsEnabled:=", true, _\n');
fprintf(fid, 'Array("NAME:ProdOptiSetupDataV2", _\n');
fprintf(fid, '"SaveFields:=", false, _\n');
fprintf(fid, '"CopyMesh:=", false, _\n');
fprintf(fid, '"SolveWithCopiedMeshOnly:=", true), _\n');
fprintf(fid, 'Array("NAME:StartingPoint"), _\n');
fprintf(fid, '"Sim. Setups:=", _\n');
fprintf(fid, 'Array("%s"), _\n', SolutionName);
fprintf(fid, 'Array("NAME:Sweeps", _\n');
fprintf(fid, 'Array("NAME:SweepDefinition", _\n');
fprintf(fid, '"Variable:=", "%s", _\n', VarName);

fprintf(fid, '"Data:=", "LIN ');
if isnumeric(Sweep_3{1,1})
    fprintf(fid, '%f%s ', Sweep_3{1,1}, Units);
else
    fprintf(fid, '%s ', Sweep_3{1,1});
end
    
if isnumeric(Sweep_3{2,1})
    fprintf(fid, '%f%s ', Sweep_3{2,1}, Units);
else
    fprintf(fid, '%s ', Sweep_3{2,1});
end
  
if isnumeric(Sweep_3{3,1})
   fprintf(fid, '%f%s", _\n', Sweep_3{3,1}, Units);
else
     fprintf(fid, '%s", _\n', Sweep_3{3,1});
end

fprintf(fid, '"OffsetF1:=", false, _\n');
fprintf(fid, '"Synchronize:=", 0)), _\n');
fprintf(fid, 'Array("NAME:Sweep Operations"), _\n');
fprintf(fid, 'Array("NAME:Goals")) \n');