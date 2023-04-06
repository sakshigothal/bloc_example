import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/covid_bloc.dart';

class CountryDetailsScreen extends StatefulWidget {
  final int index;
  const CountryDetailsScreen({Key? key,required this.index}) : super(key: key);

  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {

  final CovidBloc newsBloc = CovidBloc();

  @override
  void initState() {
    super.initState();
    newsBloc.add(GetCovidList());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => newsBloc,
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is CovidError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is CovidInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CovidLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CovidLoaded) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Total death: ${state.covidModel.countries![widget.index].totalDeaths}'),
                      Text('Total Recovered: ${state.covidModel.countries![widget.index].totalRecovered}'),
                      Text('New Confirm: ${state.covidModel.countries![widget.index].newConfirmed}'),
                      Text('Country: ${state.covidModel.countries![widget.index].country}'),
                      Text('Total Confirmed: ${state.covidModel.countries![widget.index].totalConfirmed}'),
                    ],
                  ),
                );
              } else if (state is CovidError) {
                return Container(color: Colors.pink,);
              } else {
                return Container(color: Colors.red,);
              }
            },
          ),
        ),
      )
    );
  }
}

