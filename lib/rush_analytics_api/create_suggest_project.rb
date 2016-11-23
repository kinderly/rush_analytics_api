module RushAnalyticsApi
  class CreateSuggestProject
    ACTION = :rushapi__create_suggest_project
    def initialize(options = {})
      @message = {}.tap do |msg|
        # name - имя проекта
        msg['name'] = options[:name]
        # google - Сбор подсказок Google (1 - собирать, 0 - не собирать)
        msg['google'] = options[:google]
        # yandex - Сбор подсказок Yandex (1 - собирать, 0 - не собирать)
        msg['yandex'] = options[:yandex]
        # mail - Сбор подсказок Mail.ru (1 - собирать, 0 - не собирать)
        msg['mail'] = options[:mail]
        # google_country - Региональный домен Google
        msg['google_country'] = options[:google_country]
        # yandex_region - Код региона Яндекса
        msg['yandex_region'] = options[:yandex_region]
        # max_depth - Глубина парсинга (1-3)
        msg['max_depth'] = options[:max_depth] || 3
        # normal - сбор подсказов по исходному ключевому слову
        # (1 - собирать, 0 - не собирать)
        msg['normal'] = options[:normal]
        # space -  Сбор подсказок по исходному ключевому слову + пробел на конце
        # (1 - собирать, 0 - не собирать)
        msg['space'] = options[:space]
        # enalpha - Сбор подсказок по исходному ключевому слову +
        # перебор английского алфавита (1 - собирать, 0 - не собирать)
        msg['enalpha'] = options[:enalpha]
        # rualpha - Сбор подсказок по исходному ключевому слову +
        # перебор русского алфавита (1 - собирать, 0 - не собирать)
        msg['rualpha'] = options[:rualpha]
        # numalpha - Сбор подсказок по исходному ключевому слову +
        # перебор цифр 0-9 (1 - собирать, 0 - не собирать)
        msg['numalpha'] = options[:numalpha]
        # keywords - Массив ключевых слов для сбора подсказок
        msg['keywords'] = { 'arr' => options[:keywords] }
        msg['stopwords'] = { 'arr' => options[:stopwords] }
      end
    end

    def call(api_key = nil)
      res = Request.new(ACTION, api_key, @message).call
      res.body[:rushapi__create_suggest_project_response][:return]
    end
  end
end
