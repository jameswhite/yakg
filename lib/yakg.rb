class Yakg
  module Misc
    rv = RUBY_VERSION.match(/^1.8/) ? "1.8" : "1.9.1"
    VENDOR_GEM_DIR =
      File.expand_path(File.join(File.dirname(__FILE__),
                                 "..", "vendor", "gems", "ruby", rv))
  end
end

require "yakg/backend"

class Yakg
  @@DEFAULT_SERVICE_NAME = "ruby-yakg-gem"
  def self.DEFAULT_SERVICE_NAME= x; @@DEFAULT_SERVICE_NAME = x; end
  def self.DEFAULT_SERVICE_NAME ; @@DEFAULT_SERVICE_NAME; end
  
  def self.set acct, value, svc=@@DEFAULT_SERVICE_NAME
    Backend.set acct, value, svc
  end

  def self.get acct, svc=@@DEFAULT_SERVICE_NAME
    Backend.get acct, svc
  end

  def self.unset acct, svc=@@DEFAULT_SERVICE_NAME
    Backend.delete acct, svc
  end

  def self.list svc=@@DEFAULT_SERVICE_NAME
    Backend.list svc
  end
  
end
