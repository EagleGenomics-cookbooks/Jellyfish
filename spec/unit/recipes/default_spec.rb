#
# Cookbook Name:: Jellyfish
# Spec:: default
#
# Copyright (c) 2016 Eagle Genomics Lts, Apache License, Version 2.0

require 'spec_helper'

describe 'Jellyfish::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    # make sure the converge works
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    # check that tar is installed
    it 'installs tar' do
      expect(chef_run).to install_package('tar')
    end

    # make sure that the tar file is downloaded
    it 'downloads tar file' do
      expect(chef_run).to run_execute('Extract Jellyfish files')
    end

    it 'runs make install' do
      expect(chef_run).to run_bash('Build Jellyfish')
    end
  end
end
