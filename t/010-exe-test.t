use v6;
use Test;

use META6::To::Man;


my $exe = './bin/meta6-to-man';
my $m   = './t/data/META6.json';
my $m2  = './t/data/META6.json.invalid';


# invalid args 
my @bad = 
"debug"
, "--meta6"
, "-meta6=$m"
, "--date=687-8-12"
, "--meta6=$m2"
;
my $nbad = @bad.elems;;

# valid args
my @good = 
""
, "--date=2017-09-09"
;
my $ngood = @good.elems;;

plan $nbad + $ngood;

for @bad {
    #my $cmd = "$exe $_ 1>/dev/null 2>/dev/null";
    my $cmd = "$exe $_";
    #note "args: $_";
    dies-ok { shell $cmd }, "invalid args";
}

# ensure valid args start with the mandatory arg
$exe ~= " --meta6=$m";
for @good {
    my $cmd = "$exe $_";
    #note "args: $_";
    lives-ok { run $cmd.words }, "valid args";
}



