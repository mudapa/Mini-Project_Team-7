
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_team_7/bloc/profile_bloc/profile_bloc.dart';
import 'package:mini_project_team_7/model/profile_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(LoadProfileEvent());
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Information')),
      body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProfileLoadedState) {
          return ProfileView(profile: state.profile);
        } else if (state is ProfileErrorState) {
          return const Center(child: Text('Failed to fetch profile'));
        } else {
          return Container(
            child: const Center(
              child: Text("no data "),
            ),
          );
        }
      }),
    );
  }
}

class ProfileView extends StatelessWidget {
  final Profile profile;

  const ProfileView({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Name: ${profile.name?.firstname} ${profile.name?.lastname}'),
          Text('Email: ${profile.email}'),
          Text('Profilename: ${profile.username}'),
          Text('Phone: ${profile.phone}'),
          Text('Address: ${profile.address?.street}, ${profile.address?.city}'),
        ],
      ),
    );
  }
}
