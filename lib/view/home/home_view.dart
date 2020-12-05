import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<HomeViewModel>(builder: (context, homeViewModel, child) {
        return Scaffold(
          body: homeViewModel.widgetOptions.elementAt(homeViewModel.bnbIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: homeViewModel.bnbIndex,
            onTap: (int index) => homeViewModel.onTapBnbIndex(index),
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.white,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  homeViewModel.bnbIndex == 0
                      ? Icons.home_filled
                      : Icons.home_outlined,
                ),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(homeViewModel.bnbIndex == 1
                    ? Icons.explore
                    : Icons.explore_outlined),
                label: 'Explorar',
              ),
              BottomNavigationBarItem(
                icon: Icon(homeViewModel.bnbIndex == 2
                    ? Icons.subscriptions
                    : Icons.subscriptions_outlined),
                label: 'Inscrições',
              ),
              BottomNavigationBarItem(
                icon: Icon(homeViewModel.bnbIndex == 3
                    ? Icons.video_library
                    : Icons.video_library_outlined),
                label: 'Biblioteca',
              ),
            ],
          ),
        );
      }),
    );
  }
}
