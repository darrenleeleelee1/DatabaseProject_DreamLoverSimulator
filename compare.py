import cv2
import numpy as np
import MySQLdb
import MySQLdb.cursors as cursors
import time

if __name__ == "__main__":
    pass

def get_shifts(data):
    '''
    计算跳变次数，即二进制码相邻2位不同，总共出现的次数
    '''
    count = 0
    binaryCode = "{0:0>8b}".format(data)
     
    for i in range(1,len(binaryCode)):
        if binaryCode[i] != binaryCode[(i-1)]:
            count+=1
    return count
def create_table(img):
    # LBP特征值对应图像灰度编码表，直接默认采样点为8位
    temp = 1
    table =np.zeros((256),dtype=img.dtype)
    for i in range(256):
#         跳变小于3定义为等价模式类，共58，混合类算做1种
        if get_shifts(i)<3:
            table[i] = temp
            temp+=1
    return table


def uniform_pattern_LBP(img,table,radius=3, neighbors=8):
    h,w=img.shape
    dst = np.zeros((h-2*radius, w-2*radius),dtype=img.dtype)
    for i in range(radius,h-radius):
        for j in range(radius,w-radius):
            # 获得中心像素点的灰度值
            center = img[i,j]
            for k in range(neighbors):
                # 计算采样点对于中心点坐标的偏移量rx，ry
                rx = radius * np.cos(2.0 * np.pi * k / neighbors)
                ry = -(radius * np.sin(2.0 * np.pi * k / neighbors))
                # 为双线性插值做准备
                # 对采样点偏移量分别进行上下取整
                x1 = int(np.floor(rx))
                x2 = int(np.ceil(rx))
                y1 = int(np.floor(ry))
                y2 = int(np.ceil(ry))
                # 将坐标偏移量映射到0-1之间
                tx = rx - x1
                ty = ry - y1
                # 根据0-1之间的x，y的权重计算公式计算权重，权重与坐标具体位置无关，与坐标间的差值有关
                w1 = (1-tx) * (1-ty)
                w2 =    tx  * (1-ty)
                w3 = (1-tx) *    ty
                w4 =    tx  *    ty
                # 根据双线性插值公式计算第k个采样点的灰度值
                neighbor = img[i+y1,j+x1] * w1 + img[i+y2,j+x1] *w2 + img[i+y1,j+x2] *  w3 +img[i+y2,j+x2] *w4
                # LBP特征图像的每个邻居的LBP值累加，累加通过与操作完成，对应的LBP值通过移位取得
                dst[i-radius,j-radius] |= (neighbor>center)  <<  (np.uint8)(neighbors-k-1)
                # 进行LBP特征的UniformPattern编码
                # 8位二进制码形成后，查表，对属于混合类的特征置0
                if k==neighbors-1:
                    dst[i-radius,j-radius] = table[dst[i-radius,j-radius]]
    return dst
          

# cv2.imshow('img', gray)
# cv2.imshow('up', uniform_pattern)
# cv2.waitKey(0)
# cv2.destroyAllWindows()

# 先使用等价模式预处理图像，降维。再分割图像，对每个分割块进行直方统计（降维后的类别为59），返回密度向量，再拼接各个分割块对应的密度向量
# 最终返回grid_x*grid_y*numPatterns维的特征向量，作为图像的LBPH特征向量
def getLBPH(img_lbp,numPatterns,grid_x,grid_y,density):
    '''
    计算LBP特征图像的直方图LBPH
    '''
    h,w=img_lbp.shape
    width = int(w / grid_x)
    height = int(h / grid_y)
    # 定义LBPH的行和列，grid_x*grid_y表示将图像分割的块数，numPatterns表示LBP值的模式种类
    result = np.zeros((grid_x * grid_y,numPatterns),dtype=float)
    resultRowIndex = 0
    # 对图像进行分割，分割成grid_x*grid_y块，grid_x，grid_y默认为8
    for i in range(grid_x):
        for j in range(grid_y):
            # 图像分块
            src_cell = img_lbp[i*height:(i+1)*height,j*width:(j+1)*width]
            # 计算直方图
            hist_cell = getLocalRegionLBPH(src_cell,0,(numPatterns-1),density)
            #将直方图放到result中
            result[resultRowIndex]=hist_cell
            resultRowIndex+=1
    return np.reshape(result,(-1))

def getLocalRegionLBPH(src,minValue,maxValue,density=True):
    '''
    计算一个LBP特征图像块的直方图
    '''
    data = np.reshape(src,(-1))
    # 计算得到直方图bin的数目，直方图数组的大小
    bins = maxValue - minValue + 1;
    # 定义直方图每一维的bin的变化范围
    ranges = (float(minValue),float(maxValue + 1))
#     density为True返回的是每个bin对应的概率值，bin为单位宽度时，概率总和为1
    hist, bin_edges = np.histogram(src, bins=bins, range=ranges, density=density)
    return hist


