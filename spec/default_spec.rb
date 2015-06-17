require 'chefspec'

describe 'chocolatey-chrome::default' do
  
  let(:chef_run) do
    runner = ChefSpec::ChefRunner.new('platform' => 'windows', 'version'=> '12.04')
    runner.converge('chocolatey-chrome::default')
  end
    
  it 'should include the chocolatey-chrome recipe by default' do
    expect(chef_run).to include_recipe 'chocolatey-chrome::default'
  end

end
