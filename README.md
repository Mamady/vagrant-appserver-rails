# A VM for Ruby on Rails Development

## Introduction

An app to automate the setup of a RoR development environment.

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)

## How To Build The Virtual Machine

Building the virtual machine is as simple as issuing the following commands:

    git clone https://github.com/Mamady/vagrant-appserver-rails.git
    cd vagrant-appserver-rails
    vagrant up

The script will download the base box - which is 250MB+ so it will take some time depending on your connection speed. The setup itself takes less than a minute. After the installation has finished, you can access the virtual machine with

    vagrant ssh

Port 3000 in the host computer is forwarded to port 80 in the virtual machine. Thus, applications running in the virtual machine can be accessed via localhost:3000 in the host computer.

## What's In The Box

* TODO: complete this list

* nginx

* unicorn

* Git

* RVM

* Ruby 1.9.3 (binary RVM install)

* Bundler

* SQLite3, Postgres

