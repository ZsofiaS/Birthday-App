feature "starting page has form" do
  scenario "user can enter name and date" do
    visit("/")
    expect(page).to have_content "What's your name?"
  end
end

feature "starting page has form with name and date" do

  scenario "user enters todays date, redirects to message page and greets" do
    allow(Date).to receive(:today).and_return Date.new(2020,4,30)
    visit("/")
    fill_in "name", with: "Alice"
    fill_in "date", with: "1990-04-30T23:59:60Z"
    click_button "Go!"
    expect(page).to have_content "Happy birthday Alice!"
  end

  scenario "user enters other date, redirects to message page and greets" do
    allow(Date).to receive(:today).and_return Date.new(2020,4,28)
    visit("/")
    fill_in "name", with: "Alice"
    fill_in "date", with: "1990-04-30T23:59:60Z"
    click_button "Go!"
    expect(page).to have_content "Your birthday is in 2 days, Alice"
  end

end
