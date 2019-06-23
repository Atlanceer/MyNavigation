
	var degreeadd=0.03//每一次角度变化的大小
	var speed=100//每一次调用的时间 越小越快
	var degree1=[1.57,4.71]//每一排角度 1、7共用
	var degree2=[0,2.1,4.1]//2、6排共用
	var degree3=[0,1.236,2.472,3.708,4.994]//3、5排共用
	var degree4=[0,1.05,2.1,3.14,4.21,5.24]
	var op3=[1,0.5,0.3,0.5,0.1]//每一排透明度
	var op4=[1,1,1,1,0.2,0.1,0.1,0.1]
	var op2=[1,0.5,0.5]
	var op1=1
	var fsize=[8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8]//字体大小
	var dis='none'
	function getx(where,degree){//改变位置，椭圆轨迹 得到left值
		switch(where){
			case 1:x=260+25*Math.cos(degree);break;
			case 2:x=260+120*Math.cos(degree);break;
			case 3:x=260+190*Math.cos(degree);break;
			case 4:x=260+245*Math.cos(degree);break;//前面的260为轨道中心点，后面的数字为轨迹的长轴
			case 5:x=260+190*Math.cos(degree);break;
			case 6:x=260+120*Math.cos(degree);break;
			case 7:x=260+25*Math.cos(degree);break;
		}
		return x
		}
	function gety(where,degree){//得到top值
		switch(where){
			case 1:y=20+5*Math.sin(degree);break;
			case 2:y=70+20*Math.sin(degree);break;//前面数字为轨道的中心点，后面数字为轨迹的短轴
			case 3:y=140+20*Math.sin(degree);break;
			case 4:y=210+20*Math.sin(degree);break;
			case 5:y=300+19*Math.sin(degree);break;
			case 6:y=380+20*Math.sin(degree);break;
			case 7:y=420+10*Math.sin(degree);break;
		}
		return y
		}
	function position(id,x,y){//得到位置并画出
		document.getElementById("child"+id).style.right=x+'px';
		document.getElementById("child"+id).style.top=y+'px';
	}
	function judge(id,degree){//根据角度判断：字体大小、透明度等
		var i=id-1//id和数组位置相对应
		if(degree>6.28){
			degree=0
			}
		if(degree===0) fsize[i]=8//小球移动大小的变化
		if(degree>0.1&&degree<1.4) fsize[i]+=0.05
		if(fsize[i]>=10) fsize[i]=15
		if(degree<1.6&&degree>=1.4) fsize[i]=15
		if(degree>=1.6&&degree<3.04) fsize[i]-=0.05
		if(degree>=3.14) fsize[i]=8
			document.getElementById("child"+id).style.fontSize=fsize[i]+'px'
			return degree;
		}
	function hide(op,degree,id){//变化小球的不透明度
			if(degree<=3.14)op=1;
			if(degree>=6.28){
				degree=0
			}
			if(degree>3.14&&degree<4.71){
				op=op-0.06
			}
			if(degree>4.71){
				op=op+0.05
			
			}
			if(op<0.2)op=0.1
			document.getElementById("child"+id).style.opacity=op
			return op
		}
	function oval(){
		var x1,x7,y1,y7//初始化各个点的位置
		var x2=new Array(3)
		var y2=new Array(3)
		var x3=new Array(5)
		var y3=new Array(5)
		var x4=new Array(6)
		var y4=new Array(6)
		var x5=new Array(5)
		var y5=new Array(5)
		var x6=new Array(3)
		var y6=new Array(3)
		
		for(var i=0;i<6;i++){//中间的8个节气
			id=i+10
			x4[i]=getx(4,degree4[i])
			y4[i]=gety(4,degree4[i])
			position(id,x4[i],y4[i])
			degree4[i]=degree4[i]+degreeadd//角度degree大于3.14时运动到背面
			degree4[i]=judge(id,degree4[i])//角度判断
			op4[i]=hide(op4[i],degree4[i],id)
			}
		for(var i=0;i<5;i++){//第三排
			id=i+5
			x3[i]=getx(3,degree3[i])
			y3[i]=gety(3,degree3[i])
			position(id,x3[i],y3[i])
			degree3[i]=degree3[i]+degreeadd//角度degree大于3.14时运动到背面
			degree3[i]=judge(id,degree3[i])//角度判断
			op3[i]=hide(op3[i],degree3[i],id)
			}
		for(var i=0;i<5;i++){//第五排
			id=i+16
			x5[i]=getx(5,degree3[i])
			y5[i]=gety(5,degree3[i])
			position(id,x5[i],y5[i])
			degree3[i]=degree3[i]+degreeadd//角度degree大于3.14时运动到背面
			degree3[i]=judge(id,degree3[i])//角度判断
			op3[i]=hide(op3[i],degree3[i],id)
			}
		for(var i=0;i<3;i++){//第六排
			id=i+21
			x6[i]=getx(6,degree2[i])
			y6[i]=gety(6,degree2[i])
			position(id,x6[i],y6[i])
			degree2[i]=degree2[i]+degreeadd//角度degree大于3.14时运动到背面
			degree2[i]=judge(id,degree2[i])//角度判断
			op2[i]=hide(op2[i],degree2[i],id)
			}
		for(var i=0;i<3;i++){//第二排
			id=i+2
			x2[i]=getx(2,degree2[i])
			y2[i]=gety(2,degree2[i])
			position(id,x2[i],y2[i])
			degree2[i]=degree2[i]+degreeadd//角度degree大于3.14时运动到背面
			degree2[i]=judge(id,degree2[i])//角度判断
			op2[i]=hide(op2[i],degree2[i],id)
			}
			x1=getx(1,degree1[0])
			y1=gety(1,degree1[0])
			position(1,x1,y1)
			degree1[0]=degree1[0]+degreeadd//角度degree大于3.14时运动到背面
			degree1[0]=judge(1,degree1[0])//角度判断
			op1=hide(op1,degree1[0],1)
			
			x7=getx(7,degree1[1])
			y7=gety(7,degree1[1])
			position(24,x7,y7)
			degree1[1]=degree1[1]+degreeadd
			degree1[1]=judge(24,degree1[1])
			op1=hide(op1,degree1[1],24)
			
		}
		function display(id){//视频和音乐的显示和隐藏
			if(dis==='none') dis='block'
			else dis='none'
			document.getElementById(id).style.display=dis
			}
		
		function season(id){//切换背景图片
			document.getElementById("body").background='pictures/season'+id+'.jpg'
			}
		
		function stop(id){//停止旋转
			clearInterval(it);
			for(var i=1;i<=24;i++){
			document.getElementById("child"+i).style.opacity=0.2
			document.getElementById("child"+i).style.fontSize=8+'px'
			}
			document.getElementById("child"+id).style.opacity=1
			document.getElementById("child"+id).style.fontSize=18+'px'
			//document.getElementById("child"+id).setAttribute('background-size', '30px')
			showpicture(id)
			}
		function start(id){//开始旋转
			it=setInterval(function() {oval()},speed);
			unshow(id)
			}
	var it=setInterval(function() {oval()},speed);
