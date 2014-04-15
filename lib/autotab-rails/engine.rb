module AutoTab
  module Rails
    class Engine < ::Rails::Engine
      rake_tasks do
        load 'autotab-rails/tasks.rake'
      end
    end
  end
end
