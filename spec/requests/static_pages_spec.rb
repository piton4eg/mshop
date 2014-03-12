require 'spec_helper'

describe 'Static pages' do
  describe 'Root page' do
    it 'should have main title' do
      visit '/'
      expect(page).to have_content('Интернет-магазин')
    end
  end

  describe 'About page' do
    it 'should have about h1' do
      visit '/about'
      expect(page).to have_content('О каталоге')
    end

    it 'should have about title' do
      visit '/about'
      expect(page).to have_title('Интернет-магазин | О каталоге')
    end
  end

  describe 'Contact page' do
    it 'should have contact h1' do
      visit '/contact'
      expect(page).to have_content('Контакты')
    end

    it 'should have contact title' do
      visit '/contact'
      expect(page).to have_title('Интернет-магазин | Контакты')
    end
  end
end
