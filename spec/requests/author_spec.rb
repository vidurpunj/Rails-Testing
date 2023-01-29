require 'rails_helper'

RSpec.describe "In authors", type: :request do

  describe "get /authors/index" do
    # pending "add some examples (or delete) #{__FILE__}"
    it "Populates all authors" do
      expect(get '/authors').to render_template(:index)
    end
  end

  describe "get /authors/:id" do
    before { @author = Author.create(name: "Vidur Punj", age: 34, dob: "23:08:1989", gender: true) }

    it "Get a particluar author" do
      expect(get "/authors/#{@author.id}").to render_template(:show)
    end
  end

  describe "create new author" do
    it "create new author" do
      previous_author_count = Author.all.count
      @author = Author.create({ name: "Vidur Punj", age: 34, dob: "23:08:1989", gender: true })
      new_author_count = Author.all.count
      expect(new_author_count).to eq(previous_author_count + 1)
      expect(@author).to eq(Author.last)
      # kind of
      expect(@author).to be_kind_of(Author)
      # symbol
      expect(Author.all.count).to be > 1
      # between
      expect(Author.all.count).to be_between(1,9999)
      # empty
      expect(Author.all).not_to be_empty
    end
  end

  describe "edit" do
    before(:each) do
      @author = Author.create({name: "Chetan Punj", age: 35, dob:"23:08:1989", gender: true })
    end

    it "page" do
      expect(get "/authors/#{@author.id}/edit").to render_template(:edit)
    end
  end

  describe "update" do
    before(:each) do
      @author = Author.create({name: "Chetan Punj", age: 35, dob:"23:08:1989", gender: true })
    end

    it "send the update request" do
      @author.update(name: "Vidur Punj")
      expect(@author.name).to eq("Vidur Punj")
    end
  end


  describe "delete an author" do
    ## hooks
    before :each do
      Author.create({ name: "Vidur Punj", age: 34, dob: "23:08:1989", gender: true })
    end

    it "Delete a specific user" do
      total = Author.all.count
      @deleted_author = Author.last.destroy
      new_total = Author.all.count
      # count check
      expect(new_total).to eq(total - 1)
      # object check
      expect(@deleted_author).to eq(@deleted_author)
    end
  end

  after :all do
    # Deling all authors created inside this controller
    Author.where(name: "Vidur Punj").destroy_all
  end

end
