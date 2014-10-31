#!/usr/bin/perl 
# Coded by shinee_
# email: reportes.vulns@hotmail.com
# site: blog.xshinee.cl
# Fckeditor.

use LWP::UserAgent;


if (!$ARGV[0]) {

print q (

##############################################
#         fckeditor Search scan         #
#                                            #
# Su uso es de esta manera:                  #
#                                            #
#  perl searchfck.pl www.objetivo.com   #
##############################################

);

exit 1;

}

print q (

############################################
# Fckeditor Arbitrary Upload Vulnerability #
##              Scanner                    #
# Search for /connectors/test.html         #
#            /connectors/uploadtest.html   #
##                                         #
#                                          #
############################################

);

$target = $ARGV[0];
if($target !~ /http:\/\//) { $target = "http://$target"; };

print("\n [x] Analizando: $target \n");

@rutas=('FCKeditor/editor/filemanager/connectors/uploadtest.html',
'FCkeditor/editor/filemanager/connectors/test.html',
'html/js/editor/fckeditor/editor/filemanager/connectors/test.html',
'html/js/editor/fckeditor/editor/filemanager/connectors/uploadtest.html',
'fckeditor/fckeditor/editor/filemanager/connectors/test.html'.
'fckeditor/editor/filemanager/upload/test.html'.
'fckeditor/editor/filemanager/browser/default/connectors/test.html');

foreach $finder( @rutas) {
 $buscador = LWP::UserAgent->new() or die;
 $busqueda = $buscador->get($target."/".$finder);

 if ($busqueda->content =~ /File Upload/ || $busqueda->content =~ /Connector:/ || $busqueda->content =~ /test/ ||
  $busqueda->content =~ /Get Folders/ || $busqueda->content =~ /Browser/ ||
  $busqueda->content =~ /Upload/ || $busqueda->content =~ /Resource Type/ ) 
{
  print("\n [+] Encontrado: $target/$finder \n\a");

 } else { 
           print("\n [x] Objetivo: $target No vulnerable :(\n\a");
}
}
exit 1;
