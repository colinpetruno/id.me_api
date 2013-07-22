require 'idme'
describe IdMe::API do

  before do
    @id_me_prod = IdMe::API.new('cdc50c217d96673426','4ee6d3ab9759df1ad94348bdce3cafe3')
    @id_me_dev =  IdMe::API.new('cdc50c217d96673426','4ee6d3ab9759df1ad94348bdce3cafe3', development:true)
  end


  it 'configuration can be set' do
    @id_me_prod.client_id.should eql('cdc50c217d96673426')
    @id_me_prod.client_secret.should eql('4ee6d3ab9759df1ad94348bdce3cafe3')
  end

  it 'should be able to verify a member' do
    result = @id_me_prod.verify({first_name:'john', last_name:'testaccount', ssn:'123456789', birth_date: '1980-04-12', service_date:'2002-05-15'})
    result['verified'].should be_true
  end

  it 'should fail on invalid member' do
    result = @id_me_prod.verify({first_name:'jo2n', last_name:'wrongaccount', ssn:'123987789', birth_date: '1980-04-12', service_date:'2001-05-15'})
    result['verified'].should be_false
  end

  it 'should be in production mode' do
    @id_me_prod.development.should be_false
  end

  it 'production mode has production url' do
    @id_me_prod.base_api_url.should eql('https://api.sandbox.id.me/v2/')
  end

  it 'should be in development mode' do
    @id_me_dev.development.should be_true
  end

  it 'development mode has development url' do
    @id_me_dev.base_api_url.should eql('https://api.sandbox.id.me/v2/')
  end

end