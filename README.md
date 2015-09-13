# Testground

Rails v4.2 project playground.

## Prerequisites

Please make sure the following dependencies are installed on your machine.

 - [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
 - [Vagrant](http://www.vagrantup.com/downloads.html)

## Quickstart

*Windows users: You will need to follow [this guide](https://bitbucket.org/DrPheltRight/testground/src/master/WINDOWS.md) first.*

 1. Install the Vagrant omnibus plugin with `vagrant plugin install vagrant-omnibus`
 2. Bootup vagrant with `vagrant up` (will take a while the first time)
 3. SSH into vagrant with `vagrant ssh`
 4. Change into project dir with `cd /var/www`
 5. Install dependencies with `bundle install` (if you get an "is not installed" error run `rbenv local 2.2.1` and try again)
 7. Setup DB with `bundle exec rake db:setup`
 8. Start development server with `bundle exec rails s`
 9. Navigate to [http://localhost:3000](http://localhost:3000)

## Development

### Starting work

If you have just run through the quickstart you should have vagrant started
with the development server running in a terminal. You're ready to work. If
however you've come back a day later and are wondering where to get started then
you're in the right place.

 1. Ensure vagrant is started with `vagrant up`
 2. SSH into vagrant with `vagrant ssh`
 3. Change into project dir with `cd /var/www`
 4. Start development server with `bundle exec rails s`
 5. Navigate to [http://localhost:3000](http://localhost:3000)


### Common tasks

#### Resetting database

```
bundle exec rake db:reset
```

### Resources

 - [Rails Guides](http://guides.rubyonrails.org)
 - [Writing better specs/tests](http://betterspecs.org/)

### Testing

```
bundle exec rspec
```

### Feature specs

You will find feature specs in `spec/features`.

```
bundle exec rspec spec/features
```

### Unit specs

You will find feature specs in `spec/unit`.

```
bundle exec rspec spec/unit
```
