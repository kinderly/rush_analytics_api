module RushAnalyticsApi
  class QuotationProjectResultParser
    def initialize(url)
      @url = url
    end

    def call
      file = Roo::Spreadsheet.open(@url, extension: 'xlsx')
      sheet = file.sheet(0)
      sheet.parse(
        word: 'Ключевое слово',
        total_count: 'Общая частотность',
        partial_count: 'Частичное вхождение',
        exact_count: 'Точное вхождение'
      ).reject { |row| row[:total_count].is_a? String }
    end
  end
end
