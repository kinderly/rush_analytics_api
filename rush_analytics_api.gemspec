Gem::Specification.new do |s|
  s.name = 'rush_analytics_api'
  s.version = '0.1.3'
  s.authors = ['Kinderly LTD']
  s.email = 'pustserg@yandex.ru'
  s.homepage = 'https://github.com/kinderly/rush_analytics_api'
  s.summary = 'A wrapper for Rush Analytics API'
  s.license = 'MIT'
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'savon'
  s.add_dependency 'nokogiri'
  s.add_dependency 'nori'
  s.add_dependency 'roo'
end
