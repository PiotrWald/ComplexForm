describe "resgistrarion process", type: :feature do
  before(:each) do
    visit '/'
    User.destroy_all

    @elements = {'Email' => 'test@test.com',
                'First name' => 'Joe',
                'Last name' => 'Doe',
                'Name' => 'Company ABC',
                'Phone number' => '+1-541-754-3010',}
  end

  context 'page has loaded properly' do
    it 'returns a 200 OK status' do
      expect(page).to have_http_status(:ok)
    end

    it 'contains header' do
      expect(page).to have_content 'Sign up'
    end

    it 'has form elements' do
      @elements.each_key do |element|
        expect(page).to have_content(element)
      end
    end
  end

  context 'filling out form and submiting' do
    context 'correctly' do
      it 'should redirect to /users' do
        @elements.each do |field, content|
          fill_in( field, with: content )
        end
        click_button 'Sign up'
        expect(page).to have_content('New user')
      end
    end
  end
end