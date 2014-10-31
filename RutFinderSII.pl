#!/usr/bin/perl 

#Coded by shine  blog.xshinee.cl                                   
#Consulta rut en la base de datos del SII
#Se ingresa el rut asi 00000000 0

use LWP::UserAgent;
use strict;

system(clear);

if (!$ARGV[0] || !$ARGV[1]) {

&BANNER();
exit 1;

}


my $rut = $ARGV[0];
my $dv = $ARGV[1];
my $answer;
my $sitio = "https://zeus.sii.cl/cvc_cgi/stc/getstc?RUT=$rut&DV=$dv&ACEPTAR=Efectuar+Consulta&PRG=STC&OPC=NOR";

my $buscador = LWP::UserAgent->new() or die;
my $busqueda = $buscador ->get($sitio) or die;

$busqueda ->content() =~ m#<td align="left" width="450"><font class="texto">(.*)</font></td>#ig;
my $answer = $1;

if ($answer =~  /^[A-Za-z+][\s[A-Za-z]+]*$/ ) {

&BANNER2();
print "\nResultado: $answer\n\n";
} else {
&BANNER2();
print "[X] El rut no se encuentra en los registros\n\n"; }


sub BANNER(){
print q(
[###############################
     Rut en SII
  ____ ___ ___ 
 / ___|_ _|_ _|
 \___ \| | | | 
  ___| | | | | 
 |____/___|___|
               


Su uso es asi: rut dv
ejemplo:rutfinder.pl 12345679 0
################################
);
}

sub BANNER2(){
print q(
[############################
    
  ____ ___ ___ 
 / ___|_ _|_ _|
 \___ \| | | | 
  ___| | | | | 
 |____/___|___|
               
Data Rut Finder
Servicio Impuestos Internos
Chile

############################
);
}
