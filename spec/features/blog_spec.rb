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

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path

      click_link("new_blog_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      visit blog_path

      click_link("delete_blog_#{@blog.id}_from_index")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'edit' do
    it 'can be reached by clicking on edit in index page' do
      visit blogs_path

      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
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