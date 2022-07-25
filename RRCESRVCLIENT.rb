#!/usr/bin/ruby

require 'drb'

class SHELL
    def exec(cmd)
        '#{cmd}'
    end
end

win = ACL.new(%w{deny all

allow localhost
allow 192.168.1.*})

DRb.install_acl(win)
DRb.start_services("druby://0.0.0.0:8080", SHELL.new)
DRb.thread.join

