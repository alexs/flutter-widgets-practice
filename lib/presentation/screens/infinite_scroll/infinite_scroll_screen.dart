import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imageIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;
 
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent ){
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async{
    if(isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 5));
    addFiveImages();
    isLoading = false;
    if(!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void moveScrollToBottom(){
    if(scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
     scrollController.position.pixels + 120, duration: const Duration(microseconds: 300), curve: Curves.fastOutSlowIn
    );
  }

  void addFiveImages(){
    final lastId = imageIds.last;
    imageIds.addAll([1,2,3,4,5].map((e) => lastId + e));
  }

  Future<void> onRefresh() async{
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if( !isMounted) return;
    isLoading = false;
    final lastId = imageIds.last;
    imageIds.clear();
    imageIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Infinite scroll'),
      ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imageIds.length,
            itemBuilder: (context, index){
            return FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: AssetImage('assets/images/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/id/${ imageIds[index] }/200/300'),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> context.pop(),        
        child: isLoading ? SpinPerfect(
          infinite: true,
          child: const Icon(Icons.refresh_outlined)
        ): FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}