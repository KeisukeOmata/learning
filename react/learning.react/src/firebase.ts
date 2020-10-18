import firebase from "firebase/app";
import 'firebase/firestore';
import "firebase/firebasestorage";

var firebaseConfig = {
  apiKey: "AIzaSyDK84LX4wOqWqhlaYerYXxhYHnAjXiEKSs",
  authDomain: "typescript-79a10.firebaseapp.com",
  databaseURL: "https://typescript-79a10.firebaseio.com",
  projectId: "typescript-79a10",
  storageBucket: "typescript-79a10.appspot.com",
  messagingSenderId: "468109992913",
  appId: "1:468109992913:web:29524bfc913326f56af6f0",
  measurementId: "G-YT5QF75NZP"
};

firebase.initializeApp(firebaseConfig);

export default firebase;