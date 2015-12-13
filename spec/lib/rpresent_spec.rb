require_relative '../spec_helper'

describe RPresent do

  describe RPresent::Base do
    TestPresenter = Class.new(RPresent::Base)

    let(:object)    { TestObject.new }
    let(:view_context)  { TestViewContext.new }
    let(:presenter) { TestPresenter.new(object, view_context) }

    it 'has custom method for object name' do
      expect(presenter.test_object).to eql object
    end

    it 'delegates to object' do
      expect(presenter.my_name).to eql object.my_name
    end

    it 'delegates to template' do
      expect(presenter.render('test')).to eql 'test'
    end

    it 'delegates to view helpers' do
      expect(view_context).to receive(:helper_method)
      presenter.helper_method
    end

    describe 'built in helper methods' do

      describe '#h' do
        it 'shortcut to the view context' do
          expect(presenter.h).to eql view_context
        end
      end

      describe '#unless_nil' do

        it 'does not yield if content nil' do
          expect do
            presenter.unless_nil nil do
              raise StandardError
            end
          end.to_not raise_error
        end

        it 'yields if content is not nil' do
          expect do
            presenter.unless_nil 1 do
              raise StandardError
            end
          end.to raise_error(StandardError)
        end

      end

      describe '#partial' do

        describe 'default path builder' do

          it 'absolute partial path' do
            partial_path = presenter.partial('/test')[:partial]
            expect(partial_path).to eql '/test'
          end

          it 'default partial path' do
            partial_path = presenter.partial('test')[:partial]
            expect(partial_path).to eql 'test_object/presenter/test'
          end

        end


        it 'passes correct partial locals' do
          locals = presenter.partial('test')[:locals]
          expect(locals).to eql({ presenter: presenter, test_object: object })
        end

      end

    end






  end

end
