#!perl
use strict;
use Test2::V0;

use App::P5Nitpick::Rule::RemoveEffectlessUTF8Pragma;

my $code = <<CODE;
use strict;use utf8;
print 42;
use  utf8;
CODE

my $doc = PPI::Document->new(\$code);
my $o = App::P5Nitpick::Rule::RemoveEffectlessUTF8Pragma->new( document => $doc );
my $doc2 = $o->rewrite();
my $code2 = "$doc2";

ok $code2 !~ m/^\s?use\s+utf8\s+;/s;

diag $code2;

done_testing;
