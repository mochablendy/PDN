use Test::More;
use PDN::Game;

my $game;
$game = PDN::Game->new(
  title     => 'Sample Title',
  game_type => '01',
  players   => [qw/foo/],
);
ok $game, "01 game can be created";
$game = PDN::Game->new(
  title     => 'Sample Title',
  game_type => 'cricket',
  players   => [qw/foo/],
);
ok $game, "cricket game can be created";
cmp_ok $game->{num_of_players}, "==", 1;

done_testing();
