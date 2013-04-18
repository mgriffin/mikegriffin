---
layout: post
title: "Creating a Debian Wheezy Base Box for Vagrant"
date: 2013-04-18 14:36
comments: true
categories: 
---
I have been playing around with [Vagrant](http://vagrantup.com) so that I can set up a VM to do some dev work on instead of trying to keep
a number of computers in sync. I have a debian testing VPS that I use to host some sites so I wanted the VM to match that. I couldn't find
a base box out in the big bad internet, so I decided to build my own and use that.

I started off by downloading the [Debian Wheezy NetInstall CD](http://www.debian.org/devel/debian-installer/). This meant that I didn't have to go through an upgrade process after
I installed Debian.

### Install Debian

I installed [VirtualBox](https://www.virtualbox.org/) and [Vagrant](http://vagrantup.com) and set about my task.

  * Create a new virtual machine and called it `wheezy32`
  * Accept all the defaults and then disable Audio and USB
  * Add the netinst ISO image as a CD and boot the virtual machine
  * Select your language and territory (I chose English and Ireland)
  * Select your keymap (I chose Irish)
  * Set your hostname (vagrant-debian-wheezy)
  * Set the domain name (vagrantup.com)
  * Set the root password (vagrant)
  * Set up a user (vagrant with vagrant as the password too)
  * Follow the defaults to set up the disk, all one partition

The base system gets installed then before you are asked for your archive mirror location and any proxy settings you have. The installer then goes off and downloads the source list
for the system before asking if you want to take part in the package usage survey. I usually say no.

Deselect all tasks except "Standard system utilities" and continute to allow the system to install the required packages.

Next the installer asks about GRUB. Just take all the defaults and install it to the root of the drive.

After this is done, it's time to reboot the virtual machine.

### Install some packages

Log in as root

{% highlight bash %}
apt-get install build-essentials module-assistant
m-a prepare
apt-get install openssh-server zerofree ruby1.9
gem install chef --no-ri --no-rdoc
mkdir /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
mv vagrant.pub authorized_keys
cd -
chmod 700 /home/vagrant/.ssh
chown -r vagrant:vagrant /home/vagrant/.ssh
{% endhighlight %}

### Shrink the box size

{% highlight bash %}
rm -rf /usr/share/doc
rm -rf /usr/src/vboxguest*
rm -rf /usr/src/virtualbox-ose-guest*
find /var/cache -type f -exec rm -rf {} \;
rm -rf /usr/share/locale/{af,am,ar,as,ast,az,bal,be,bg,bn,bn_IN,br,bs,byn,ca,cr,cs,csb,cy,da,de,de_AT,dz,el,en_AU,en_CA,eo,es,et,et_EE,eu,fa,fi,fo,fr,fur,ga,gez,gl,gu,haw,he,hi,hr,hu,hy,id,is,it,ja,ka,kk,km,kn,ko,kok,ku,ky,lg,lt,lv,mg,mi,mk,ml,mn,mr,ms,mt,nb,ne,nl,nn,no,nso,oc,or,pa,pl,ps,pt,pt_BR,qu,ro,ru,rw,si,sk,sl,so,sq,sr,sr*latin,sv,sw,ta,te,th,ti,tig,tk,tl,tr,tt,ur,urd,ve,vi,wa,wal,wo,xh,zh,zh_HK,zh_CN,zh_TW,zu}
{% endhighlight %}

Step back down to single user mode by typing

{% highlight bash %}
init 1
{% endhighlight %}

and enter the root password. Then run zerofree to zero out any free space on the disk

{% highlight bash %}
mount -o remount,ro /dev/sda1
zerofree
{% endhighlight %}

This will chug away for a couple of minutes before returning and then you can halt the virtual machine.

### Make up the box

Create a folder for the box to live and change into it. Then run

{% highlight bash %}
vagrant package --base wheezy32
{% endhighlight %}

This leaves you with a file called `package.box` which you can add into vagrant by running

{% highlight bash %}
vagrant box add FantasticDebianBox package.box
{% endhighlight %}

Now you can use the box as any other one in vagrant.
