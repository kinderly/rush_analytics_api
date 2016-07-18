module RushAnalyticsApi
  class CreateTop10Project
    ACTION = :rushapi__create_top10_project
    def initialize(options = {})
      @message = Hash.new.tap do |msg|
        # name - имя проекта
        msg['name'] = options[:name]
        # keywords - массив ключевых слов
        msg['keywords'] = { 'arr' => options[:keywords] }
        # provider - поисковая система (Google - 1, Yandex - 0)
        msg['provider'] = options[:provider]
        # country - страна
        msg['country'] = options[:country] || '.ru'
        # region - регион.
        #   Для Google оставляем пустым.
        #   Для Yandex - 213 (Москва), 225 (Россия)
        msg['region'] = options[:provider] == 1 ? '' : options[:region]
        # lang - Язык
        msg['lang'] = options[:lang] || 'ru'
        # newlogic - Эксперт опция для сбора данных в Google
        msg['newlogic'] = options[:new_logic] || 0
        # params - массив дополнительных параметров
        #   Для Google -
        #     [
        #       1 - количество найденных документов
        #       0 - собрать ключевые слова
        #     ]
        #   Для Yandex -
        #     [
        #       0 - количество найденных документов
        #       0 - собрать ключевые слова
        #       0 - сбор количества обьявления в ЯндексДирект
        #       1 - регион
        #       1 - подсчитать расширенные сниппеты
        #     ]
        msg['params'] = { 'arr' => options[:params] }
      end
    end

    def call(api_key = nil)
      res = Request.new(ACTION, api_key, @message).call
      res.body[:rushapi__create_top10_project_response][:return]
    end
  end
end
