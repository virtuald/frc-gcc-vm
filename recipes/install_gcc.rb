
apt_repository "frc" do
  uri node['frc-gcc-vm']['apt-uri']
  distribution node['frc-gcc-vm']['apt-distribution']
  components ["main"]
  key node['frc-gcc-vm']['apt-key']
end

ruby_block "msg" do
  block do
    Chef::Log.info "Installing packages, this may take a few minutes..."
  end
end

package "gcc-powerpc-wrs-vxworks"
package "frc-buildscripts"
package "wpilib"