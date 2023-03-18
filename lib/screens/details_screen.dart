import 'package:flutter/material.dart';
import 'package:flutter_peliculasapp/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? '';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(delegate: 
          SliverChildListDelegate([
            _PosterAndTitle(),
            _Overview(),
             _Overview(),
              _Overview(),
            CastingCards()
            ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      //leading: IconButton(icon:Icon(Icons.arrow_back), onPressed: () { Navigator.pop(context); },),
      expandedHeight: 200,
      floating: false,
      //automaticallyImplyLeading: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
          
            "movie.title",
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage("lib/assets/loading.gif"),
          image: NetworkImage("https://via.placeholder.com/500x300"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme= Theme.of(context).textTheme;
    
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage("lib/assets/loading.gif"),
              image: NetworkImage("https://via.placeholder.com/200x300"),
              fit: BoxFit.cover,
              height: 150,
            ),
          ),

          SizedBox(width: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('movie.title',
                    style: textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text('movie.originalTitle',
                    style:textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),

                    Row(

                      children: [
                        Icon(Icons.star_outline, size: 15, color: Colors.grey,),
                        SizedBox(width: 20),
                        Text('movie.voteAverage',
                              style:textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                        ),
                      ],
                    )
                ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
      child: 
      Text("Exercitation cillum excepteur elit exercitation excepteur duis nisi aliqua. Est quis adipisicing occaecat adipisicing quis laboris. Excepteur esse ad dolore incididunt voluptate in qui nulla consectetur sint dolore cillum eiusmod. Nulla non qui voluptate nisi mollit ipsum ipsum mollit reprehenderit et irure aute. Aliqua ipsum veniam duis non incididunt. Ut officia proident ut et consectetur minim nisi irure pariatur nisi laboris.",
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),

    );
  }
}
