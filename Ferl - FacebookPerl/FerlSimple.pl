#!/usr/bin/perl

#Ferl, Facebook con Perl
#ShineeLabs
#contacto@xshinee.cl

use strict;
use URI;
use LWP::Simple;

my $access_token = 'Aqui va el token';

my $message = <stdin>;
chop($mensaje);

conecta ('me/feed',  {
 access_token => $access_token,
 message      => $mensaje,
 method       => 'post'

});

exit 0 ;

sub conecta {
  my $urlbase = new URI ('https://graph.facebook.com' . shift );
  $urlbase -> query_form(shift);
  my $respuesta = get("$urlbase");

}
