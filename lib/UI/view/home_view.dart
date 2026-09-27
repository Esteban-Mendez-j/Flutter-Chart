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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pantallas[_selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,

        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        backgroundColor: const Color(0xFF15141D),
        indicatorColor: const Color(0xFF292735),

        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            );
          }

          return const TextStyle(color: Colors.white54, fontSize: 13);
        }),

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            selectedIcon: Icon(Icons.bar_chart, color: Colors.white),
            label: 'FL Chart',
          ),
          NavigationDestination(
            icon: Icon(Icons.pie_chart),
            selectedIcon: Icon(Icons.pie_chart, color: Colors.white),
            label: 'Graphic',
          ),
          NavigationDestination(
            icon: Icon(Icons.pie_chart_outline),
            selectedIcon: Icon(Icons.pie_chart_outline, color: Colors.white),
            label: 'Syncfusion',
          ),
          NavigationDestination(
            icon: Icon(Icons.insert_chart),
            selectedIcon: Icon(Icons.insert_chart, color: Colors.white),
            label: 'Community',
          ),
        ],
      ),
    );
  }
}
