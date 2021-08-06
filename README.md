# singleCPU-design-baseRISC-V
使用RISC-V指令集设计的简单单周期CPU

### 设计的功能描述
实现了R类型指令中的add/sub/and/or/xor/sll/srl/sra、
I类型指令中的addi/andi/ori/xori/slli/srli/srai/lw/jalr、
B类型指令中的beq/bne/blt/bge和lui/jal/sw等24条基本指令。
CPU的频率为25MHz,外设的频率为1kHz。

### 设计的主要特色
1.	将jarl所需要的数据处理指令从本来该在的执行阶段挪到取指模块，这样执行模块能更专注该有的逻辑运算而不用进行判断输出（参考书目中给的设计图也是这个思想）；
2.	由于分支控制的指令只要实现四条，所以可以简单的用ALU的输出和操作码来进行判断，这样可以简化设计一个分支控制的模块，而将整个模块融入到CPU的控制模块当中。

###  资源使用情况、功耗数据截图

![项目总结报告](https://user-images.githubusercontent.com/51355841/127822744-19a06022-e21f-4b74-9992-30c7391f7f27.PNG)

## 单周期CPU设计与实现

### 1.单周期CPU整体框图
![总体预览](https://user-images.githubusercontent.com/51355841/127823325-06586170-514e-4ea5-ba7f-f05590ff3c86.PNG)

![单周期CPU模块](https://user-images.githubusercontent.com/51355841/127822868-ac2fad11-56ac-43a2-b012-b87abfd50b36.PNG)

![总体实现（连接外设）](https://user-images.githubusercontent.com/51355841/127823086-f91b3765-3ebd-49d3-a13d-909c4275bdcd.png)

![5YDS2 37MKCG0GVYA3TR5HK](https://user-images.githubusercontent.com/51355841/127821860-1124d172-e23b-4dc0-ad88-2b9e59e32652.png)

### 1.2单周期CPU模块详细设计

取值模块：
![取指模块](https://user-images.githubusercontent.com/51355841/127822206-71bcf1da-fb93-475c-a1da-1efcbf0d36ba.PNG)

译码模块：

![译码模块](https://user-images.githubusercontent.com/51355841/127822285-be0b0e1a-d737-4482-8be9-e2e12dddbc42.PNG)

执行模块：
![执行模块](https://user-images.githubusercontent.com/51355841/127822336-6f5a56c3-64c4-47c7-9c8b-680a99204ebb.PNG)

执行模块中ALU：
![ALU模块](https://user-images.githubusercontent.com/51355841/127822456-a6caaab1-f345-4a4c-a9f6-1baff656ce58.PNG)

控制模块：
![控制模块](https://user-images.githubusercontent.com/51355841/127822371-166fc678-8a78-4296-bd3b-51c0b04ba81a.PNG)

CPU lw 送地址模拟：
![单周期lw送地址](https://user-images.githubusercontent.com/51355841/127822694-63025711-d15c-4cfc-8e28-c9867f74671a.PNG)


CPU与外设分频：
![单周期CPU与外设分频](https://user-images.githubusercontent.com/51355841/127822551-063328aa-5d3a-4a98-be9c-b96ae0ec3b88.PNG)

项目总结：

![项目dashboard](https://user-images.githubusercontent.com/51355841/127823288-95ffe47c-de2d-45e9-97ee-f7f3e11bab10.PNG)


