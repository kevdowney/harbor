# Senary Harbor

Vagrant virtual environment for Senary Framework and Hack language. Includes:

- HHVM (fastcgi)
- Nginx
- Mysql
- Composer
- Git

-------------------------------------------------------------------------------------------

### Installation

Make sure you have [https://www.virtualbox.org/](VirtualBox) and [http://www.vagrantup.com/](Vagrant) installed.

Add the `senary/harbor` box:

    $ vagrant add box senary/harbor


Clone the harbor repository to a central location, such as `~/harbor`:

    $ git clone https://github.com/senary/harbor ~/to-wherever-you-want

In `settings.yml` add the path to your public/private key. If you do not have one you can run:

    $ ssh-keygen -t rsa -C "your@email.com"

Setup your shared folders.
- `from` is the path to a folder on your host machine
- `to` is the path that the from folder will be mapped to on the guest machine

Setup sites.
- `url` is the server_name value for nginx
- `root` is the path on the guest machine to the app root

----------------------------------------------------------------------------

### Connecting to Harbor

SSH: *(if you changed the ip in settings.yml, use that value instead)*

    $ ssh vagrant@192.168.22.22

    $ # you can also use the forwarded ports from settings.yml
    $ ssh vagrant@127.0.0.1 -p 2222


MySQL:
- username is root
- password is root
- Either connect to 192.168.22.22 on port 3306 (or different ip from settings.yml)
- Can also connect via localhost at port 33060

----------------------------------------------------------------------------

**This is essentially a port of Laravel Homestead, for HHVM and Hack**
*See [http://laravel.com/docs/homestead](http://laravel.com/docs/homestead)*
