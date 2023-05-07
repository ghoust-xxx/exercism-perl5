package AllYourBase;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

my @errors = (
    'input base must be >= 2',
    'output base must be >= 2',
    'all digits must satisfy 0 <= d < input base',
);

sub rebase {
    my ( $digits, $input_base, $output_base ) = @_;

    my $in = 0;
    my @res;

    if ($input_base < 2) {
        die $errors[0];
    }
    if ($output_base < 2) {
        die $errors[1];
    }

    foreach my $item (@{$digits}) {
        if ($item < 0 || $item >= $input_base) {
            die $errors[2];
        }
        $in = $in * $input_base + ($item % $input_base);
    }

    if ($in == 0) {
        return [0];
    }

    while ($in > 0) {
        unshift @res, $in % $output_base;
        $in = int($in / $output_base);
    }

    return \@res
}

1;
