# frozen_string_literal: true

class ActorGenerator < ::Rails::Generators::NamedBase
  def self.source_root
    File.expand_path('templates', __dir__)
  end

  def generate
    template 'actor.erb',
              File.join('app/actors', class_path, "#{file_name}.rb")

    template 'spec.erb',
              File.join('spec/actors', class_path, "#{file_name}_spec.rb")
  end
end
