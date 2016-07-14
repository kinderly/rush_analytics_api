module RushAnalyticsApi
  class CreateWordstatProject
    ACTION = :rushapi__create_wordstat_project

    def initialize(options = {})
      # regionid - код региона Яндекс Wordstat
      # name - название проекта
      # collecttype - Тип сбора данных
      #   0:сбор частотностей ключевых слов,
      #   1: Сбор левой колонки Wordstat
      # pages - Сколько нужно спарсить страниц левой колонки Wordstat
      #   0-10 или 40(все)
      #   Если выбран парсинг частотнности - 0, эта переменная не нужна
      # normal - Базовая частотность - без кавычек и ! (0/1)
      # quotationmark - Частотность в кавычках, например "автосервис" (0/1)
      # exclamation - Точная частотность, например: "!автосервис"
      # minwordstat - Автоматически подставить 0 для частотностей вида
      #   "автосервис" и "!автосервис", если базовая частотность меньше чем
      #   значение этой переменной
      # keywords - ключевые слова, по которым вы хотите собрать данные(массив)
      # stopwords - стоп слова (массив)
      @message = Hash.new.tap do |msg|
        msg['name'] = options[:name]
        msg['regionid'] = options[:region_id].to_s || '213'
        msg['collecttype'] = options[:collect_type]
        msg['pages'] = options[:pages]
        msg['normal'] = options[:normal]
        msg['quotationmark'] = options[:quotation_mark]
        msg['exclamation'] = options[:exclamation]
        msg['minwordstat'] = options[:min_word_stat]
        msg['keywords'] = { 'arr' => options[:keywords] }
        msg['stopwords'] = { 'arr' => options[:stopwords] }
      end
    end

    def call
      res = Request.new(ACTION, @message).call
      res.body[:rushapi__create_wordstat_project_response][:return]
    end
  end
end
