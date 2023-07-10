# frozen_string_literal: true

RSpec.describe ServiceActor::Rails do
  let(:rails_new) do
    # We can also probably `--skip-sprockets` but currently a
    # `config.assets.quiet = true`

    <<~COMMAND
      bundle exec rails new example --minimal
      echo hello
    COMMAND
  end

  let(:gemfile) do
    <<~GEMFILE
      gem 'rails'
      gem 'service_actor-rails', path: '../../..'
    GEMFILE
  end

  before do
    run_command_and_stop rails_new
    cd 'example'
    write_file 'Gemfile', gemfile
    run_command_and_stop 'bundle install'
  end

  describe 'the "rails generate actor" command' do
    let(:actor_path) { 'app/actors/pay_order.rb' }
    let(:spec_path) { 'spec/actors/pay_order_spec.rb' }

    let(:expected_actor_file) do
      <<~ACTOR_FILE
        # frozen_string_literal: true

        class PayOrder < Actor
          def call
          end
        end
      ACTOR_FILE
    end

    let(:expected_spec_file) do
      <<~SPEC_FILE
        # frozen_string_literal: true

        require 'rails_helper'

        RSpec.describe PayOrder, type: :actor do
          describe '.call' do
            pending "add some examples to (or delete) \#{__FILE__}"
          end
        end
      SPEC_FILE
    end

    it 'creates an actor and the corresponding spec' do
      run_command_and_stop 'bin/rails generate actor pay_order'

      expect(actor_path).to be_an_existing_file
      expect(actor_path).to have_file_content(expected_actor_file)

      expect(spec_path).to be_an_existing_file
      expect(spec_path).to have_file_content(expected_spec_file)
    end

    it 'requires a name' do
      run_command_and_stop 'bin/rails generate actor'

      expect(last_command_started.stdout)
        .to include('rails generate actor NAME')
    end

    context 'with a namespace' do
      let(:actor_path) { 'app/actors/orders/pay.rb' }
      let(:spec_path) { 'spec/actors/orders/pay_spec.rb' }

      let(:expected_actor_file) do
        <<~ACTOR_FILE
          # frozen_string_literal: true

          class Orders::Pay < Actor
            def call
            end
          end
        ACTOR_FILE
      end

      let(:expected_spec_file) do
        <<~SPEC_FILE
          # frozen_string_literal: true

          require 'rails_helper'

          RSpec.describe Orders::Pay, type: :actor do
            describe '.call' do
              pending "add some examples to (or delete) \#{__FILE__}"
            end
          end
        SPEC_FILE
      end

      it 'creates an actor and the corresponding spec' do
        run_command_and_stop 'bin/rails generate actor orders/pay'

        expect(actor_path).to be_an_existing_file
        expect(actor_path).to have_file_content(expected_actor_file)

        expect(spec_path).to be_an_existing_file
        expect(spec_path).to have_file_content(expected_spec_file)
      end
    end
  end
end
