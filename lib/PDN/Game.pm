package PDN::Game;

use Moo;

use utf8;
use strict;

my @_Known_Game_Type = qw/01 cricket countup/;

sub BUILDARGS {
  my ($class, %args) = @_;
  return \%args;
}

has title => (
  is  => 'ro',
  isa => sub {
    die "Too long title. [$_[0]]" unless length $_[0] < 15;
  },
  default => sub {"no name"},
);

has game_type => (
  required => 1,
  is       => 'ro',
  isa      => sub {
    die "Unknown game type. [$_[0]]"
      unless (grep { $_[0] eq $_ } @_Known_Game_Type);
  },
);

has players => (
  required => 1,
  is       => 'ro',
  isa      => sub {
    die "players must be array ref. [$_[0]]" unless ref $_[0] eq "ARRAY";
  },
);

has num_of_players => (is => 'lazy', builder => 1, lazy => 1,);

sub _build_num_of_players {
  my $self = shift;
  print "call";
  #$self->num_of_players(scalar @{$self->players});
  $self->num_of_players(1);
}

1;
