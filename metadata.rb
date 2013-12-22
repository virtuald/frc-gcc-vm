name              "frc-gcc-vm"
maintainer        "Dustin Spicuzza"
maintainer_email  "dustin@virtualroadside.com"
description       "Installs GCC vxWorks cross compiler for the FRC cRio"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.1.0'

%w{ debian ubuntu }.each do |os|
  supports os
end

depends 'apt', "= 1.7.0"
