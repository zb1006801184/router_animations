

## Usage

### 如何在项目使用？

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(AnimationsRoute(
                const SecondPage(),
                transitionsType: TransitionsType.rightToLeft,
              ));
            },
            child: const ListTile(title: Text('跳转')),
          ),
        ],
      ),
    );
  }
}
```
注意：翻转动画需要当前页面的widget，其他动画不需要



