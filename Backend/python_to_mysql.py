import pymysql.cursors
connection = pymysql.connect(host='localhost',user='root',password='C04D10J02Y09',db='lover_generator',charset='utf8mb4',cursorclass=pymysql.cursors.DictCursor)

if(connection):
    print("Connection Successful.")
else:
    print("Connection Unsuccessful.")

mycursor = connection.cursor()

#quest = input("請輸入要查詢什麼?")
# quest = "*"
# sqls = "SELECT " +  quest + "FROM photo " + "WHERE ID = 00000"
# mycursor.execute(sqls)
# myresult = mycursor.fetchall()
# for row in myresult:
#     print(row)
#quest = input("請輸入要查詢什麼?")
quest = "*"
table = "tmp"
sqls = "SELECT " + quest + " FROM " + table
mycursor.execute(sqls)
new_myresult = mycursor.fetchall()

for row in new_myresult:
    print(type(row["LBPH"]))
