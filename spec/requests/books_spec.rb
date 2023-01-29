require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /books" do
    it "visit /books" do
      visit books_path
      expect(page).to have_content("Books")
    end
  end

  describe "get /book/:id" do
    before :each do
      @book = Book.create(name: "Ruby", language: "English")
    end

    it "get Book.last.id" do
      visit book_path(@book)
      expect(page).to have_content("Book Details")
    end
  end

  describe "Create new book." do
    it "Gives error if required fields are blank." do
      visit new_book_path
      click_button("Create Book") # It is case senstive
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Language can't be blank")
    end

    it "Create new book, on filling the complete data" do
      visit new_book_path
      fill_in "Name", with: "Ruby" # Name of the label
      fill_in "Language", with: "English" # Name of the label
      click_button("Create Book")
      expect(page).to have_content("Book was successfully created.")
      expect(Book.last.name).to eq("Ruby")
    end
  end

  describe "Edit book" do
    before :each do
      @book = Book.create({ name: "CSS", language: "english" })
    end

    it "open the edit book page" do
      visit edit_book_path(@book)
      expect(page).to have_content("Editing book")
    end
  end

  describe "update an book" do
    before :each do
      @book = Book.create({ name: "Python", language: "English" })
    end

    it "update the created book" do
      visit book_path(@book)
      expect(page).to have_content("Book Details")
      click_link("Edit") # instead of Edit this book
      fill_in "Name", with: "Java"
      click_button "Update Book"
      expect(page).to have_content("Book was successfully updated.")
    end
  end

  describe "delete book" do
    before :each do
      @book = Book.create({ name: "C++", language: "english" })
    end
    it "Remove book from database" do
      visit book_path(@book)
      click_button "Destroy this book"
      expect(page).to have_content("Book was successfully destroyed.")
    end
  end
end
