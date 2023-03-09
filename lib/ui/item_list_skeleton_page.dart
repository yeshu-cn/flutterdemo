import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class ItemListSkeletonPage extends StatefulWidget {
  const ItemListSkeletonPage({Key? key}) : super(key: key);

  @override
  _ItemListSkeletonPageState createState() => _ItemListSkeletonPageState();
}

class _ItemListSkeletonPageState extends State<ItemListSkeletonPage> {
  List<String> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // 模拟异步加载数据
    SchedulerBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    items = List.generate(20, (index) => 'Item $index');
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
      ),
      body: isLoading
          ? SkeletonLoader(
              builder: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            height: 10,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 12,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              items: 6,
              period: const Duration(seconds: 2),
              highlightColor: Colors.lightBlue[300]!,
              direction: SkeletonDirection.ltr,
            )
          : ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(items[index]),
                subtitle: const Text('Subtitle'),
              ),
              itemCount: items.length,
            ),
    );
  }
}
