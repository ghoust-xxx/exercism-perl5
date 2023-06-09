package Allergies;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<allergic_to list_allergies>;

my %alls = (
    "eggs" => 1,
    "peanuts" => 2,
    "shellfish" => 4,
    "strawberries" => 8,
    "tomatoes" => 16,
    "chocolate" => 32,
    "pollen" => 64,
    "cats" => 128,
);

sub allergic_to {
    my ( $item, $score ) = @_;
    return $alls{$item} & $score;
}

sub list_allergies {
    my ($score) = @_;
    my @res;
    foreach my $key (keys %alls) {
        if ($alls{$key} & $score) {
            push @res, $key;
        }
    }
    return \@res;
}

1;
