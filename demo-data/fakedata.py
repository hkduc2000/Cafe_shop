import random
for id in range(49,53):
    print(f"insert into SizeOfProduct values({id},'S',{random.randint(15,30)*1000},{random.randint(1,15)});")
    print(f"insert into SizeOfProduct values({id},'M',{random.randint(30,40)*1000},{random.randint(1,15)});")
    print(f"insert into SizeOfProduct values({id},'L',{random.randint(40,55)*1000},{random.randint(1,15)});")