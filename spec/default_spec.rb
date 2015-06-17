require 'chefspec'

describe 'selenium-chromedriver::default' do
  
  let(:chef_run) do
    runner = ChefSpec::ChefRunner.new('platform' => 'windows', 'version'=> '12.04')
    runner.converge('selenium-chromedriver::default')
  end
    
  it 'should include the selenium-chromedriver recipe by default' do
    expect(chef_run).to include_recipe 'selenium-chromedriver::default'
  end

end
