# Transactions Management in mongodb

```
//get a handle to session object
const session = db.getmongo().startSession()

//start transaction on session
session.startTransaction()

//get handle to some collecions via the session object
const usersCollection = session.getDatabase("blog").users
const postsCollection = session.getDatabase("blog").posts

//CRUD commands that we want to do in single transactions
usersCollection.deleteOne({_id: "user_id_01"})
postsCollection.deleteMany({userId: "user_id_01"})

//Commit
session.commitTranscation()
//OR Rollback
session.abortTransaction()


```
