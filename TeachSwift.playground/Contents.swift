//: Playground - noun: a place where people can play

import UIKit



class Pixel{
    //定义一个变量rgba存储像素的rgba值, 并用init初始化这个值
    var rgba=0;
    init(_ rgba:Int){
        self.rgba=rgba
    }
    //补上这三个方法, 获得rgba中的R, G, B, A
    func getRed()->Int{
        return rgba>>24
    }
    func getGreen()->Int{
        return (rgba&0x00FF0000)>>16
    }
    func getBlue()->Int{
       
        return (rgba&0x0000FF00)>>8
    }
    
    //补上这三个方法，分别对rgba中国的rgb进行设置
    func setRed(r:Int){
        rgba=(rgba&0x00FFFFFF)|(r<<24)
    }
    func setGreen(g:Int){
        rgba=(rgba&0xFF00FFFF)|(g<<16)
    }
    func setBlue(b:Int){
        rgba=(rgba&0xFFFF00FF)|(b<<8)
    }
    
    //通过r，g，b直接设置RGB
    func setRGB(r r:Int, g:Int, b:Int){
        setRed(r)
        setGreen(g)
        setBlue(b)
    }
    
    //从rgba中得到该rgba所表示的颜色
    func getColor()->String{
        switch rgba {
        case 0xFFFFFFFF :
            return "白"
        case 0xFF0000FF:
            return "红"
        case 0x00FF00FF:
            return "绿"
        case 0x0000FFFF:
            return "蓝"
        case 0x000000FF:
            return "黑"
        default:
            return "无"
        }
    }
}



//用RGBA的十六机制值初始化一个像素对象
var p=Pixel(0xFF0000FF)

//调用getColor方法打印像素对象的颜色
//要求能判断出来：黑，白，红，绿，蓝，其他返回“无”
print(p.getColor())

//能够调用getRed, getBlue, getGreen方法获得p的红绿蓝的值
print(p.getRed(),p.getBlue(),p.getGreen(), separator: " ")

//能调用setRGB方法，分别对红绿蓝进行设置
p.setRGB(r: 0, g: 255, b: 0)

//或者通过setRed, setBlue, setGreen方法进行设置
p.setRed(0)
p.setGreen(255)
p.setBlue(0)







class SimpleImage{
    //定义一个变量image是Pixel的一个数组表示一个图片中的所有像素的列表
    var image=[Pixel]()
    //表示图片的宽度
    var length:Int=0
    //表示图片的高度
    var height:Int=0
    //用一个图片初始化image
    init(_ x:[[Int]]){
        for i in x{
            height++
            length=0
            for j in i{
                length++
                image.append(Pixel(j))
            }
        }
    }
    //写一个方法获得像素
    func getPixel(x:Int, y:Int)->Pixel{
        return image[x+y*length]
    }
    //写一个方法打印出来图片
    func printImage(){
        print("---------图形矩阵如下----------")
        for i in 0..<height{
            for j in 0..<length{
                print(getPixel(j, y: i).getColor(), terminator: " ")
            }
            print("")
        }
    }
}


//用Pixel类，把这个图形变成:
//红黑红
//黑红黑
//红黑红
//并打印出来

var w:Int=0xFFFFFFFF; //white
var b:Int=0x000000FF; //black
//有如下一个矩阵表示我们需要处理的图形
//白黑白
//黑白黑
//白黑白
var x_png=[
    [w,b,w],
    [b,w,b],
    [w,b,w],
]


var img=SimpleImage(x_png)

img.printImage()

for p in img.image{
    if p.getColor()=="白"{
        p.setRGB(r: 255, g: 0, b: 0)
    }
}

//for i in 0..<img.length{
//    img.getPixel(i, y: 1).setRGB(r: 255
//, g: 0, b: 0)
//}
//
//img.getPixel(0, y: 0).setRGB(r: 255, g: 0, b: 0)


img.printImage()





