# Encoding: utf-8

require 'spec_helper'

describe 'yum-mysql-community::default' do
  context 'yum-mysql-community::default uses default attributes' do
    let(:chef_run) { ChefSpec::Runner.new(:step_into => ['yum_repository']).converge(described_recipe) }

    context 'removing stock configuration files' do
      it 'deletes yum_repository[mysql-community]' do
        expect(chef_run).to delete_yum_repository('mysql-community')
      end

      it 'steps into yum_repository and deletes file /etc/yum.repos.d/mysql-community.repo' do
        expect(chef_run).to delete_file('/etc/yum.repos.d/mysql-community.repo')
      end
    end

    context 'rendering centos yum channel repositories' do
      %w{ mysql-community}.each do |repo|
        it "creates yum_repository[#{repo}]" do
          expect(chef_run).to create_yum_repository(repo)
        end

        it "steps into yum_repository and creates template[/etc/yum.repos.d/#{repo}.repo]" do
          expect(chef_run).to render_file("/etc/yum.repos.d/#{repo}.repo")
        end
      end
    end

  end
end
