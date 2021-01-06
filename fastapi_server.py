from fastapi import FastAPI, File, UploadFile
from typing import Optional,List
from fastapi.responses import FileResponse
from pydantic import BaseModel
import aiofiles
import os, subprocess, cv2
import base64, numpy as np
from PIL import Image
import MySQLdb
import MySQLdb.cursors as cursors
from compare import *
from resize import *
import modules
import time, random
import heapq


# class Base64(BaseModel):
#     base64_str: str
#     photo_name: str
#     photo_zodiac: Optional[str] = None
#     photo_age: Optional[str] = None

class Base64(BaseModel):
    base64_str: List[str]
    photo_name: List[str]
    photo_zodiac: List[str] = []
    photo_age: List[str] = []


class Client(BaseModel):
    gender: str

app = FastAPI()

os.system('chcp')

connection = MySQLdb.connect(
    host='localhost',user='root',password='C04D10J02Y09',db='lover_generator', cursorclass = cursors.SSCursor)

if(connection):
    print("Connection Successful.")
else:
    print("Connection Unsuccessful.")




@app.post("/chose_gender", response_model = Client)
async def chose_gender(clt: Client):
    # rand = randint(1, 7)
    # sqls = f"SELECT * FROM lover_generator.{clt.gender} WHERE MOD(ID, {rand}) = 0 LIMIT 10000;"
    m_start = [0, 5000, 10000, 15000, 20000, 25000, 30000, 35000, 40000, 45000, 47500]
    f_start = [0, 5000, 10000, 15000, 20000, 25000, 30000]
    start = [0, 5000, 10000, 15000, 20000, 25000, 30000, 35000, 40000, 45000, 50000, 55000]
    if clt.gender == 'male':    
        q = random.choice(m_start)
    elif clt.gender == 'female':
        q = random.choice(f_start)
    else:
        q = random.choice(start)
    
    sqls = f"SELECT * FROM lover_generator.{clt.gender} WHERE ID > {q} AND ID < 70000 LIMIT 15000;"
    

    print(f"client gender: {clt.gender}")
    print(f"query start from: {q}")
    st = time.time()
    mycursor = connection.cursor()
    mycursor.execute(sqls)
    et = time.time()
    print(f"SQL execute time: {et - st}")
    modules.counter = 0
    modules.ls.clear()
    modules.ID.clear()
    modules.ages.clear()
    modules.zodiacs.clear()
    modules.names.clear()
    
    print(f"ID length:{len(modules.ID)}")
    # st = time.time()
    # allRows = list(mycursor.fetchall())
    # print(type(allRows))
    # et = time.time()
    # print(f"mycursor execute time: {et - st}")

    st = time.time()
    for row in mycursor:
        tmp = []
        [tmp.append(float(x)) for x in row[5][1:-1].split(',')]
        modules.ls.append(tmp)
        modules.ID.append(row[0])
        modules.ages.append(row[2])
        modules.zodiacs.append(row[3])
        modules.names.append(row[4])
        modules.counter += 1
    modules.query += 1
    et = time.time()
    print(f"ID length:{len(modules.ID)}")
    print(f"Parser LBPH from databse time: {et - st}")
    return clt
    
