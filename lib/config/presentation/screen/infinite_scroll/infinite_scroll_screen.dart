import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const new({super.key});

  static const name = 'infinite_scroll_screen';

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final List<int> imageId = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void addImages() {
    final lastId = imageId.length - 1;
    imageId.addAll([1, 2, 3, 4, 5].map(((e) => lastId + e)));
  }

  Future onRefresh() async {
    isLoading = true;

    await Future.delayed(Duration(seconds: 3));
    if (!isMounted) return;

    final lastId = imageId.last;
    isLoading = false;
    imageId.clear();

    imageId.add(lastId + 1);
    addImages();
    setState(() {});
  }

  void moveScrollToBottom() {
    if ((scrollController.position.pixels + 100) <=
        scrollController.position.maxScrollExtent) {
      return;
    }

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          strokeWidth: 2,
          edgeOffset: 10,
          child: _ListView(
            scrollController: scrollController,
            imageId: imageId,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => isLoading ? null : context.pop(),
        child: isLoading
            ? SpinPerfect(infinite: true, child: CircularProgressIndicator())
            : const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const new({required this.scrollController, required this.imageId});

  final ScrollController scrollController;
  final List<int> imageId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: imageId.length,
      itemBuilder: (context, index) {
        return FadeInImage(
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/Images/jar-loading.gif'),
          image: NetworkImage(
            'https://picsum.photos/id/${imageId[index]}/500/300',
          ),
        );
      },
    );
  }
}
