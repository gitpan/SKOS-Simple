#!/usr/bin/perl

use lib "../lib";
use SKOS::Simple;

my $base = "http://semanticweb.org/2007/08/";
my $s = SKOS::Simple->new( base => $base );

use RDF::Trine qw(statement variable);
use RDF::Trine::Namespace;# qw(rdf skos);

print $RDF::Trine::VERSION ."\n";

my $skos = RDF::Trine::Namespace->new('http://www.w3.org/2004/02/skos/core#');
my $rdf  = RDF::Trine::Namespace->new('http://www.w3.org/1999/02/22-rdf-syntax-ns#');

my $model = RDF::Trine::Model->new();

my $file = "swth_skos_v2.0.rdf";
$file = "swth_skos_v2.0.ttl";

my $cns = RDF::Trine::Namespace->new("file://$file");
RDF::Trine::Parser->parse_file_into_model( $cns->uri, $file, $model );

# SELECT * WHERE x rdf:type skos:Concept
my $iterator = $model->subjects( $rdf->type, $skos->Concept );
while (my $concept = $iterator->next) {
  next unless $concept->uri =~ /([0-9.]+)$/;
  my $notation = $1;
  print $concept . " skos:notation \"$notation\". \n";
} 

__END__
subjects = "rdf:type"
prefLabel
altLabel
narrower

#wget http://www.l3s.de/kweb/swth/swth_skos_v2.0.rdf
