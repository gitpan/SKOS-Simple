#!/usr/bin/perl

use SKOS::Simple;

# This example uses part of the German Furniture classification
# "Möbel - Eine Typologie für Museen und Sammlungen", published by
# Deutschen Kunstverlag München Berlin, 2005, ISBN 3-422-06512-1.
# The classification is available under CC-BY-SA 

my $skos = SKOS::Simple->new( 
    base  => 'http://www.museumsvokabular.de/museumvok/moebel/',
    properties => {
        '<http://web.resource.org/cc/license>' => 
        '<http://creativecommons.org/licenses/by-nc-sa/2.0/de/>',
    },
    language => "de",
    label => 'pref',
    identity => 'identifier',
);

$skos->add_concept( 
  id    => "00000831",  # TODO: dc:identifier
#    <http://purl.org/dc/elements/1.1/identifier> "00000831" ;
  label => "Tisch",     # TODO: prefLabel
#  <http://www.w3.org/2004/02/skos/core#prefLabel> "Tisch"@de .
  definition => "Der Tisch besteht aus einer horizontalen Platte, dem sogenannten Blatt, das von einem oder mehreren Tragelementen gehalten wird" # @ de ?
  # TODO:
# <http://purl.org/dc/qualifier/1.0/created> "2003-04-07" ;
#  <http://purl.org/dc/elements/1.1/creator> "Böth, Gitta", "Hartmann, Manfred", "Kleebaum, Bernd", "Nickel, Susanne", "Pröstler, Viktor" ;
);

#$skos->add_concept( label => "Tisch", pref => "Tisch" );

$skos->add_concept( 
    id => '00000836', label => "Bocktisch", alt => "Schragentisch",
    broader => '00000831'
);


print $skos->turtle;
