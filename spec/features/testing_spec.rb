feature "Starting page title" do
  scenario "starting page" do
    visit("/")
    expect(page).to have_content "Hello there!"
  end
end
