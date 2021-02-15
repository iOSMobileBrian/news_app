
import 'package:flutter/material.dart';
import 'package:news_app/ViewModels/NewsArticleListViewModel.dart';
import 'package:news_app/ViewModels/NewsArticleViewModel.dart';
import 'package:news_app/Widgets/SearchField.dart';
import 'package:provider/provider.dart';
import 'package:news_app/Widgets/NewsList.dart';
import 'package:news_app/Screens/NewsArticleDetails.dart';


class NewsListPage extends StatefulWidget {

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

 final _controller = TextEditingController();





 Widget _buildList( NewsArticleListView vm){

   switch(vm.loadingStatus){


       case LoadingStatus.searching:
            return Align(child: CircularProgressIndicator(),);
       case LoadingStatus.empty:
            return Align(child: Text("No results found"),);
       case LoadingStatus.completed:
            return Expanded(flex: 1,child: NewsList(vm: vm));
   }


 }


  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListView>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("The News"),
      ),


      body: Column(
        children: [
          SearchField(onSubmit: (value){

            if(value != null){
              vm.newsSearch(value);
            }



          },),
          _buildList(vm),
        ],
      ),
    );

  }
}

