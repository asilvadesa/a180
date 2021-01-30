module Helpers
  def get_fixtures(item)
    YAML.load(File.read(Dir.pwd + "/spec/fixtures/#{item}.yml"), symbolize_names: true)
  end

  def get_thumbnail(file_name)
    return File.open(File.join(Dir.pwd, "spec/fixtures/images", file_name), "rb")
  end
  module_function :get_thumbnail
  module_function :get_fixtures
end
