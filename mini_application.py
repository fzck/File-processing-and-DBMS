import pymongo
import sys

from pymongo import MongoClient
client = MongoClient()

db = client.test_database
collection = db.people
collection.drop()


def insertOne():
	print "insert one, reporting for duty"
	flo = {"name": "Flo Zauleck",
		   "course": "BSCS",
		   "interests": ["swimming", "trekking", "music"]
		  }
	try:
		doc = collection.insert_one(flo)
		print "1 person has been inserted"
	except Exception as e:
		print "Unexpected error:", type(e), e


def insertMany():
    print "insert many, reporting for duty"
    irene = {"name": "Irene Bae",
    		"course": "BAMC",
            "interests": ["dancing", "singing", "acting"]
            }  
    kris =  {"name": "Kris Wu",
            "course": "BSM",
            "interests": ["reading", "painting", "rapping"]
            }
    peopleToAdd = [irene, kris]
    try:
        collection.insert_many(peopleToAdd, ordered=True)
        print "2 people have been inserted"
    except Exception as e:
        print "Unexpected error: ", type(e), e


def findOne():
    print "find one, reporting for duty"
    query = { "interests": ["swimming", "trekking", "music"] }    
    try:
        doc = collection.find_one(query)
        print "Search successful"
        print (doc)
    except Exception as e:
        print "Unexpected error: ", type(e), e


insertOne()
insertMany()
findOne()
