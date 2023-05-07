package AtbashCipher;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

my @a1 = split //, "abcdefghijklmnopqrstuvwxyz";
my @a2 = split //, "zyxwvutsrqponmlkjihgfedcba";

my %conv;

sub encode_atbash {
    my ($phrase) = @_;
    init();

    my $res;
    foreach my $c (split //, lc $phrase) {
        next if $c eq " " || $c eq "," || $c eq ".";
        if (exists($conv{$c})) {
            $res .= $conv{$c};
        } else {
            $res .= $c;
        }
    }

    return join " ", unpack("(A5)*", $res);
}

sub decode_atbash {
    my ($phrase) = @_;
    init();

    my $res;
    foreach my $c (split //, lc $phrase) {
        next if $c eq " ";
        if (exists($conv{$c})) {
            $res .= $conv{$c};
        } else {
            $res .= $c;
        }
    }

    return $res;
}

sub init {
    for (my $i = 0; $i < scalar(@a1); $i++) {
        $conv{$a1[$i]} = $a2[$i];
    }
}

1;
