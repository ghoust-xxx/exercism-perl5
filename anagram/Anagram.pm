package Anagram;

use strict;
use warnings;
use feature qw<say>;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub match_anagrams {
    my ( $subject, $candidates ) = @_;
    my @res = grep {is_anagram($subject, $_)} @{$candidates};
    return \@res;
}

sub is_anagram {
    my ($w1, $w2) = @_;

    return 0 if length($w1) != length($w2);

    $w1 = lc($w1);
    $w2 = lc($w2);

    return 0 if $w1 eq $w2;

    my @l1 = sort split //, $w1;
    my @l2 = sort split //, $w2;
    for (my $i = 0; $i < length($w1); $i++) {
        return 0 if $l1[$i] ne $l2[$i];
    }
    return 1;
}

1;
