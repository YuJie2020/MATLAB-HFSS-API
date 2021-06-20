# MATLAB-HFSS-API

HFSS-MATLAB-API 使用教程 By Vega Lau

Introdution
-----------

根据 [HFSS 19.2 版本帮助文档](https://ansyshelp.ansys.com/account/secured?returnurl=/Views/Secured/Electronics/v192//Subsystems/HFSS/Subsystems/HFSS%20Scripting/HFSS%20Scripting.htm) 介绍，HFSS软件使用 Microsoft®Visual Basic® Scripting Edition (VBScript) 脚本语言记录宏指令。

一方面，在打开HFSS软件进行一些操作时，如果选择 Tools — Record Script to file，新建一个.vbs后缀的脚本文件，可以将所有的操作记录在新建的脚本文件中；另一方面用户也可以自己编写符合格式的脚本文件，通过 Tools — Run Script 使 HFSS 软件运行编写好的脚本。

在一些特定的场景，事先编写脚本使 HFSS 执行相关操作，是非常高效和准确的，可以节省大量的人工重复性操作；不仅如此，在有些情况下，由于建模过于复杂或者模型的参数变量需要通过第三方优化算法相互调用，则只能使用编写脚本的方法完成。

但是在这个原本应该最简单的脚本文件中，可以看到即使是新建一个矩形面的操作，需要的脚本语句也是比较多和复杂的，如果手动一行行敲入这些脚本代码，一方面过于冗长难免出现各种错误，另一方面也无法实现提高效率的初衷。

好在前辈们给出了一些简便的方法，可以将重复性的操作变成可以调用的函数，仅需要将指定的相关参数作为输入，通过相关编程语言自动完成 VBS 脚本文件。这些操作可以通过 MATLAB 或者 Python 完成，本文介绍的 HFSS-MATLAB-API 就是通过 MATLAB 编写的一套可调用的 HFSS-MATLAB 应用程序编程接口，通过编写 MATLAB 代码来生成执行相关特定操作的 HFSS 程序所需的 VBS 脚本。

Files
------

所有相关的 MATLAB 程序文件存储于以下目录：

3dmodeler/ - 包含用于生成 HFSS 三维模型 VBScript 的 .m 文件  
analysis/ - 包含用于生成 HFSS 分析 (Setup/Solve/Export) 模块 VBScript 的 .m 文件  
boundary/ - 包含用于生成 HFSS 边界条件模块 VBScript 的 .m 文件  
general/ - 包含用于生成 HFSS 项目创建/保存、生成结果、执行仿真等常用操作 VBScript 的 .m 文件  
examples/ - 一个借助 HFSS-MATLAB-API 的频率选择表面分析示例

Author
-------

Vijay Ramasami,  
RSL, Univ. of Kansas,  
Lawrence, KS, 66046.  
E-Mail: rvijayc@gmail.com, rvc@ieee.org

Vega Lau,  
CN, Xi'an,  
Xidian University.  
E-Mail: [VegaLau@qq.com](mailto:VegaLau@qq.com)

