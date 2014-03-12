class Term


  attr_reader :word, :definitions
  @@all_terms = []

  def initialize(word, definition)
    @word = word
    @definitions = [definition]
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    new_term.save
    new_term
  end

  def word=(word)
    @word = word
  end

  def definition=(definition)
    @definition = definition
  end

  def Term.all
    @@all_terms
  end

  def save
    @@all_terms << self
  end

  def Term.clear
    @@all_terms = []
  end

  def Term.search(word)
    @@all_terms.each do |term|
      if term.word == word
        @search_result = term
        break
      end
    end
    @search_result
  end

  def add_definition(definition)
    @definitions << definition
  end

end

term = Term.create("idiot", "a stupid person")
cat = Term.create("cat", "an animal")
# cat.definition = "an animal with 4 legs"
# puts Term.search("cat").word

