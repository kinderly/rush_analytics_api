module RushAnalyticsApi
  class WordstatProjectResultParser
    def initialize(url)
      @url = url
    end

    def call
      file = Roo::Spreadsheet.open(@url, extension: 'xlsx')
      sheet = file.sheet(0)
      sheet.parse(word: sheet.row(1)[0], count: sheet.row(1)[1])
    end
  end
end
