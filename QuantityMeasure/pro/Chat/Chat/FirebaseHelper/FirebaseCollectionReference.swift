import FirebaseFirestore

enum FirebaseCollectionreference : String {
    case User
    case Recent
}

func FirebaseReference(_ collectionReference: FirebaseCollectionreference) -> CollectionReference {
  
    return Firestore.firestore().collection(collectionReference.rawValue)
}
