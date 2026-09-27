# 多边形卷轴哨片盒

[[以中文阅读](README_CN.md) | [Read in English](README.md)]

这是 OpenReed 的双簧管哨片多边形卷轴盒 OpenSCAD 参数化模型，依据七片版 `OboeReedHexCase/v4-7` 的 SOLIDWORKS 模型重建。尺寸参数均在 `reed-case-polygon.scad` 中。

## 零件

默认输出是七片展开的连体打印布局：左端、右端、中间片各一片，普通扇片四片。相邻扇片使用交错铰链与一体式铰链轴连接。每片用哨座槽和中段夹片固定一支哨片。中间片有长磁铁腔，两端有小磁铁腔和开盒凹槽。

在 OpenSCAD 中打开 `reed-case-polygon.scad`，通过参数面板选择：

- `Part = "assembly"`、`AssemblyView = "flat"`：打印用展开布局。
- `Part = "assembly"`、`AssemblyView = "closed"`：卷合后的外形预览。
- `Part = "left"`、`"middle"`、`"center"` 或 `"right"`：分别导出单个零件。

默认容量为七支哨片。`EdgesNumber` 可以设置为不小于 5 的奇数；扇片间距、多边形轮廓、顶部过渡和总高度会随之计算。默认 `Radius = 19`、`EdgesNumber = 7` 时，铰链轴间距约 16.49 mm，总高约 96.72 mm。

## 打印

导出 STL 前请使用 **F6** 完整渲染。模型单位为毫米。展开布局以扇片底面立在热床上打印。建议先打印两段相邻铰链，按打印机实际精度调整 `HingeTolerance` 和 `PanelClearance`。卷合视图仅用于检查外形；连体打印时应导出展开视图。

磁铁腔为封闭腔，需要在打印中途暂停并放入磁铁。按 v4-7 的参数和 STEP 腔体，端部小磁铁的名义尺寸为 10 × 5 × 1 mm，中间长磁铁为 40 × 10 × 2 mm。封腔前请确认磁极方向。

## 来源与许可

重建参考了 `OboeReedHexCase/v4-7/equations.txt` 的参数和 STEP 装配体。原 STEP 与 SOLIDWORKS 文件保留在此仓库之外作为设计参考。OpenSCAD 源码采用与 OpenReed `cane-splitter` 仓库一致的 [MIT 许可证](LICENSE)。
