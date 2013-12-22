frc-gcc-vm
==========

This is a vagrant-based VM

This has been tested on OSX, but it should run equally well on Linux and on
Windows platforms. File a bug report if you find this to not be the case.

Pre-deploy setup steps
==========================

Host software requirements
--------------------------

1. Install Virtualbox 4.2.16 or greater
2. Install Vagrant 1.4 or greater [http://www.vagrantup.com]
3. You need to install the correct vagrant plugins:
       
       $ vagrant plugin install vagrant-berkshelf 
	
Setting up a global shared folder (optional, but recommended)
-------------------------------------------------------------

To access your development files from the Vagrant VM, you need to setup a
shared folder that allows the Vagrant VM to access the files from inside
the VM. 

What you can do is setup a global Vagrantfile, and all of the VMs that are
stood up by your username will get the settings inside that VM. Just
create a file  ~/.vagrant.d/Vagrantfile so it looks like the following.
This will map some local folder to /src on the vagrant VM Ñ but of course,
you should set the paths to values that make sense for you.

	Vagrant.configure("2") do |config|
	    
	    config.vm.provider :virtualbox do |vbox, override|
	
	        # path on your local machine
	        host_folder_name = "~/local/path/to/somewhere"
	
	        # path where the local folder is mapped to inside the VM
	        vm_folder_name = "/src"
	
	        override.vm.synced_folder File.expand_path(host_folder_name), vm_folder_name
	    end
	
	end

Start the VM
============

Open up a command prompt and run the following command:

    $ vagrant up
    
If all is well, a bunch of stuff will happen and you'll have a VM that will
have the necessary tools to build C++ projects for WPILib on the cRio. You
can access the VM by doing:

	$ vagrant ssh

Keep in mind that starting the VM the first time may take a *long* time,
particularly because installing the base VM involves downloading hundreds
of megabytes.

After the VM is brought up the first time, subsequent invocations of the
'up' command should be significantly faster, since everything is already
set up for you.

To shutdown the vm, you can do:

	$ vagrant halt


Building things with this VM
=============================

SSH into the VM, and run the FRCMake commands as documented on its wiki.

TODO


Contributing
============

If you find bugs, file an issue on the bug tracker, or fork this repository
and submit a pull request with your fix in it.

Authors
=======

Author:: Dustin Spicuzza (dustin@virtualroadside.com)
    