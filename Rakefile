# -*- coding: utf-8 -*-
require File.join(File.dirname(File.expand_path(__FILE__)), %w{ lib egotter })
require 'spec/rake/spectask'

namespace :db do
  desc "migrate egotter's database (default: test, recent)"
  task :migrate, [:environment, :version] do |t, args|
    require 'sequel/extensions/migration'
    args.with_defaults(:environment => 'test', :version => nil)
    options = Hash.new
    options.store :version, args.version.to_i if args.version
    DB = db_connect args.environment
    Sequel::Migrator.run(DB, File.join(EGOTTER_ROOT, 'migrations'), options)
  end

  desc "show version of database maigration (default: test)"
  task :status, [:environment] do |t, args|
    args.with_defaults(:environment => 'test')
    DB = db_connect args.environment
    version = DB[:schema_info].first[:version]
    puts "Database Version: #{version} (environment: #{args.environment})"
  end
end

desc "run spec"
task :spec => 'spec:all'
namespace :spec do
  Spec::Rake::SpecTask.new do |t|
    t.name    = :all
    t.verbose = true
    t.spec_opts = ['-fs', '-c']
  end
end
