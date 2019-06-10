import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  @override
 final suggestions = <WordPair>[];
 final biggerFont= const TextStyle(fontSize: 18.0);

 Widget buildSuggestions(){
   return ListView.builder(
     padding: const EdgeInsets.all(16),
     itemBuilder: (context,i){
       if(i.isOdd) return Divider();
       final index=i ~/2;
       if(index>=suggestions.length){
         suggestions.addAll(generateWordPairs().take(10));
       }
       return buildRow(suggestions[index]);
     },
   );
 }

 Widget buildRow(WordPair pair){
   return ListTile(
     title: Text(pair.asPascalCase,
     style: biggerFont,
     ),
   );
 }
 Widget build(BuildContext context){
   return Scaffold(appBar: AppBar(
     title: Text('StartUp name Generator'),
   ),
      body: buildSuggestions(),
   );
 }
}