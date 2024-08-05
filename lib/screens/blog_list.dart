import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blog_bloc.dart';
import '../bloc/blogevent.dart';
import '../bloc/blogstate.dart';
import '../services/blogservices.dart';
import 'blog_detail_screen.dart';


class BlogListScreen extends StatefulWidget {
  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {
  @override
  void initState() {
    super.initState();
    // Dispatch the FetchBlogs event when the screen loads
    context.read<BlogBloc>().add(FetchBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Explorer', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
      ),
      body: BlocBuilder<BlogBloc, BlogState>(
        builder: (context, state) {
          if (state is BlogInitial || state is BlogLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BlogLoaded) {
            return ListView.builder(
              itemCount: state.blogs.length,
              itemBuilder: (context, index) {
                final blog = state.blogs[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        blog.imageUrl,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(blog.title, style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: IconButton(
                      icon: Icon(
                        blog.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: blog.isFavorite ? Colors.red : null,
                      ),
                      onPressed: () {
                        setState(() {
                          blog.isFavorite = !blog.isFavorite;
                          blog.save();
                        });
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogDetailScreen(blog: blog),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is BlogError) {
            return Center(child: Text('Failed to fetch blogs: ${state.message}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}