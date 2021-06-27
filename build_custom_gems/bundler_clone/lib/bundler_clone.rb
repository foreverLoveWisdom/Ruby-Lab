require 'bundler_clone/version'

module Bundler
  class << self
    def configure
      @configured ||= configure_gem_home_and_path
    end
  end

  private

  def configure_gem_home_and_path
    configure_gem_path
    configure_gem_home
    bundle_path
  end

  def configure_gem_path(env = ENV)
    blank_home = env['GEM_HOME'].nil? || env['GEM_HOME'].empty?
    if !use_system_gems?
      # this needs to be empty string to cause
      # PathSupport.split_gem_path to only load up the
      # Bundler --path setting as the GEM_PATH.
      env['GEM_PATH'] = ''
    elsif blank_home
      possibles = [Bundler.rubygems.gem_dir, Bundler.rubygems.gem_path]
      paths = possibles.flatten.compact.uniq.reject(&:empty?)
      env['GEM_PATH'] = paths.join(File::PATH_SEPARATOR)
    end
  end
end
