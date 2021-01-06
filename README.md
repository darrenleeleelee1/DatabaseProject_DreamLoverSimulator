# Dream Lover Simulator
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
## BackEnd
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