import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_project_team_7/bloc/profile_bloc/profile_bloc.dart';
import 'package:mini_project_team_7/model/profile_model.dart';
import 'package:mini_project_team_7/shared/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(LoadProfileEvent());
    return Scaffold(
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 35, 16, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${profile.name?.firstname} ${profile.name?.lastname}",
                    style: title.copyWith(
                        fontWeight: FontWeight.bold, color: blackColor),
                  ),
                  Text(
                    "${profile.email}",
                    style: body.copyWith(color: const Color(0xffA4A8B5)),
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/845457/pexels-photo-845457.jpeg?auto=compress&cs=tinysrgb&w=600",
                ),
              )
            ],
          ),
        ),
        const CustomDivider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 10, 16, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your Location",
                style: title.copyWith(
                    fontWeight: FontWeight.bold, color: blackColor),
              ),
              Row(
                children: [
                  Text(
                    "Change Location",
                    style: body.copyWith(color: blackColor),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 20),
          child: Text(
            "${profile.address?.street}, ${profile.address?.city} Number :${profile.address?.number}\n ZipCode :${profile.address?.zipcode}",
            style:
                body.copyWith(color: blackColor, fontWeight: FontWeight.w300),
          ),
        ),
        const CustomDivider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 10, 16, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My Orders",
                  style: title.copyWith(
                      fontWeight: FontWeight.bold, color: blackColor)),
              Row(
                children: [
                  Text(
                    "See All",
                    style: body,
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded)
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: primaryColor.withOpacity(0.5),
                    ),
                    child: Text(
                      "2 Items",
                      style: body.copyWith(
                          fontWeight: FontWeight.bold, color: whiteColor),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Icon(
                    Icons.credit_card,
                    size: 30,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "To Pay",
                    style: body.copyWith(
                        fontWeight: FontWeight.bold, color: primaryColor),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 39,
                  ),
                  Icon(
                    Icons.directions_boat_filled_outlined,
                    size: 30,
                    color: blackColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Shipped",
                    style: body.copyWith(
                        fontWeight: FontWeight.bold, color: blackColor),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 39,
                  ),
                  Icon(
                    Icons.local_shipping_outlined,
                    size: 30,
                    color: blackColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Deliver",
                    style: body.copyWith(
                        fontWeight: FontWeight.bold, color: blackColor),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: primaryColor.withOpacity(0.5),
                    ),
                    child: Text(
                      "2 Items",
                      style: body.copyWith(
                          fontWeight: FontWeight.bold, color: whiteColor),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Icon(
                    Icons.forum_outlined,
                    size: 30,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Reviews",
                    style: body.copyWith(
                        fontWeight: FontWeight.bold, color: primaryColor),
                  )
                ],
              ),
            ],
          ),
        ),
        const CustomDivider(),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 20, 16, 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.settings_outlined,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Account Settings",
                    style: subtitle,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.favorite_border_outlined,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Wishlist",
                    style: subtitle,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.shopping_bag_outlined,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "My Order",
                    style: subtitle,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.credit_card_outlined,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Payments",
                    style: subtitle,
                  )
                ],
              ),
            ],
          ),
        )

        // Text('Name: ${profile.name?.firstname} ${profile.name?.lastname}'),
        // Text('Email: ${profile.email}'),
        // Text('Profilename: ${profile.username}'),
        // Text('Phone: ${profile.phone}'),
        // Text('Address: ${profile.address?.street}, ${profile.address?.city}'),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: primaryColor.withOpacity(0.1),
      thickness: 20,
    );
  }
}

class OrdersWidget extends StatelessWidget {
  String title;
  Icon icons;
  bool? haveNotif;
  OrdersWidget(
      {super.key, required this.icons, required this.title, this.haveNotif});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}
