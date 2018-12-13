feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'Mario vs. Luigi'
  end
end

feature 'View hit points' do
  scenario 'see Player 1 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Mario: 60HP'
  end

  scenario 'see Player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content 'Luigi: 60HP'
  end
end

feature 'Attacking' do
  scenario 'player 1 is attacked by player 2' do
    sign_in_and_play
    click_link 'Attack'
    click_button 'OK'
    click_link 'Attack'
    expect(page).to have_content 'Luigi attacked Mario'
  end

  scenario 'player 2 is attacked by player 1' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Mario attacked Luigi'
  end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_link 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'Luigi: 60HP'
    expect(page).to have_content 'Luigi: 50HP'
  end

  scenario 'reduce Player 1 HP by 10' do
    sign_in_and_play
    click_link 'Attack'
    click_button 'OK'
    click_link 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'Mario: 60HP'
    expect(page).to have_content 'Mario: 50HP'
  end
end

feature 'Switch turns' do
  context 'seeing the current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content "Mario's turn"
    end

    scenario 'after player 1 attacks' do
      sign_in_and_play
      click_link 'Attack'
      click_button 'OK'
      expect(page).not_to have_content "Mario's turn"
      expect(page).to have_content "Luigi's turn"
    end
  end
end
