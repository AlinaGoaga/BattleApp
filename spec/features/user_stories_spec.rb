feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'Mario vs. Luigi'
  end
end

feature 'View hit points' do
  scenario 'see Player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Luigi: 60HP'
  end
end

feature 'Attacking' do
  scenario 'attacking Player 2 removes 10 points from its hit points' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Mario attacked Luigi'
    expect(page).not_to have_content 'Luigi: 60HP'
    expect(page).to have_content 'Luigi: 50HP'
  end
end
