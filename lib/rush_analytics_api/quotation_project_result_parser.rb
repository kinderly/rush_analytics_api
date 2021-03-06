module RushAnalyticsApi
  class QuotationProjectResultParser
    def initialize(url)
      @url = url
    end

    def call
      tmp_file = open(@url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE)
      file = Roo::Spreadsheet.open(tmp_file, extension: 'xlsx')
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
