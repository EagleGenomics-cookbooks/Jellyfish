
describe file('/usr/local/jellyfish-1.1.11') do
  it { should be_directory }
end

describe command('which jellyfish') do
  its(:exit_status) { should eq 0 }
end

describe command('jellyfish --version') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match('jellyfish 1') }
end
