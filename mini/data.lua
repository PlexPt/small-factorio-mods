--data.raw 是一个全局变量，包含了游戏中所有原始数据（raw data）的表。
--["fluid"] 是这个表中的一个键，对应的是所有流体（fluid）的定义。

local steam1 = data.raw["fluid"]["steam"]

--启用了蒸汽的自动装桶功能
steam1.auto_barrel = true

