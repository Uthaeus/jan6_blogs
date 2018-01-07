require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit blogs_path
      expect(blog.status_code).to eq(200)
    end
  end
end