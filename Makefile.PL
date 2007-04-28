

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Catalyst::Controller::PathArgs',
    VERSION_FROM => 'lib/Catalyst/Controller/PathArgs.pm', # finds \$VERSION
    AUTHOR       => 'Zbigniew Lukasiak',
    ABSTRACT     => 'Module abstract (<= 44 characters) goes here',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
                     'Catalyst::Runtime' => 5.7007,
                    },
);
