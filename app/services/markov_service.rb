class MarkovService
  attr_accessor :text, :table
  def initialize(text: text)
    @text = text
    @table = {}
  end
  
  def make_markov_table
    mecab = Natto::MeCab.new('-Owakati')
    data = ['BEGIN', 'BEGIN']
    mecab.parse(@text) do |text|
      data << text.surface unless text.surface.blank?
    end
    data << "END"
    
    data.each_cons(3).each do |d|
      suffix = d.pop
      prefix = d
      @table[prefix] ||= []
      @table[prefix] << suffix
      # @table << { d[0] => { d[1] => suffix } }
    end
  end
  
  def result
    make_markov_table
    result = ""
    prefix = ["BEGIN","BEGIN"]
    loop {
      n = @table[prefix].length
      prefix = [prefix[1], @table[prefix][Random.rand(0..n-1)]]
      result += prefix[0] if prefix[0] != 'BEGIN'
      if @table[prefix].last == 'END'
        result += prefix[1]
        break
      end
    }
    result
  end
end