import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sallaty/Admin/Screens/chat_Details.dart';
import 'package:sallaty/data/Auth/sallaauth_cubit.dart';

class chat extends StatelessWidget {
  const chat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SallaauthCubit, SallaauthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChatDetails(
                              userModel: SallaauthCubit.get(context).model,
                              Admin: SallaauthCubit.get(context).Admin,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                        '${SallaauthCubit.get(context).users[index].image}',
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      '${SallaauthCubit.get(context).users[index].name}',
                      style: TextStyle(
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: SallaauthCubit.get(context).users.length,
        );
      },
    );
  }
}
