use ExtUtils::MakeMaker;

# Write the makefile
WriteMakefile(
    'NAME'      => 'File::Temp',
    'VERSION_FROM' => 'Temp.pm', # finds $VERSION

    'PREREQ_PM' => { 
         File::Spec => 0.8,
         Fcntl      => 1.03,
         File::Path => undef,
       },
    'dist'      => { COMPRESS => "gzip -9f" },
  ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
        (ABSTRACT_FROM => 'Temp.pm',
         AUTHOR     => 'Tim Jenness <t.jenness@jach.hawaii.edu>') : ()),
);
