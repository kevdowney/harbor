# Senary Harbor

*Code and ideas taken from Laravel's Homestead (see link at bottom)*

Vagrant virtual environment for Senary Framework and Hack language. Includes:

- HHVM (fastcgi)
- Nginx
- Node (w/ npm)
- Mysql
- Composer
- Git


### Installation

Add the `senary\harbor` *VirtualBox*:

    $ vagrant add box senary/harbor


Setup vagrant:

    $ git clone https://github.com/senary/harbor

Configure settings in `settings.yaml` and run `vagrant up`

----------------------------------------------------------------------------

**This is essentially a port of Laravel Homestead, for HHVM and Hack**
*See http://laravel.com/docs/homestead?version=4.2*
