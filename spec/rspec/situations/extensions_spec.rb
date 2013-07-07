require 'spec_helper'

describe RSpec::Situations::ClassExtensions do

	describe 'description' do
		situation( :this ){ @this = 1 }
		situation( :that ){ @that = 2 }
		situation( :other, 'the other' ){ @other = 3 }

		context 'without situation' do
			subject{ example.metadata[:full_description] }

			it{ should_not match 'this'      }
			it{ should_not match 'that'      }
			it{ should_not match 'the other' }
		end

		describe_situation :this, :that, :other do
			subject{ example.metadata[:full_description] }

			it{ should match 'this'      }
			it{ should match 'that'      }
			it{ should match 'the other' }
			it{ should match 'RSpec::Situations::ClassExtensions description' }
		end

		describe_situation :this, 'with description' do
			subject{ example.metadata[:full_description] }

			it{ should_not match 'this'         }
			it{ should match 'with description' }
			it{ should match 'RSpec::Situations::ClassExtensions description' }
		end

		describe 'using situations from previous contexts' do
			situation( :local ){ @local = 'local' }

			describe_situation :foo_is_test, :local do
				subject{ example.metadata[:full_description] }

				it{ should match 'foo_is_test and local' }
			end
		end
	end


	describe 'block calls' do
		situation( :foo_is_test ){ @foo = 'test' }
		situation( :bar_is_best ){ @bar = 'best' }
		situation( :hairy_is_chest, 'the chest is hairy' ){ @hairy = 'chest' }

		it 'does not call the blocks' do
			@foo.should be_nil
		end

		describe_situation :foo_is_test do
			it( 'calls the block' ){ @foo.should_not be_nil }
		end

		describe_situation :foo_is_test, :bar_is_best do
			it( 'calls the first block'  ){ @foo.should_not be_nil }
			it( 'calls the second block' ){ @bar.should_not be_nil }
		end

		describe_situation :foo_is_test, :hairy_is_chest do
			it{
				@foo.should_not   be_nil
			}
			it{ @hairy.should_not be_nil }
			it{ @bar.should       be_nil }
		end

		describe 'situation ordering' do
			situation( :first  ){ @var = 'first'  }
			situation( :second ){ @var = 'second' }

			describe_situation :first, :second do
				subject{ @var }
				it{ should == 'second' }
			end
		end

		describe 'using situations from previous contexts' do
			situation( :local ){ @local = 'local' }

			describe_situation :foo_is_test, :local do
				it{ @local.should == 'local' }
				it{ @foo.should   == 'test'  }
			end
		end
	end
end
