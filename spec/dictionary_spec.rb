require 'rspec'
require 'dictionary'

describe Term do

  before do
    Term.clear
  end

  it 'should initialize the Term object with a word and definition' do
    new_term = Term.new("idiot", "a stupid person")
    new_term.should be_an_instance_of Term
  end

  it 'should contain the word and definition' do
    new_term = Term.new("idiot", "a stupid person")
    new_term.word.should eq 'idiot'
  end

  it 'should save the term' do
    new_term = Term.new("idiot", "a stupid person")
    new_term.save
    Term.all.should eq [new_term]
  end

  it 'is empty at first' do
    new_term = Term.new("idiot", "a stupid person")
    Term.all.should eq []
  end

  it 'should clear the list of terms' do
    Term.new('idiot', "a stupid person")
    Term.clear
    Term.all.should eq []
  end

  it 'should search for a word and return its object' do
    new_term = Term.create('idiot', 'a stupid person')
    Term.search('idiot').should eq new_term
  end


  describe '.create' do
    it 'should create an a new term' do
      new_term = Term.create('idiot', 'a stupid person')
      new_term.should be_an_instance_of Term
    end

    it 'should create an a new term' do
      new_term = Term.create('idiot', 'a stupid person')
      Term.all.should eq [new_term]
    end
  end
end
