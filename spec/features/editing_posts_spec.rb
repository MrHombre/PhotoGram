require 'rails_helper'

describe 'editing posts' do
  before do
    job = create(:post)

    visit '/'
#    find(:xpath, "//a[contains(@href,'posts/1')]").click
#    click_link 'Edit Post'
  end

  scenario 'can edit a post' do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page).to have_content('Edit Post')

    click_link 'Edit Post'
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content('Post updated hombre')
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end

  scenario "a post won't update without an attached image" do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content('Something is wrong with your form!')
  end
end
