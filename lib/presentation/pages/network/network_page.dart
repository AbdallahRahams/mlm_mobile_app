import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/network/network_bloc.dart';
import '../../bloc/network/network_event.dart';
import '../../bloc/network/network_state.dart';

class NetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Network Page')),
      body: BlocBuilder<NetworkBloc, NetworkState>(
        builder: (context, state) {
          if (state is NetworkLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NetworkLoaded) {
            return Center(child: Text('Network ID: ${state.networkId}'));
          } else if (state is NetworkError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Center(child: Text('No Data'));
        },
      ),
    );
  }
}
