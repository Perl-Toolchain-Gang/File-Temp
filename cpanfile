requires "Carp" => "0";
requires "Carp::Heavy" => "0";
requires "Cwd" => "0";
requires "Exporter" => "5.57";
requires "Fcntl" => "1.03";
requires "File::Path" => "2.06";
requires "File::Spec" => "0.8";
requires "IO::Handle" => "0";
requires "IO::Seekable" => "0";
requires "POSIX" => "0";
requires "Scalar::Util" => "0";
requires "Symbol" => "0";
requires "constant" => "0";
requires "overload" => "0";
requires "parent" => "0.221";
requires "perl" => "5.006";
requires "strict" => "0";

on 'test' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "File::Spec" => "0.8";
  requires "FileHandle" => "0";
  requires "Test::More" => "0";
  requires "warnings" => "0";
};

on 'test' => sub {
  recommends "CPAN::Meta" => "2.120900";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "Encode" => "0";
  requires "File::Spec" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Pod::Coverage::TrustPod" => "0";
  requires "Pod::Wordlist" => "0";
  requires "Test::CPAN::Changes" => "0.19";
  requires "Test::CPAN::Meta" => "0";
  requires "Test::Kwalitee" => "1.21";
  requires "Test::Mojibake" => "0";
  requires "Test::More" => "0.96";
  requires "Test::Pod" => "1.41";
  requires "Test::Pod::Coverage" => "1.08";
  requires "Test::Portability::Files" => "0";
  requires "Test::Spelling" => "0.12";
  requires "warnings" => "0";
};

on 'develop' => sub {
  recommends "Dist::Zilla::PluginBundle::Author::ETHER" => "0.145";
  recommends "Dist::Zilla::PluginBundle::Git::VersionManager" => "0.007";
};
