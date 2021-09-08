require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookMarks
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # 自作のlibを読み込む
    config.paths.add 'lib', eager_load: true
    # デフォルトlocaleを変更
    config.i18n.default_locale = :ja
    # システムの時刻を日本に変更
    config.time_zone = 'Tokyo'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    # 自動的にslimファイルを生成する
    config.generators.template_engine = :slim
    config.autoload_paths += Dir["#{config.root}/lib"]
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]
  end
end