@app.post("/response_model", response_model=Base64)
async def response_models(b64: Base64):
    st = time.time()
    # infile = "./deep_Jamie.jpg"
    imgstr = b64.base64_str[0]
    b64.base64_str.clear()
    b64.photo_name.clear()
    b64.photo_zodiac.clear()
    b64.photo_age.clear()
    imgdata = base64.b64decode(imgstr)
    filename = 'a.png' 
    with open(r"C:\Users\Administrator\Desktop\CDJY\Main\datasets\facades\testB\{}".format(filename), 'wb') as f:
        f.write(imgdata)
    image = cv2.imread(r'C:\Users\Administrator\Desktop\facades_pix2pix\test_latest\images\a_real.png')
    # Image Erode
    kernel = np.ones((7, 7), np.uint8)
    erosion = cv2.erode(image, kernel, iterations=1)
    im = Image.fromarray(erosion)
    im.save(r'C:\Users\Administrator\Desktop\facades_pix2pix\test_latest\images\a_real.png')
    # GAN
    subprocess.run("python test.py --dataroot ./datasets/facades/testB/ --name facades_pix2pix --model test --netG unet_256 --direction BtoA --dataset_mode single --norm batch --gpu_ids -1 --results_dir C:/Users/Administrator/Desktop", shell=True)
    filename = r"C:\Users\Administrator\Desktop\facades_pix2pix\test_latest\images\a_fake.png"
    # Image to LBPH
    resize_64x64(filename)
    gray = cv2.imread(filename , cv2.IMREAD_GRAYSCALE)
    table = create_table(gray)
    uniform_pattern = uniform_pattern_LBP(gray,table, 1, 32)
    lbph = getLBPH(uniform_pattern,59,8,8,True)
    et = time.time()
    print(f"Sketch LBPH time: {et - st}")
    # Compare Images
    st = time.time()
    np_lbph = np.array(lbph)
    pq = []
    for i in range(modules.counter):
        tmp_err = 0
        # for u, v in zip(lbph, ls[i]):
        #     tmp_err += (u - v) ** 2
        # Inner Product
        # tmp_err = sum(((u- v) ** 2 for u, v in zip(lbph, modules.ls[i])))
        
        # Euclidean Distance
        # tmp_err = np.sum(np.multiply(np.array(modules.ls[i]) - np_lbph, np.array(modules.ls[i]) - np_lbph))
        # tmp_err = np.sqrt(np.sum(np.multiply(np.array(modules.ls[i]) - np_lbph, np.array(modules.ls[i]) - np_lbph)))
        
        # Absolute Value
        tmp_err = np.sum( np.absolute(np.array(modules.ls[i]) - np_lbph) )
        
        # Normalized Euclidean distance
        # tmp_err = np.sum(np.multiply(np.array(modules.ls[i]) - np_lbph, np.array(modules.ls[i]) - np_lbph)) / 3776
        # tmp_err = np.sqrt(np.sum(np.multiply(np.array(modules.ls[i]) - np_lbph, np.array(modules.ls[i]) - np_lbph)) / 3776)

        # Chi Square
        """
        np_ls = np.array(modules.ls[i])
        for j in range(3776):
            if((np_lbph[j] + np_ls[j]) == 0):
                continue 
            tmp_err += (np_lbph[j] - np_ls[j]) * (np_lbph[j] - np_ls[j]) / (np_lbph[j] + np_ls[j])
        """
        # tmp_err = np.sum( np.multiply(np.array(modules.ls[i]), np_lbph) )
        heapq.heappush(pq, (tmp_err, i))
        # print(f"{i} err : {tmp_err}")
        # print(f"test checksum:{len(np.array(modules.ls[i]))}")
    et = time.time()
    nsmallest = heapq.nsmallest(6, pq)
    # print(f"final err: {err}, final ID: {modules.ID[index]}")
    print(f"LBPH comapre time: {et - st}")
    
    st = time.time()
    for i in nsmallest:
        photo_id = modules.ID[i[1]]
        print(f"err: {i[0]}, index: {photo_id}")
        paths = int(photo_id / 1000) * 1000
        # resize test image
        size = 512, 512
        if photo_id < 70000:
            infile = r"E:\images1024x1024\%05d\%05d.png" % (paths, photo_id)
        elif photo_id > 70000:
            infile = r"E:\resized_images1024x1024\%d.png" % (photo_id)
            
        image_path = r".\resized512x512.png"
        im = Image.open(infile)
        im.thumbnail(size, Image.ANTIALIAS)
        im.save(image_path)
        with open(image_path, "rb") as img_file:
            b64_output = base64.b64encode(img_file.read())
            b64.base64_str.append(b64_output.decode('utf-8'))
            b64.photo_age.append(modules.ages[i[1]])
            b64.photo_zodiac.append(modules.zodiacs[i[1]])
            b64.photo_name.append(modules.names[i[1]])
    et = time.time()
    print(f"Return photo time: {et - st}")
    return b64

# @app.post("/test", response_model=Base64)
# async def tests(b64: Base64):
#     b64.base64_str.clear()
#     b64.base64_str.append("123")
#     b64.photo_name.append("test")
#     return b64

@app.get("/photos/{photo_id}")
async def get_photo(photo_id: int): 
    paths = int(photo_id / 1000) * 1000

    async with aiofiles.open("viewed_id.txt" , "a") as f:
        await f.write("%05d\n" % photo_id)
        
    return FileResponse(r"E:\images1024x1024\%05d\%05d.png" % (paths, photo_id))
"""
@app.post("/base64")
async def post_base64Image(b64: Base64):
    imgstr = b64.base64_str
    imgdata = base64.b64decode(imgstr)
    filename = '%s.png' % b64.photo_name 
    with open(filename, 'wb') as f:
        f.write(imgdata)
    photo_id = 0
    paths = int(photo_id / 1000) * 1000
    with open(r"E:\images1024x1024\%05d\%05d.png" % (paths, photo_id), "rb") as img_file:
    # with open(r"E:\resized_images1024x1024\00000.png", "rb") as img_file:
        b64_output = base64.b64encode(img_file.read())
    return {"Image" : b64_output.decode('utf-8')}
"""
    # subprocess.run("python test.py --dataroot ./datasets/facades/testB/ --name facades_pix2pix --model test --netG unet_256 --direction BtoA --dataset_mode single --norm batch --gpu_ids -1 --results_dir C:/Users/Administrator/Desktop", shell=True)
    

# @app.post("/uploadfile/")
# async def cache_favicon(file: UploadFile = File(...)):
#     img = await file.read()
   
#     async with aiofiles.open("{}".format(file.filename) , "wb") as f:
#         await f.write(img)
#     return file.filename

# @app.post("/uploadbase64")
# async def post_base64Image(base64_image: str, photo_name: str):
#     F = open("base64.txt", "a")
#     F.write(base64_image + "\n")

#     imgstr = base64_image
#     imgdata = base64.b64decode(imgstr)
#     filename = '%s.jpg' % photo_name 
#     with open(filename, 'wb') as f:
#         f.write(imgdata)
    
#     return base64_image
