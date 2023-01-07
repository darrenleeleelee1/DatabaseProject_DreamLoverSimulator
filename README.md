# Dream Lover Simulator
The code was written by [Chein Chang](https://github.com/pchien0415), [Darren Lee](https://github.com/darrenleeleelee1), [Jamie Wang](https://github.com/jamie212) and [Yoyo Zheng](https://github.com/yo-yo97).

## Outline
1. [Introduction](#Introduction)
2. [Database](#Database)
3. [Backend](#Backend)

## Introduction
### Motivation
Initially, We came across a video from a YouTuber demonstrating how artificial intelligence can transform a sketch into a realistic photograph, which I found quite interesting. This inspired me to consider the possibility of using a database of photos to allow people to draw their ideal partner and then compare the resulting image to find the person who most closely resembles it, enabling individuals to visualize what their ideal dream partner might look like.
### Demonstrations
It is an IOS app, that you can draw a face portrait, then It will find the most similar peoples.
![](https://i.imgur.com/kiwBpHs.png)
![](https://i.imgur.com/kRv0xvC.png)


[More Detailed](https://docs.google.com/presentation/d/1QzGwtofttSelwvsK1hewkhq5rcz6eWOO/edit?usp=sharing&ouid=111786342086836380891&rtpof=true&sd=true)
## Database
Using Mysql 8.0, WorkBench
1. Unzip mix.7z
2. Create database name "lover_generator"
3. Import mix into db
4. Select gender Male and Female into View
   1. ``` CREATE VIEW `male` AS SELECT * FROM mix WHERE gender = "Male"```
   2. ``` CREATE VIEW `female` AS SELECT * FROM mix WHERE gender = "Female"```
5. Unzip images data set into E drive
   *  both images1024x1024.7z and resized_images1024x1024.7z

## Backend
Create Virtual Enviroment
```
conda create -n fastapi_env python=3.8.0
conda activate fastapi_env
```
Install dependcy
```
pip install -r requirment
```
Start Server
```
uvicorn fastapi_server:app --reload --host 0.0.0.0
``` 
[All resource(privated)](https://drive.google.com/drive/folders/1Vfgjyr20ouP5jiMgdaVYHHTO3tOwy34W?usp=sharing) 

[Meeting Record](https://hackmd.io/@qVNXANOET1y8EErBT3zrkA/ByY9CMyBw)
