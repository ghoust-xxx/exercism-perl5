package Accumulate;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<accumulate>;

sub accumulate {
    my ( $list, $func ) = @_;
    my @res;
    foreach my $item (@{$list}) {
        push @res, $func->($item);
    }
    return \@res;
}

1;
