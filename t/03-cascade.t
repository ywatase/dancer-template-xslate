use strict;
use warnings;
use Test::More tests => 2;
use File::Spec::Functions qw(catfile);

use Dancer::Template::Xslate;
my $engine = Dancer::Template::Xslate->new(
    config =>
    {
        extension => 'tx',
        path      => [catfile(qw(t views))],
    },
);

my $template = catfile(qw(t views cascade.tx));
my $result = $engine->render($template);
my $expected = "header\nbody\nfooter\n";

is $result, $expected, "cascade and extension test";

$engine = Dancer::Template::Xslate->new(
    config =>
    {
        suffix => '.tx',
        path   => [catfile(qw(t views))],
    },
);
$result = $engine->render($template);
is $result, $expected, "cascade and extension test";
