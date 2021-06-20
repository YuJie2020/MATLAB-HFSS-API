Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule

Set oAnsoftApp  = CreateObject("AnsoftHfss.HfssScriptInterface")
Set oDesktop = oAnsoftApp.GetAppDesktop()
oDesktop.RestoreWindow
oDesktop.NewProject
Set oProject = oDesktop.GetActiveProject

oProject.InsertDesign "HFSS", "matlabhfss", "DrivenModal", ""
Set oDesign = oProject.SetActiveDesign("matlabhfss")
Set oEditor = oDesign.SetActiveEditor("3D Modeler")

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers","LocalVariables"),  _
Array("NAME:NewProps",  _
Array("NAME:p", _
"PropType:=", "VariableProp", "UserDef:=",true,  _
"Value:=", "12.700000mm")))) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers","LocalVariables"),  _
Array("NAME:NewProps",  _
Array("NAME:h", _
"PropType:=", "VariableProp", "UserDef:=",true,  _
"Value:=", "5.000000mm")))) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers","LocalVariables"),  _
Array("NAME:NewProps",  _
Array("NAME:hh", _
"PropType:=", "VariableProp", "UserDef:=",true,  _
"Value:=", "2.000000mm")))) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers","LocalVariables"),  _
Array("NAME:NewProps",  _
Array("NAME:l", _
"PropType:=", "VariableProp", "UserDef:=",true,  _
"Value:=", "2.910000mm")))) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers","LocalVariables"),  _
Array("NAME:NewProps",  _
Array("NAME:w", _
"PropType:=", "VariableProp", "UserDef:=",true,  _
"Value:=", "3.260000mm")))) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers","LocalVariables"),  _
Array("NAME:NewProps",  _
Array("NAME:ll", _
"PropType:=", "VariableProp", "UserDef:=",true,  _
"Value:=", "8.600000mm")))) 

oEditor.ChangeProperty _
Array("NAME:AllTabs", _
Array("NAME:LocalVariableTab", _
Array("NAME:PropServers","LocalVariables"),  _
Array("NAME:NewProps",  _
Array("NAME:ww", _
"PropType:=", "VariableProp", "UserDef:=",true,  _
"Value:=", "2.400000mm")))) 

oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", _
Array("NAME:t", _
"PropType:=", "VariableProp", "UserDef:=", true, _
"Value:=", "0.000000deg")))) 

Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.AddMaterial _
Array("NAME:PMMA", _
"CoordinateSystemType:=", _
"Cartesian", _
Array("NAME:AttachedData"), _
Array("NAME:ModifierData"), _
"permittivity:=","2.570000",_
"dielectric_loss_tangent:=","0.007800")

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-3.450000mm", _
"YPosition:=", "5.150000mm", _
"ZPosition:=", "-7.000000mm", _
"XSize:=", "19.600000mm", _
"YSize:=", "2.400000mm", _
"ZSize:=", "5.000000mm"), _
Array("NAME:Attributes", _
"Name:=", "shi", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "5.150000mm", _
"YPosition:=", "-3.450000mm", _
"ZPosition:=", "-7.000000mm", _
"XSize:=", "2.400000mm", _
"YSize:=", "19.600000mm", _
"ZSize:=", "5.000000mm"), _
Array("NAME:Attributes", _
"Name:=", "shi_1", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Unite  _
Array("NAME:Selections", _
"Selections:=", "shi,shi_1"), _
Array("NAME:UniteParameters", "KeepOriginals:=", false)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-3.851081mm", _
"YPosition:=", "-1.630000mm", _
"ZPosition:=", "0.000000mm", _
"XSize:=", "3.851081mm", _
"YSize:=", "3.260000mm", _
"ZSize:=", "5.000000mm"), _
Array("NAME:Attributes", _
"Name:=", "y", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.DuplicateAroundAxis _
Array("NAME:Selections", _
"Selections:=", "y"), _
Array("NAME:DuplicateAroundAxisParameters", _
"WhichAxis:=", "Z", _
"AngleStr:=", "120.000000deg", _
"NumClones:=", 3.000000), _
Array("NAME:Options", _
"DuplicateBoundaries:=", false)

oEditor.Unite  _
Array("NAME:Selections", _
"Selections:=", "y,y_1,y_2"), _
Array("NAME:UniteParameters", "KeepOriginals:=", false)

oEditor.DuplicateAlongLine _
Array("NAME:Selections", _
"Selections:=", "y"), _
Array("NAME:DuplicateToAlongLineParameters", _
"XComponent:=", "12.700000mm", _
"YComponent:=", "0.000000mm", _
"ZComponent:=", "0.000000mm", _
"NumClones:=", 2), _
Array("NAME:Options", _
"DuplicateBoundaries:=", true)

oEditor.DuplicateAlongLine _
Array("NAME:Selections", _
"Selections:=", "y,y_3"), _
Array("NAME:DuplicateToAlongLineParameters", _
"XComponent:=", "0.000000mm", _
"YComponent:=", "12.700000mm", _
"ZComponent:=", "0.000000mm", _
"NumClones:=", 2), _
Array("NAME:Options", _
"DuplicateBoundaries:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-6.350000mm", _
"YPosition:=", "-6.350000mm", _
"ZPosition:=", "5.000000mm", _
"XSize:=", "25.400000mm", _
"YSize:=", "25.400000mm", _
"ZSize:=", "2.000000mm"), _
Array("NAME:Attributes", _
"Name:=", "shang", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-6.350000mm", _
"YPosition:=", "-6.350000mm", _
"ZPosition:=", "-2.000000mm", _
"XSize:=", "25.400000mm", _
"YSize:=", "25.400000mm", _
"ZSize:=", "2.000000mm"), _
Array("NAME:Attributes", _
"Name:=", "zhong", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-6.350000mm", _
"YPosition:=", "-6.350000mm", _
"ZPosition:=", "-9.000000mm", _
"XSize:=", "25.400000mm", _
"YSize:=", "25.400000mm", _
"ZSize:=", "2.000000mm"), _
Array("NAME:Attributes", _
"Name:=", "xia", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-6.350000mm", _
"YPosition:=", "-6.350000mm", _
"ZPosition:=", "0.000000mm", _
"XSize:=", "25.400000mm", _
"YSize:=", "25.400000mm", _
"ZSize:=", "5.000000mm"), _
Array("NAME:Attributes", _
"Name:=", "ding", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"ding", _
"Tool Parts:=", _
"y,y_3,y_3_1,y_4"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", true) 

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-6.350000mm", _
"YPosition:=", "-6.350000mm", _
"ZPosition:=", "-7.000000mm", _
"XSize:=", "25.400000mm", _
"YSize:=", "25.400000mm", _
"ZSize:=", "5.000000mm"), _
Array("NAME:Attributes", _
"Name:=", "di", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.Subtract _
Array("NAME:Selections", _
"Blank Parts:=", _
"di", _
"Tool Parts:=", _
"shi"), _
Array("NAME:SubtractParameters", _
"KeepOriginals:=", true) 

oEditor.Unite  _
Array("NAME:Selections", _
"Selections:=", "shang,zhong,xia,y,y_3,y_3_1,y_4,shi"), _
Array("NAME:UniteParameters", "KeepOriginals:=", false)

oEditor.AssignMaterial _
	Array("NAME:Selections", _
		"Selections:=", "shang"), _
	Array("NAME:Attributes", _
		"MaterialName:=", "PMMA", _
		"SolveInside:=", true)

oEditor.CreateBox _
Array("NAME:BoxParameters", _
"XPosition:=", "-6.350000mm", _
"YPosition:=", "-6.350000mm", _
"ZPosition:=", "-50.000000mm", _
"XSize:=", "25.400000mm", _
"YSize:=", "25.400000mm", _
"ZSize:=", "100.000000mm"), _
Array("NAME:Attributes", _
"Name:=", "AirBox", _
"Flags:=", "", _
"Color:=", "(132 132 193)", _
"Transparency:=", 0.75, _
"PartCoordinateSystem:=", "Global", _
"MaterialName:=", "vacuum", _
"SolveInside:=", true)

oEditor.AssignMaterial _
	Array("NAME:Selections", _
		"Selections:=", "AirBox"), _
	Array("NAME:Attributes", _
		"MaterialName:=", "vacuum", _
		"SolveInside:=", true)

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignMaster _
Array("NAME:Master1", _
"Faces:=", _
Array(1121), _
Array("NAME:CoordSysVector", _
"Origin:=", _
Array( _
"19.050000mm", _
"19.050000mm", _
"-50.000000mm"), _
"UPos:=", _
Array( _
"19.050000mm", _
"19.050000mm", _
"0.000000mm")), _
"ReverseV:=", _
true)

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignSlave _
Array("NAME:Slave1", _
"Faces:=", _
Array(1119), _
Array("NAME:CoordSysVector", _
"Origin:=", _
Array( _
"-6.350000mm", _
"19.050000mm", _
"-50.000000mm"), _
"UPos:=", _
Array( _
"-6.350000mm", _
"19.050000mm", _
"0.000000mm")), _
"ReverseV:=", _
false, _
"Master:=", _
"Master1", _
"UseScanAngles:=", _
true, _
"Phi:=", _
"0deg", _
"Theta:=", _
"tdeg") 

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignMaster _
Array("NAME:Master2", _
"Faces:=", _
Array(1120), _
Array("NAME:CoordSysVector", _
"Origin:=", _
Array( _
"-6.350000mm", _
"19.050000mm", _
"-50.000000mm"), _
"UPos:=", _
Array( _
"-6.350000mm", _
"19.050000mm", _
"0.000000mm")), _
"ReverseV:=", _
true)

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignSlave _
Array("NAME:Slave2", _
"Faces:=", _
Array(1118), _
Array("NAME:CoordSysVector", _
"Origin:=", _
Array( _
"-6.350000mm", _
"-6.350000mm", _
"-50.000000mm"), _
"UPos:=", _
Array( _
"-6.350000mm", _
"-6.350000mm", _
"0.000000mm")), _
"ReverseV:=", _
false, _
"Master:=", _
"Master2", _
"UseScanAngles:=", _
true, _
"Phi:=", _
"0deg", _
"Theta:=", _
"tdeg") 

oEditor.AssignMaterial _
	Array("NAME:Selections", _
		"Selections:=", "ding"), _
	Array("NAME:Attributes", _
		"MaterialName:=", "pec", _
		"SolveInside:=", false)

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignFloquetPort _
Array( _
"NAME:FloquetPort1", _
"Faces:=", Array(1116), _
"NumModes:=", 2, _
"RenormalizeAllTerminals:=", true, _
"DoDeembed:=", false, _
Array("NAME:Modes", _
Array("NAME:Mode1", _
"ModeNum:=", 1, _
"UseIntLine:=", false, _
"CharImp:=", "Zpi"), _
Array("NAME:Mode2", _
"ModeNum:=", 2, _
"UseIntLine:=", false, _
"CharImp:=", "Zpi")), _
"ShowReporterFilter:=", false, _
"ReporterFilter:=", Array(false, false), _
"UseScanAngles:=", true, _
"Phi:=", "0deg", _
"Theta:=", "0deg", _
Array("NAME:LatticeAVector", _
"Start:=", _
Array( _
"-6.350000mm", _
"-6.350000mm", _
"50.000000mm"), _
"End:=", _
Array( _
"19.050000mm", _
"-6.350000mm", _
"50.000000mm")), _
Array("NAME:LatticeBVector", _
"Start:=", _
Array( _
"-6.350000mm", _
"-6.350000mm", _
"50.000000mm"), _
"End:=", _
Array( _
"-6.350000mm", _
"19.050000mm", _
"50.000000mm")), _
Array("NAME:ModesList", _
Array("NAME:Mode", _
"ModeNumber:=", 1, _
"IndexM:=", 0, _
"IndexN:=", 0, _
"KC2:=", 0, _
"PropagationState:=", "Propagating", "Attenuation:=", 0, _
"PolarizationState:=", "TE", _
"AffectsRefinement:=", true), _
Array("NAME:Mode", "ModeNumber:=", 2, _
"IndexM:=", 0, _
"IndexN:=", 0, _
"KC2:=", 0, _
"PropagationState:=", "Propagating", "Attenuation:=", 0, _
"PolarizationState:=", "TM", _
"AffectsRefinement:=", true))) 

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignFloquetPort _
Array( _
"NAME:FloquetPort2", _
"Faces:=", Array(1117), _
"NumModes:=", 2, _
"RenormalizeAllTerminals:=", true, _
"DoDeembed:=", false, _
Array("NAME:Modes", _
Array("NAME:Mode1", _
"ModeNum:=", 1, _
"UseIntLine:=", false, _
"CharImp:=", "Zpi"), _
Array("NAME:Mode2", _
"ModeNum:=", 2, _
"UseIntLine:=", false, _
"CharImp:=", "Zpi")), _
"ShowReporterFilter:=", false, _
"ReporterFilter:=", Array(false, false), _
"UseScanAngles:=", true, _
"Phi:=", "0deg", _
"Theta:=", "0deg", _
Array("NAME:LatticeAVector", _
"Start:=", _
Array( _
"-6.350000mm", _
"-6.350000mm", _
"-50.000000mm"), _
"End:=", _
Array( _
"19.050000mm", _
"-6.350000mm", _
"-50.000000mm")), _
Array("NAME:LatticeBVector", _
"Start:=", _
Array( _
"-6.350000mm", _
"-6.350000mm", _
"-50.000000mm"), _
"End:=", _
Array( _
"-6.350000mm", _
"19.050000mm", _
"-50.000000mm")), _
Array("NAME:ModesList", _
Array("NAME:Mode", _
"ModeNumber:=", 1, _
"IndexM:=", 0, _
"IndexN:=", 0, _
"KC2:=", 0, _
"PropagationState:=", "Propagating", "Attenuation:=", 0, _
"PolarizationState:=", "TE", _
"AffectsRefinement:=", true), _
Array("NAME:Mode", "ModeNumber:=", 2, _
"IndexM:=", 0, _
"IndexN:=", 0, _
"KC2:=", 0, _
"PropagationState:=", "Propagating", "Attenuation:=", 0, _
"PolarizationState:=", "TM", _
"AffectsRefinement:=", true))) 

Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "HfssDriven", _
Array("NAME:Setup1", _
"Frequency:=", "13.000000GHz", _
"PortsOnly:=", false, _
"maxDeltaS:=", 0.020000, _
"UseMatrixConv:=", false, _
"MaximumPasses:=", 20, _
"MinimumPasses:=", 1, _
"MinimumConvergedPasses:=", 1, _
"PercentRefinement:=", 20, _
"ReducedSolutionBasis:=", false, _
"DoLambdaRefine:=", true, _
"DoMaterialLambda:=", true, _
"Target:=", 0.3333, _
"PortAccuracy:=", 2, _
"SetPortMinMaxTri:=", false)

Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertDrivenSweep _
"Setup1", _
Array("NAME:Sweep", _
"Type:=", "Interpolating", _
"InterpTolerance:=", 0.500000, _
"InterpMaxSolns:=", 250, _
"SetupType:=", "LinearCount", _
"StartFreq:=", "11.000000GHz", _
"StopFreq:=", "15.000000GHz", _
"Count:=", 400, _
"SaveFields:=", false, _
"ExtrapToDC:=", false)

Set oModule = oDesign.GetModule("Optimetrics") 
oModule.InsertSetup "OptiParametric", _
Array("NAME:t", _
"IsEnabled:=", true, _
Array("NAME:ProdOptiSetupDataV2", _
"SaveFields:=", false, _
"CopyMesh:=", false, _
"SolveWithCopiedMeshOnly:=", true), _
Array("NAME:StartingPoint"), _
"Sim. Setups:=", _
Array("Setup1"), _
Array("NAME:Sweeps", _
Array("NAME:SweepDefinition", _
"Variable:=", "t", _
"Data:=", "LIN 0.000000deg 60.000000deg 15.000000deg", _
"OffsetF1:=", false, _
"Synchronize:=", 0)), _
Array("NAME:Sweep Operations"), _
Array("NAME:Goals")) 

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.EditSlave "Slave1", _
Array("NAME:Slave1", _
Array("NAME:CoordSysVector", _
"Origin:=", _
Array( _
"-6.350000mm", _
"19.050000mm", _
"-50.000000mm"), _
"UPos:=", _
Array( _
"-6.350000mm", _
"19.050000mm", _
"0.000000mm")), _
"ReverseV:=", _
false, _
"Master:=", _
"Master1", _
"UseScanAngles:=", _
true, _
"Phi:=", _
"0deg", _
"Theta:=", _
"t") 

Set oModule = oDesign.GetModule("BoundarySetup")
oModule.EditSlave "Slave2", _
Array("NAME:Slave2", _
Array("NAME:CoordSysVector", _
"Origin:=", _
Array( _
"-6.350000mm", _
"-6.350000mm", _
"-50.000000mm"), _
"UPos:=", _
Array( _
"-6.350000mm", _
"-6.350000mm", _
"0.000000mm")), _
"ReverseV:=", _
false, _
"Master:=", _
"Master2", _
"UseScanAngles:=", _
true, _
"Phi:=", _
"0deg", _
"Theta:=", _
"t") 

oProject.SaveAs _
"c:\username\20200907\matlabhfss.aedt", _
    true

Set oModule = oDesign.GetModule("AnalysisSetup") 
oDesign.Analyze "t" 

Set oModule = oDesign.GetModule("ReportSetup") 
oModule.CreateReport "S11y", _
"Modal Solution Data", "Rectangular Plot", _
"Setup1 : Sweep", _
Array("Domain:=", "Sweep"), _
Array("Freq:=", _
Array("All"), _
"p:=", Array("Nominal"), _
"h:=", Array("Nominal"), _
"t:=", Array("All")), _
Array("X Component:=", "Freq", _
"Y Component:=", Array("dB(S(FloquetPort1:1,FloquetPort1:1))")), _
Array() 

Set oModule = oDesign.GetModule("ReportSetup") 
oModule.ExportToFile "S11y", "c:\username\20200907\matlabhfssy.csv" 

oEditor.AssignMaterial _
	Array("NAME:Selections", _
		"Selections:=", "ding"), _
	Array("NAME:Attributes", _
		"MaterialName:=", "vacuum", _
		"SolveInside:=", true)

oEditor.AssignMaterial _
	Array("NAME:Selections", _
		"Selections:=", "di"), _
	Array("NAME:Attributes", _
		"MaterialName:=", "pec", _
		"SolveInside:=", false)

Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "HfssDriven", _
Array("NAME:Setup2", _
"Frequency:=", "5.000000GHz", _
"PortsOnly:=", false, _
"maxDeltaS:=", 0.020000, _
"UseMatrixConv:=", false, _
"MaximumPasses:=", 20, _
"MinimumPasses:=", 1, _
"MinimumConvergedPasses:=", 1, _
"PercentRefinement:=", 20, _
"ReducedSolutionBasis:=", false, _
"DoLambdaRefine:=", true, _
"DoMaterialLambda:=", true, _
"Target:=", 0.3333, _
"PortAccuracy:=", 2, _
"SetPortMinMaxTri:=", false)

Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertDrivenSweep _
"Setup2", _
Array("NAME:Sweep2", _
"Type:=", "Interpolating", _
"InterpTolerance:=", 0.500000, _
"InterpMaxSolns:=", 250, _
"SetupType:=", "LinearCount", _
"StartFreq:=", "3.000000GHz", _
"StopFreq:=", "7.000000GHz", _
"Count:=", 400, _
"SaveFields:=", false, _
"ExtrapToDC:=", false)

Set oModule = oDesign.GetModule("Optimetrics") 
oModule.InsertSetup "OptiParametric", _
Array("NAME:t2", _
"IsEnabled:=", true, _
Array("NAME:ProdOptiSetupDataV2", _
"SaveFields:=", false, _
"CopyMesh:=", false, _
"SolveWithCopiedMeshOnly:=", true), _
Array("NAME:StartingPoint"), _
"Sim. Setups:=", _
Array("Setup2"), _
Array("NAME:Sweeps", _
Array("NAME:SweepDefinition", _
"Variable:=", "t", _
"Data:=", "LIN 0.000000deg 60.000000deg 15.000000deg", _
"OffsetF1:=", false, _
"Synchronize:=", 0)), _
Array("NAME:Sweep Operations"), _
Array("NAME:Goals")) 

Set oModule = oDesign.GetModule("AnalysisSetup") 
oDesign.Analyze "t2" 

Set oModule = oDesign.GetModule("ReportSetup") 
oModule.CreateReport "S11t", _
"Modal Solution Data", "Rectangular Plot", _
"Setup2 : Sweep2", _
Array("Domain:=", "Sweep"), _
Array("Freq:=", _
Array("All"), _
"p:=", Array("Nominal"), _
"h:=", Array("Nominal"), _
"t:=", Array("All")), _
Array("X Component:=", "Freq", _
"Y Component:=", Array("dB(S(FloquetPort1:1,FloquetPort1:1))")), _
Array() 

Set oModule = oDesign.GetModule("ReportSetup") 
oModule.ExportToFile "S11t", "c:\username\20200907\matlabhfsst.csv" 
