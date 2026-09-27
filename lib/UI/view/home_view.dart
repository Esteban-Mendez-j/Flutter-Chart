import 'package:flutter/material.dart';
import 'package:graficos/UI/view/community_charts_view.dart';
import 'package:graficos/UI/view/fl_chart_view.dart';
import 'package:graficos/UI/view/graphics_view.dart';
import 'package:graficos/UI/view/syncfusion_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  final List<Widget> _pantallas = [
    const FlChartView(),
    const GraphicView(),
    const SyncfusionView(),
    const CommunityChartsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pantallas[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'FL Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Graphic',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_off_rounded),
            label: 'Syncfusion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Community Chart',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
