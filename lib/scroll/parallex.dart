import 'package:flutter/material.dart';

class ParallaxPage extends StatefulWidget {
  @override
  _ParallaxPageState createState() => _ParallaxPageState();
}

class _ParallaxPageState extends State<ParallaxPage>with TickerProviderStateMixin {
  final _controller = PageController();
  final _images = [
    'https://picsum.photos/id/10/400/600',
    'https://picsum.photos/id/1002/400/600',
    'https://picsum.photos/id/101/400/600',
  ];
bool isSelected=false;
late final AnimationController _controll=AnimationController(vsync: this,duration: Duration(seconds: 1));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
        SliverAppBar(
          // pinned: true,
          expandedHeight: MediaQuery.of(context).size.height*0.7,
          flexibleSpace: FlexibleSpaceBar(
            background:Image.network(_images[1],fit: BoxFit.cover,),
          ),
        ),
        SliverToBoxAdapter(child: _buildContent()),
        SliverToBoxAdapter(child: TextButton(child: Text("animate container"),onPressed: (){
          setState(() {
            isSelected=!isSelected;
          });
        },),),
        SliverToBoxAdapter(
          child: Container(
            color: Colors.blueAccent,
            height: isSelected?300:200,
            width:isSelected?400: 200,
          ),
        ),
        SliverPadding(padding: EdgeInsets.all(30))
        ],
      )
    );
  }
   Widget _buildContent() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lorem ipsum dolor sit amet',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis a magna orci. Donec congue sapien eget turpis varius, eu eleifend mauris malesuada. Fusce efficitur sem eget enim ultricies, nec convallis justo pharetra. Morbi sed metus nec dolor dignissim malesuada. Donec vehicula finibus nulla, ac dignissim orci auctor vel. Praesent eu enim justo. Sed bibendum rhoncus aliquet. Vivamus et finibus eros, eget gravida tellus. Integer sagittis tellus nec sem rutrum, vel sodales tortor faucibus. Nulla lobortis diam vel diam malesuada, eget volutpat quam bibendum. Vestibulum hendrerit enim felis, eget lobortis est vulputate a. Ut tincidunt mauris quis lacus facilisis, sit amet tincidunt dolor pellentesque. Sed euismod bibendum ante, vel blandit tellus iaculis non. Suspendisse non pharetra tellus. Donec euismod neque id ex dapibus, eget congue massa fringilla.',
          ),
          SizedBox(height: 16.0),
          Text(
            'Integer faucibus eros id elit efficitur congue. Morbi pharetra risus purus, eget euismod leo suscipit a. Aenean gravida aliquam sapien sit amet feugiat. Suspendisse tincidunt orci non dolor porttitor, nec gravida magna euismod. Donec a consequat sapien. Integer laoreet eleifend aliquam. Donec ut velit sit amet mauris rhoncus pulvinar. Vivamus suscipit, dolor ut volutpat vestibulum, sapien lorem bibendum nisi, id maximus nulla leo eget enim. Praesent quis nibh a sapien varius pellentesque. Nam quis mauris in odio bibendum tempus. Nunc rhoncus sapien a arcu iaculis elementum. Sed vel turpis vitae quam ultricies semper quis nec elit. Curabitur bibendum a ex nec suscipit.',
          ),
        ],
      ),
    );
  }







}
