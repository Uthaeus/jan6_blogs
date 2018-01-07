require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit blogs_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Blogs' do
      visit blogs_path
      expect(page).to have_content(/Blogs/)
    end
  end

  describe 'creation' do
    before do
      visit new_blog_path
    end

    it 'has a form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'blog[title]', with: 'A title'
      fill_in 'blog[date]', with: Date.today
      fill_in 'blog[body]', with: "A little bit of content"
      click_on "Save"

      expect(page).to have_content("A little bit of content")
    end
  end
end