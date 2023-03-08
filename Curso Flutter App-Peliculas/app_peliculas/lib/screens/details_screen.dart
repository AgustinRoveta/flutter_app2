import 'package:flutter/material.dart';
import 'package:app_peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
//todo cambiar por una instancia de movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no movie';

/* En Dart, ModalRoute.of(context)?.settings.arguments se utiliza para 
acceder a los argumentos pasados ​​a la ruta actual a través de
 Navigator.pushNamed() o Navigator.pushNamedAndRemoveUntil().
ModalRoute.of(context) devuelve la ruta actual del widget modal.
?. es el operador de navegación segura que evita que se produzca una 
excepción si la ruta actual es nula. settings es un objeto que contiene
la configuración de la ruta actual, como el nombre de la ruta, 
los argumentos y la configuración de transición. arguments es una propiedad
del objeto settings que contiene los argumentos pasados ​​a la ruta actual.
Por lo tanto, ModalRoute.of(context)?.settings.arguments devuelve los
 argumentos pasados ​​a la ruta actual o nulo si no hay argumentos. */
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          const _PosterAndTitle(),
          const _Overview(),
          const _Overview(),
          const CastingCards(),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.teal.withOpacity(0.4),
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 18),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  'movie.originalTitle',
                  style: textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    size: 20,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'movie.voteAverage',
                    style: textTheme.bodySmall,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Text(
          'Deserunt ipsum sint proident eu qui cupidatat dolore mollit est Tempor do amet laboris cupidatat culpa eiusmod commodo enim. Occaecat reprehenderit Lorem cupidatat exercitation et. Nostrud quis ullamco sunt deseruntCillum nostrud et ipsum aliqua officia ad esse laborum eu. Sunt sit minim voluptate consectetur officia commodo non voluptate incididunt ipsum quis ullamco ut. Elit ea est cupidatat anim cillum irure dolor tempor pariatur aliqua et labore occaecat. Sit consectetur fugiat commodo id dolor sunt nisi velit elit incididunt consequat voluptate do laborenim in sunt ipsum elit voluptate elit sit ut laborum incididunt cillum commodo adipisicing enim. Culpa consectetur non ea id culpa ex est laborum. Dolore in commodo in veniam. Esse enim culpa consequat sunt amet consectetur nulla sunt cupidatat quis irure irure. Labore aute eiusmod voluptate minim deserunt enim proident commodo enim sit ullamco est labore irureEa occaecat sit ut do est est officia adipisicing proident exercitation Lorem occaecat Lorem. Proident sunt nulla officia fugiat in reprehenderit consectetur aute aliquip do id. Exercitation eiusmod adipisicing do minim ipsum in dolore nisi nostrud pariatur sint. Qui aliquip ex minim excepteur ut tempor ex. Ex do dolore tempor culpa culpa mollit. Elit est culpa labore commodo officia eu ad tempor.',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
/*los slivers sons widgets que tienen un cierto comportamiento pre-programado
cuando se hace scroll en el contenido del padre
*/