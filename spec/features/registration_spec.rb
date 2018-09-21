describe "resgistrarion process", type: :feature do
  before(:each) do
    visit '/'
    @elements = {'Email' => 'test122@test.com',
                'First name' => 'Joe',
                'Last name' => 'Doe',
                'Company' => nil,
                'Name' => 'Company ABC',
                'Address' => nil,
                'Phone number' => '+1-541-754-3010',}
  end

  context 'page has loaded properly' do
    it 'returns a 200 OK status' do
      expect(page).to have_http_status(:ok)
    end

    it 'contains header' do
      expect(page).to have_content 'Sign up'
    end

    it 'has all form elements' do
      @elements.each_key do |element|
        expect(page).to have_content(element)
      end
    end
  end

  context 'filling out form and submiting' do
    context 'correctly' do
      it 'should return successful response' do
        @elements.each do |field, content|
          fill_in( field, with: content ) unless content.nil?
        end
        click_button 'Sign up'
        expect(page).to have_content('New user')
      end
    end
  end
end