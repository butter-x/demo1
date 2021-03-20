package Demo;
use Mojo::Base 'Mojolicious', -signatures;


use My::Controller;
has controller_class => 'My::Controller';

# This method will run once at server start
sub startup ($self) {

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  # Configure the application
  $self->secrets($config->{secrets});

  $self->preload_namespaces(['My::Controller']);

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
}

1;
