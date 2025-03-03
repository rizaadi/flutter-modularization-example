import 'package:designsystem/designsystem.dart';
import 'package:flutter/material.dart';
import 'package:network/network.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText('Pokemon List'),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder(
                future: ApiServices.getHome(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final pokemonList = snapshot.data?.results;
                  if ((pokemonList ?? []).isEmpty &&
                      snapshot.connectionState == ConnectionState.done) {
                    return const Center(child: Text('Empty'));
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: pokemonList!.length,
                    itemBuilder: (context, index) {
                      final pokemon = pokemonList[index];
                      return PokemonCard(title: pokemon.name ?? '-');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
