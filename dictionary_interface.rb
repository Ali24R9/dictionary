require './lib/dictionary'

  def main_menu

    print "\n Main Menu: \n"
    print "\t n - New Word"
    print "\t s - Search or Edit or Delete Word"
    print "\t l - List Words"
    print "\t x - Exit \n"

    input = gets.chomp
    puts "\e[H\e[2J"

    case input.downcase
      when 'n'
        new_word
      when 's'
        search_word
      when 'l'
        list_words
      when 'x'
        puts 'See you later alligator.'
    end
  end

  def new_word
    print "Enter a word: "
    word = gets.chomp
    print "Enter a definition: "
    definition = gets.chomp
    Term.create(word, definition)
    puts "\n***************************************************"
    puts "Your word has been stored safely in our word vault!"
    puts "***************************************************"
    main_menu
  end

  def list_words
    Term.all.each_with_index do |term, index|
      print "#{index + 1}. #{ term.word}: "
      puts "#{ puts term.definitions}"
      puts ''
    end
    puts "s - select a word to view or edit"
    puts "m - main menu"

    input = gets.chomp

    if input == 's'
      puts 'Enter the number of the word you wish to edit'
      entry = gets.chomp.to_i
      term = Term.search(Term.all[entry-1].word)
      puts "------------------------------------"
      puts "#{term.word}: \n"
      term.definitions.each { |definition| puts "• #{definition}" }
      puts "------------------------------------"
      edit_menu(term)
    elsif input == 'm'
      main_menu
    else
      'invalid entry'
      list_words
    end
  end

  def search_word
    puts "Enter a word to search: "
    word = gets.chomp

    term = Term.search(word)
    puts "------------------------------------"
    puts "#{term.word}: \n"
    term.definitions.each { |definition| puts "• #{definition}" }
    puts "------------------------------------"
    edit_menu(term)
  end

  def edit_word(term)
    puts "w - edit the word"
    puts "d - edit the definition"
    puts "a - add a definition"
    puts "m - main menu"

    input = gets.chomp

    if input == "w"
      puts "Type the replacement word: "
      replace = gets.chomp
      term.word = replace
      puts "Your word has been edited!"
      list_words
    elsif input == "d"
      puts "Type the replacement description: "
      replace = gets.chomp
      term.definitions = replace
      puts "Your word has been edited!"
      list_words
    elsif input == 'a'
      puts "Add definition: "
      definition = gets.chomp
      add_def(term, definition)
      puts "definition added!"
      edit_word(term)
    elsif input == 'm'
      main_menu
    else
      "invalid entry"
      edit_word(term)
    end
  end

  def delete_word(term)
    puts "type the word to delete"
    word = gets.chomp

    term = Term.search(word)
    puts "------------------------------------"
    puts "#{term.word}: \n"
    term.definitions.each { |definition| puts "• #{definition}" }
    puts "------------------------------------"
    puts "are you sure you want to delete?????? y/n"

    input = gets.chomp
    if input == "y"
      Term.all.delete(term)
      puts "DELETED!!!!!"
      main_menu
    else
      main_menu
    end
  end

  def add_def(term, definition)
    term.add_definition(definition)
  end

  def edit_menu(term)
    puts "e - edit the word"
    puts "d - delete the word"
    puts "m - main menu"
    input = gets.chomp

    if input == 'e'
      edit_word(term)
    elsif input == 'd'
      delete_word(term)
    elsif input == 'm'
      main_menu
    else
      'invalid entry'
      edit_menu(term)
    end
  end


main_menu
